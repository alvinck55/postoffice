﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace POSTOFFICE3
{
    public partial class SearchCustomer : System.Web.UI.Page
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
            this.Form.DefaultButton = this.Button1.UniqueID;

            username = Session["username"].ToString();
            loggedin.Text = "Employee ID: " + Session["username"];


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PostOffice"].ToString();
                conn = new SqlConnection(connectionString);

                conn.Open();
                string city;
                string state;
                string street;
                string address;
                string fname;
                string lname;
                string zip;

                int count = 0;
                if(TextBox4.Text == string.Empty)
                {
                    city = "";
                }
                else
                {
                    city = " AND ADDRESS.City = '" + TextBox4.Text + "'";
                }
                if(TextBox1.Text == string.Empty)
                {
                    fname = "";
                }
                else
                {
                    fname = " AND CUSTOMER.Fname = '" + TextBox1.Text + "'";
                }
                if (TextBox2.Text == string.Empty)
                {
                    lname = "";
                }
                else
                {
                    lname = " AND CUSTOMER.Lname = '" + TextBox2.Text + "'";
                }
               if(TextBox3.Text == string.Empty)
                {
                    address = "";
                }
                else
                {
                    address = " AND ADDRESS.Street = '" + TextBox3.Text + "'";
                }
               if(DropDownList1.SelectedValue == "Select")
                {
                    state = "";
                }
                else
                {
                    state = " AND ADDRESS.State = '" + DropDownList1.SelectedValue.ToString() + "'";
                }
               if(TextBox5.Text == string.Empty)
                {
                    zip = "";
                }
                else
                {
                    zip = " AND ADDRESS.Zip = '" + TextBox5.Text + "'";
                }

                sqlQuery = "SELECT CUSTOMER.Customer_ID, CUSTOMER.Fname, CUSTOMER.Lname, ADDRESS.Street, ADDRESS.City,ADDRESS.State, ADDRESS.Zip FROM CUSTOMER,ADDRESS WHERE CUSTOMER.Customer_ID in (SELECT DISTINCT CUSTOMER_ADDRESS.Customer_ID FROM CUSTOMER_ADDRESS,ADDRESS WHERE CUSTOMER_ADDRESS.Address_ID = ADDRESS.Address_ID " + city + state + address+ fname + lname + zip+") AND ADDRESS.Address_ID = CUSTOMER.Address_ID";
                command = new SqlCommand(sqlQuery, conn);

                GridView1.DataSource = command.ExecuteReader();
                GridView1.DataBind();

                
                

       

                


                command.Dispose();
                conn.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = "Customer does not exist";
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView2.DataBind();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}