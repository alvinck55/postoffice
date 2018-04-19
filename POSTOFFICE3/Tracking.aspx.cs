﻿using System;
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
        string output;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            searchData();
        }
        private void searchData()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);
 
                conn.Open();

            sqlQuery = "SELECT * FROM POSTOFFICE3.TRACKING WHERE Tracking_no='" + trackingNoTextBox.Text + "'";
                command = new SqlCommand(sqlQuery, conn);
                dataReader = command.ExecuteReader();
                output = "";
                

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        output = dataReader.GetString(dataReader.GetOrdinal("Status")) + dataReader.GetString(dataReader.GetOrdinal("Facility_ID")) + dataReader.GetString(dataReader.GetOrdinal("Delivery_Date"));
                    }
                    Label1.Text = output;
                }
                else
                {
                    Label1.Text = "Incorrect tracking number.";
                }

                dataReader.Close();
                command.Dispose();
                conn.Close();

         

            

        }
    }
}