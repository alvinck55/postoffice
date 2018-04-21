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
            checkAddress();
            createPackage();
        }
        private void checkAddress()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);

            conn.Open();

            sqlQuery = "IF NOT EXISTS (SELECT * FROM ADDRESS WHERE ADDRESS.Street = @Street) BEGIN " +
                "INSERT INTO ADDRESS(Facility_ID, Street, City,State,Zip,aptn,Postal_code) VALUES('1',@Street,@City,@State,@Zip,@aptn,@Postal_code) END";

                command = new SqlCommand(sqlQuery, conn);
            command.Parameters.AddWithValue("@Street", S_Address_TextBox);
            command.Parameters.AddWithValue("@City", S_City_TextBox);
            command.Parameters.AddWithValue("@State", S_State_TextBox);
            command.Parameters.AddWithValue("@Zip", S_Zip_TextBox);
            command.Parameters.AddWithValue("@aptn", S_Apt_TextBox);
            command.Parameters.AddWithValue("@Postal_code", S_Zip_TextBox);
            command.ExecuteNonQuery();

            command.Dispose();

            sqlQuery = "IF NOT EXISTS (SELECT * FROM ADDRESS WHERE ADDRESS.Street = @Street) BEGIN " +
            "INSERT INTO ADDRESS(Facility_ID, Street, City,State,Zip,aptn,Postal_code) VALUES('1',@Street,@City,@State,@Zip,@aptn,@Postal_code) END";

            command = new SqlCommand(sqlQuery, conn);
            command.Parameters.AddWithValue("@Street", R_Address_TextBox);
            command.Parameters.AddWithValue("@City", R_City_TextBox);
            command.Parameters.AddWithValue("@State", R_State_TextBox);
            command.Parameters.AddWithValue("@Zip", R_Zip_TextBox);
            command.Parameters.AddWithValue("@aptn", R_Apt_TextBox);
            command.Parameters.AddWithValue("@Postal_code", R_Zip_TextBox);
            command.ExecuteNonQuery();

            command.Dispose();
            conn.Close();

        }
        private void createPackage()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);

            conn.Open();

            sqlQuery = "INSERT INTO dbo.PACKAGE(Sender_ID,Cost,Types,Priority,Sender_Address_ID,Receiver_Address_ID)" +
                "VALUES((SELECT dbo.CUSTOMER.Customer_ID FROM dbo.CUSTOMER WHERE dbo.CUSTOMER.Email= @email), '1.10',@type,@priority)";


            command = new SqlCommand(sqlQuery, conn);
            command.Parameters.AddWithValue("@email", username);
            command.Parameters.AddWithValue("@type", DropDownList1.SelectedItem.Value.ToString());
            command.Parameters.AddWithValue("@priority", DropDownList2.SelectedItem.Value.ToString());
            int count = command.ExecuteNonQuery();
            if (count == 1)
            {
                Label1.Text = "Package sucessfully created";
            }
            else
            {
                Label1.Text = "Nope";
            }
            



            
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