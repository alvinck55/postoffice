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

                sqlQuery = "SELECT * FROM POSTOFFICE2.dbo.CUSTOMER WHERE Customer_ID='" + customeridTextBox.Text + "'";
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
                    Label1.Text = "invalid employee ID";
                }

                dataReader.Close();
                command.Dispose();
                conn.Close();

            

         

            

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand command;
            SqlDataReader dataReader;
            string sqlQuery;
            int count = 0;
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);

            conn.Open();

            sqlQuery = "SELECT * FROM ADDRESS WHERE ADDRESS.State = 'TX'";
            command = new SqlCommand(sqlQuery,conn);

            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                if(count == DropDownList1.SelectedIndex)
                {
                    Label2.Text = dataReader[2].ToString();
                    break;
                }
                ++count;
            }
            dataReader.Close();
            command.Dispose();
            conn.Close();
        
        }
    }
}