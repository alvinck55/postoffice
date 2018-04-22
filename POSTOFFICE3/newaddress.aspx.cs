using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class New_Address : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Home.aspx");


            }
            addressStatus.Text = "Successfully created account: " + Session["username"] +"! Please enter address info: ";

        }

        protected void submitAddress_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                int zipcheck;
                int.TryParse(zipText.Text, out zipcheck);
                if (zipcheck == 0 || zipcheck > 99999)
                {
                    fieldStatus.Text = "invalid zip";
                }
                else
                {
                    string loginid = Session["username"].ToString();
                    sqlCon.Open();
                    SqlCommand sqlCmd = new SqlCommand("newaddress", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@Street", streetText.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@city", cityText.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@State", stateList.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Zip", zipText.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@aptn", aptText.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@login", loginid);

                    sqlCmd.ExecuteNonQuery();
                    Response.Redirect("Dashboard.aspx");
                }


            }

        }
    }
}