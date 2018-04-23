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
        string username;
        string customerid;

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand command;
            SqlDataReader dataReader;
            SqlConnection conn;
            string sqlQuery;
            string connectionString;

            if (Session["username"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            username = Session["username"].ToString();
            logText.Text = "Currently logged in as: " + Session["username"];

            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);

            conn.Open();

            sqlQuery = "SELECT * FROM POSTOFFICE2.dbo.CUSTOMER WHERE Email='" + username + "'";
            command = new SqlCommand(sqlQuery, conn);
            dataReader = command.ExecuteReader();
            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    customerid = dataReader.GetValue(dataReader.GetOrdinal("Customer_ID")).ToString();
                }
                TextBox1.Text = customerid;
            }
            dataReader.Close();
            command.Dispose();
            conn.Close();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = DropDownList1.SelectedValue;

        }
        private void SearchData(string value)
        {
            //conn = CreateConnectionString();
            //conn.Open();
            //sqlQuery = "SELECT * FROM POSTOFFICE2.dbo.PACKAGE p WHERE p.Sender_ID='" + customerid.ToString() + "'";
            //command = new SqlCommand(sqlQuery, conn);
            //dataReader = DataReader(command);
            //if (dataReader.HasRows)
            //{
            //    while (dataReader.Read())
            //    {
            //        //packageid.Add(new Student("bob"));
            //        //packageid.Add(new Student("joe"));
            //        //Student joe = packageid[1];
            //        packageid.Add(dataReader.GetInt32(dataReader.GetOrdinal("Package_ID"));
            //    }
            //    Label1.Text = packageid.ToString();
            //}
            //dataReader.Close();
            //command.Dispose();
            //conn.Close();
        }

        private SqlConnection CreateConnectionString()
        {
            string connectionString;
            SqlConnection conn;
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
            conn = new SqlConnection(connectionString);
            return conn;
        }

        private SqlCommand CreateQuery(string attribute, string table, string condition, SqlConnection conn)
        {
            SqlCommand command;
            string sqlQuery;
            string select;
            string from;
            string where;

            select = "SELECT " + attribute;
            from = "FROM POSTOFFICE2.dbo." + table;
            where = "WHERE " + condition;

            sqlQuery = select + from + where;
            command = new SqlCommand(sqlQuery, conn);
            return command;
        }

        private SqlDataReader DataReader(SqlCommand command)
        {
            SqlDataReader dataReader;
            dataReader = command.ExecuteReader();
            return dataReader;
        }
    }
}