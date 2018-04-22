using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class ShippingHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Calendar1.SelectedDate = DateTime.Today + TimeSpan.FromDays(-30);
            Calendar2.SelectedDate = DateTime.Today;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = DropDownList1.SelectedItem.Value;
            //SearchData();

        }
        //private void SearchData()
        //{
        //    SqlConnection conn;
        //    SqlCommand command;
        //    SqlDataReader dataReader;
        //    string sqlQuery;
        //    string output;

        //    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
        //    conn = new SqlConnection(connectionString);

        //    conn.Open();

        //    sqlQuery = "SELECT * FROM POSTOFFICE2.dbo.PACKAGE WHERE Sender_ID='" + customeridTextBox.Text + "'";
        //    command = new SqlCommand(sqlQuery, conn);
        //    dataReader = command.ExecuteReader();
        //    output = "";


        //    if (dataReader.HasRows)
        //    {
        //        while (dataReader.Read())
        //        {
        //            output = dataReader.GetString(dataReader.GetOrdinal("Fname"));
        //        }
        //        //Label1.Text = output;
        //    }
        //    else
        //    {
        //        //Label1.Text = "invalid employee ID";
        //    }

        //    dataReader.Close();
        //    command.Dispose();
        //    conn.Close();
        //}
    }
}