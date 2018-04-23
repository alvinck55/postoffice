using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
	public partial class ZipSearch : System.Web.UI.Page
	{
        SqlConnection conn;
        SqlCommand command;
        SqlDataReader dataReader;
        string sqlQuery;
        string output;

        protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void zipSearch_Click(object sender, EventArgs e)
        {
            zipSearch();
        }
        private void zipSearch()
        {
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
                conn = new SqlConnection(connectionString);

                conn.Open();

                sqlQuery = "SELECT dbo.FACILITY.Facility_ID FROM POSTOFFICE2.dbo.FACILITY, POSTOFFICE2.dbo.ADDRESS WHERE dbo.ADDRESS.Zip='" + zipBox.Text + "' AND dbo.FACILITY.Address_ID = dbo.ADDRESS.Address_ID";
                command = new SqlCommand(sqlQuery, conn);
                dataReader = command.ExecuteReader();
                output = "";


                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        output = dataReader.GetValue(dataReader.GetOrdinal("Zip")).ToString();
                    }
                    Label1.Text = output;
                }
                else
                {
                    Label1.Text = "There are no facilities serving that ZIP code.";
                }

                dataReader.Close();
                command.Dispose();
                conn.Close();
            }
            catch
            {
                command.Dispose();
                conn.Close();
            }
        }
    }
}