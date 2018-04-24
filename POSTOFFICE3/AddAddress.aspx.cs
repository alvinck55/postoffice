using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POSTOFFICE3
{
    public partial class AddAddress : System.Web.UI.Page
    {
        SqlConnection conn;

        string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Home.aspx");


            }
            username = Session["username"].ToString();
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
                conn = new SqlConnection(connectionString);

                conn.Open();

                sqlQuery = "SELECT dbo.CUSTOMER.Customer_ID FROM dbo.CUSTOMER WHERE dbo.CUSTOMER.Email = @username";
                command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@username", username);
                dataReader = command.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        customer_id = dataReader.GetValue(dataReader.GetOrdinal("Customer_ID")).ToString();
                    }
                }
                dataReader.Close();
                command.Dispose();
                conn.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = "ERROR FOR USERNAME LOGIN";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}