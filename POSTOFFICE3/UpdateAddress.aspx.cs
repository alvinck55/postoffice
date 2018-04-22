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
    public partial class UpdateAddress : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
        //SqlConnection sqlCon = new SqlConnection("Server=tcp:postoffice-dbdbserver.database.windows.net,1433;Initial Catalog=POSTOFFICE2;Persist Security Info=False;User ID={your_username};Password={your_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Home.aspx");


            }
            logText.Text = "Currently logged in as: " + Session["username"];
            if (!IsPostBack)
            {
                fillGrid();
            }
        }

        protected void stateText_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string loginid = Session["username"].ToString();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {


                
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand("updateaddress", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                //sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@Street", streetText.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@city", cityText.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@State", stateText.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Zip", zipText.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@aptn", aptnText.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@email", loginid);

                sqlCmd.ExecuteNonQuery();
                Clear();
                statusMessage.Text = "updated successfully";
            }




        }
        void Clear()
        {
            streetText.Text = cityText.Text = zipText.Text = aptnText.Text = "";
        }
        void fillGrid()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                string loginid = Session["username"].ToString();

                SqlDataAdapter sqlDa = new SqlDataAdapter("viewaddress", sqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDa.SelectCommand.Parameters.AddWithValue("@email", loginid);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                gvAddress.DataSource = dtbl;
                gvAddress.DataBind();



            }


        }
    }
}