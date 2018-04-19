using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
	public partial class Tracking : System.Web.UI.Page
	{
        SqlConnection conn;
        SqlCommand command;
        SqlDataReader dataReader;
        string sqlQuery;
        string output;

        protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void TrackPackage_Click(object sender, EventArgs e)
        {
            trackPackage();
        }
        private void trackPackage()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);

            conn.Open();

            sqlQuery = "SELECT * FROM POSTOFFICE2.dbo.TRACKING WHERE Tracking_no='" + TrackingNumberTextBox.Text + "'";
            command = new SqlCommand(sqlQuery, conn);
            dataReader = command.ExecuteReader();
            output = "";


            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    output = dataReader.GetString(dataReader.GetOrdinal("Fname"));
                }
                Label1.Text = output;
            }
            else
            {
                Label1.Text = "invalid tracking number";
            }

            dataReader.Close();
            command.Dispose();
            conn.Close();
        }
    }
}