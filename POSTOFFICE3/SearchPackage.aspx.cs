using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class SearchPackage : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand command;
        SqlDataReader dataReader;
        string sqlQuery;
        string customer_id;
        string username;
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
                        customer_id = dataReader.GetValue(dataReader.GetOrdinal("Customer_ID")).ToString();
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
            searchForPackage();
        }
        private void searchForPackage()
        {
            //try
            //{
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
                conn = new SqlConnection(connectionString);

                conn.Open();
            string address;
            string priority;
            string weight;
            string type;
            

                string state;
                string city;

                if(DropDownList1.SelectedValue.ToString() == "Select")
                {
                    state = "";
                }
                else
                {
                    state = " AND dbo.ADDRESS.State = " + DropDownList1.SelectedValue.ToString();
                }
                if(City_TextBox.Text == "")
                {
                    city = "";
                }
                else
                {
                    city = " AND dbo.ADDRESS.City = " + City_TextBox.Text;
                }
                if (Address_TextBox.Text == "")
                {
                address = "";
                }
                else
                {
                    address = " AND dbo.PACKAGE.Receiver_Address_ID = (SELECT dbo.ADDRESS.Address_ID FROM dbo.ADDRESS WHERE dbo.ADDRESS.Street = '" + Address_TextBox.Text + "'" + state + city + ")";

                }
                if(Weight_TextBox.Text == "")
                {
                weight = "";
                }
                else
                {
                weight = " AND dbo.PACKAGE.Weight = " + Weight_TextBox.Text;
                }
                if (DropDownList2.SelectedItem.Value == "Select")
                {
                type = "";
                }
                else
                {
                type = " AND dbo.PACKAGE.Types = " + DropDownList2.SelectedItem.Value.ToString();
                }
                if(DropDownList3.SelectedItem.Value == "Select")
                {
                priority = "";
                }
                else
                {
                    priority = " AND dbo.PACKAGE.Priority = "+ DropDownList3.SelectedItem.Value.ToString();
                }
            sqlQuery = "SELECT dbo.PACKAGE.Tracking_no, dbo.ADDRESS.Street, dbo.ADDRESS.City, dbo.ADDRESS.Zip, dbo.PRIORITY.Priority, dbo.TYPE.Type " +
            "FROM PACKAGE,ADDRESS,PRIORITY,TYPE WHERE ADDRESS.Address_ID = dbo.PACKAGE.Receiver_Address_ID AND dbo.PRIORITY.Priority_ID = dbo.PACKAGE.Priority " +
            "AND dbo.TYPE.Type_ID = dbo.PACKAGE.Types AND dbo.PACKAGE.Sender_ID = @sender " + address + priority + weight + type;
            command = new SqlCommand(sqlQuery, conn);
            command.Parameters.AddWithValue("@sender", customer_id);
            dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        Label1.Text += dataReader[0].ToString() + "\t" + dataReader[1].ToString() + "\t" + dataReader[2].ToString() + "\t" + dataReader[3].ToString() + "\t" + dataReader[4].ToString() + "\t" + dataReader[5].ToString() + "\n";
                    }
                }
                else
                {
                    Label1.Text = "No packages with matching criteria";
                }

                dataReader.Close();
                command.Dispose();
                conn.Close();
            }
            /*catch(Exception ex)
            {
                Label1.Text = "Please ensure fields are filled in appropriately";
            }
        }*/

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}