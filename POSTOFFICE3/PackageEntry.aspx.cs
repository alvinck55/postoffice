using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class PackageEntry : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand command;
        SqlDataReader dataReader;
        string sqlQuery;
        string output;
        string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["username"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            username = Session["username"].ToString();
        }
            
        protected void Button1_Click(object sender, EventArgs e)
        {
            createPackage();
        }
        private void createPackage()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);

            conn.Open();

            sqlQuery = "INSERT INTO POSTOFFICE3.dbo.PACKAGE(Sender_ID,Cost,Types,Priority)" +
                "VALUES((SELECT POSTOFFICE3.dbo.CUSTOMER.Customer_ID FROM POSTOFFICE3.dbo.CUSTOMER WHERE POSTOFFICE3.dbo.CUSTOMER.Email= @email), '1.10',@type,@priority)";
            string type = DropDownList1.SelectedItem.ToString();
            string priority = DropDownList2.SelectedItem.ToString();
            Label1.Text = type;
            Label2.Text = priority;
            command = new SqlCommand(sqlQuery, conn);
            command.Parameters.AddWithValue("@email", username);
            command.Parameters.AddWithValue("@type", type);
            command.Parameters.AddWithValue("@priority", priority);
            int count = command.ExecuteScalar();
            if (count == 1)
            {
                Label1.Text = "Package sucessfully created";
            }
            else
            {
                Label1.Text = "Nope";
            }




            dataReader.Close();
            command.Dispose();
            conn.Close();


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}