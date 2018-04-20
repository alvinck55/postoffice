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
    public partial class Home : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submitEventMethod(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "SELECT COUNT(1) FROM CUSTOMER WHERE email=@email AND password=@password";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@email", usernameText.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@password", passwordText.Text.Trim());
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if(count == 1)
                {
                    Session["username"] = usernameText.Text.Trim();
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    statusMessage.Text = "invalid credentials";
                }

            }


        }
    }
}