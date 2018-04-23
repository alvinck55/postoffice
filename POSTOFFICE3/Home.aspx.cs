using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel.DataAnnotations;

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
                var email = new EmailAddressAttribute();
                bool isEmail;
                isEmail = email.IsValid(usernameText.Text.Trim());

                if (isEmail == true)
                {
                    string query = "SELECT COUNT(1) FROM CUSTOMER WHERE email=@email AND password=@password";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@email", usernameText.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@password", passwordText.Text.Trim());
                    int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                    if (count == 1)
                    {
                        Session["username"] = usernameText.Text.Trim();
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        statusMessage.Text = "invalid credentials";
                    }
                }
                else
                {
                    //statusMessage.Text = "not a valid email";
                    int employeecheck;
                    int.TryParse(usernameText.Text, out employeecheck);
                    if (employeecheck == 0)
                    {
                        statusMessage.Text = "invalid username";
                    }
                    else
                    {
                        statusMessage.Text = "valid id";
                        string query = "SELECT COUNT(1) FROM EMPLOYEES WHERE Employee_ID=@employeeID AND password=@password";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@employeeID", usernameText.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@password", passwordText.Text.Trim());
                        int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                        if (count == 1)
                        {
                            Session["username"] = usernameText.Text.Trim();
                            Response.Redirect("EmployeeDashboard.aspx");
                        }
                        else
                        {
                            statusMessage.Text = "invalid credentials";
                        }
                    }
                }

            }


        }
    }
}