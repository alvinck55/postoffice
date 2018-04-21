using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
	public partial class customerSearch : System.Web.UI.Page
	{
        SqlConnection conn;
        SqlCommand command;
        SqlDataReader dataReader;
        string sqlQuery;
        string output;

        protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void customerSearch_Click(object sender, EventArgs e)
        {
            custSearch();
        }
        private void custSearch()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);

            conn.Open();

            sqlQuery = "SELECT dbo.CUSTOMER.Customer_ID FROM POSTOFFICE2.dbo.CUSTOMER, POSTOFFICE2.dbo.ADDRESS WHERE (dbo.CUSTOMER.Fname='" + fName.Text + "' OR fName.Text IS NULL) AND (dbo.CUSTOMER.Minit='" + mInit.Text + "' OR mInit.Text IS NULL) AND (dbo.CUSTOMER.Lname='" + lName.Text + "' OR lName.Text IS NULL) AND (dbo.CUSTOMER.Email='" + email.Text + "' OR email.Text IS NULL) AND (dbo.CUSTOMER.Phone1='" + phone.Text + "' OR dbo.CUSTOMER.Phone2='" + phone.Text + "' OR phone.Text IS NULL) AND (dbo.ADDRESS.Street='" + street.Text + "' OR street.Text IS NULL) AND (dbo.ADDRESS.City='" + city.Text + "' OR city.Text IS NULL) AND (dbo.ADDRESS.State='" + state.Text + "' OR state.Text IS NULL) AND (dbo.ADDRESS.Zip='" + zip.Text + "' OR zip.Text IS NULL)";
            command = new SqlCommand(sqlQuery, conn);
            dataReader = command.ExecuteReader();
            output = "";


            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    output = dataReader.GetValue(dataReader.GetOrdinal("custId")).ToString();
                }
                Label1.Text = output;
            }
            else
            {
                Label1.Text = "No matching customer.";
            }

            dataReader.Close();
            command.Dispose();
            conn.Close();
        }
    }
}