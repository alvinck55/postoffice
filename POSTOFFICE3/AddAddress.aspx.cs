using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class AddAddress1 : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand command;
        SqlDataReader dataReader;
        string sqlQuery;
        string username;
        string customerid;
        string addressid;
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
                        customerid = dataReader.GetValue(dataReader.GetOrdinal("Customer_ID")).ToString();
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
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
                conn = new SqlConnection(connectionString);

                conn.Open();

                sqlQuery = "DECLARE @adID int SET @adID = (SELECT ADDRESS.Address_ID FROM ADDRESS WHERE ADDRESS.Street = @Street AND ADDRESS.State = @State AND ADDRESS.City = @City) IF @adID IS NULL BEGIN " +
                   "INSERT INTO ADDRESS(Facility_ID, Street, City,State,Zip,aptn,Postal_code) VALUES('1',@Street,@City,@State,@Zip,@aptn,@Postal_code) SET @adID = SCOPE_IDENTITY() END SELECT @adID";
                command = new SqlCommand(sqlQuery, conn);
                command.Parameters.AddWithValue("@Street", Street_TextBox.Text);
                command.Parameters.AddWithValue("@City", City_TextBox.Text);
                command.Parameters.AddWithValue("@State", DropDownList1.SelectedItem.Value.ToString());
                if (Zip_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@Zip", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@Zip", Convert.ToDecimal(Zip_TextBox.Text));
                }
                if (Apt_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@aptn", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@aptn", Convert.ToInt32(Apt_TextBox.Text));
                }
                if (PostalCode_TextBox.Text == string.Empty)
                {
                    command.Parameters.AddWithValue("@Postal_code", DBNull.Value);
                }
                else
                {
                    command.Parameters.AddWithValue("@Postal_code", Convert.ToDecimal(PostalCode_TextBox.Text));
                }

                dataReader = command.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        addressid = dataReader[0].ToString();
                        Label1.Text = "Address successfully added";
                    }
                    dataReader.Close();
                    command.Dispose();
                    sqlQuery = "INSERT INTO CUSTOMER_ADDRESS(Customer_ID,Address_ID) VALUES(@customerid,@addressid)";
                    command = new SqlCommand(sqlQuery, conn);
                    command.Parameters.AddWithValue("@customerid", customerid);
                    command.Parameters.AddWithValue("@addressid", addressid);
                    command.ExecuteNonQuery();

                    Label1.Text = "Address successfully added";

         
                }
                else
                {
                    Label1.Text = "Address already exists";
                }


                dataReader.Close();
                command.Dispose();
                conn.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = "Please ensure all fields are filled in correctly";
            }

        }
    }
}