using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class Data : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand command;
        SqlDataReader dataReader;
        string sqlQuery;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            searchData();
        }
        private void searchData()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();

                sqlQuery = "SELECT CUSTOMER.Fname FROM POSTOFFICE.CUSTOMER WHERE POSTOFFICE.CUSTOMER.Customer_ID ='" + customeridTextBox.Text + "'";
                command = new SqlCommand(sqlQuery, conn);
                dataReader = command.ExecuteReader();


                dataReader.Close();
                command.Dispose();
                conn.Close();

            }
            catch (Exception ex)
            {
                

            }

        }
    }
}