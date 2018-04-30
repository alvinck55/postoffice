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
            this.Form.DefaultButton = this.Button1.UniqueID;


            if (Session["username"] == null)
            {
                Response.Redirect("Home.aspx");


            }
            loggedin.Text = "Currently logged in as: " + Session["username"];

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
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
                conn = new SqlConnection(connectionString);

                conn.Open();
                string priority;
                string weight;
                string type;
                string finalAddress = "";
                int count = 0;

                if(DropDownList1.SelectedValue.ToString() != "Select")
                {
                    finalAddress = " dbo.ADDRESS.State = '" + DropDownList1.SelectedValue.ToString() + "'";
                    ++count;
                }
                if(City_TextBox.Text != String.Empty)
                {
                    if(count >= 1)
                    {
                        finalAddress += " AND dbo.ADDRESS.City = '" + City_TextBox.Text + "'";
                    }
                    else
                    {
                        finalAddress = "dbo.ADDRESS.City = '" + City_TextBox.Text + "'";
                        ++count;
                    }
                }
                if (Address_TextBox.Text != String.Empty)
                {
                    if(count >= 1)
                    {
                        finalAddress += " AND dbo.ADDRESS.Street = '" + Address_TextBox.Text + "'";
                    }
                    else
                    {
                        finalAddress = " dbo.ADDRESS.Street = '" + Address_TextBox.Text + "'";
                        ++count;
                    }

                }
                if(Zip_TextBox.Text != String.Empty)
                {
                    if(count >= 1)
                    {
                        finalAddress += " AND dbo.ADDRESS.Zip = '" + Zip_TextBox.Text + "'";
                    }
                    else
                    {
                        finalAddress = " dbo.ADDRESS.Zip = '" + Zip_TextBox.Text + "'";
                        ++count;
                    }
                }
                if(count >= 1)
                {
                    finalAddress = " AND dbo.PACKAGE.Receiver_Address_ID in (SELECT dbo.ADDRESS.Address_ID FROM dbo.ADDRESS WHERE " + finalAddress+ ")";
                }
                if(Weight_TextBox.Text == "")
                {
                weight = "";
                }
                else
                {
                weight = " AND dbo.PACKAGE.Weight = '" + Weight_TextBox.Text + "'";
                }
                if (DropDownList2.SelectedItem.Value == "Select")
                {
                type = "";
                }
                else
                {
                type = " AND dbo.PACKAGE.Types = '" + DropDownList2.SelectedItem.Value.ToString() + "'";
                }
                if(DropDownList3.SelectedItem.Value == "Select")
                {
                priority = "";
                }
                else
                {
                    priority = " AND dbo.PACKAGE.Priority = '"+ DropDownList3.SelectedItem.Value.ToString() + "'";
                }
            sqlQuery = "SELECT dbo.PACKAGE.Tracking_no, dbo.ADDRESS.Street, dbo.ADDRESS.City,dbo.ADDRESS.State, dbo.ADDRESS.Zip, dbo.PRIORITY.Priority, dbo.TYPE.Type " +
            "FROM PACKAGE,ADDRESS,PRIORITY,TYPE WHERE ADDRESS.Address_ID = dbo.PACKAGE.Receiver_Address_ID AND dbo.PRIORITY.Priority_ID = dbo.PACKAGE.Priority " +
            "AND dbo.TYPE.Type_ID = dbo.PACKAGE.Types AND dbo.PACKAGE.Sender_ID = @sender " + finalAddress + priority + weight + type;
            command = new SqlCommand(sqlQuery, conn);
            command.Parameters.AddWithValue("@sender", customer_id);
            GridView1.DataSource = command.ExecuteReader();
            GridView1.DataBind();
            

                dataReader.Close();
                command.Dispose();
                conn.Close();
            }
            catch(Exception ex)
            {
                Label1.Text = "Please ensure fields are filled in with proper values";
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }
    }
}