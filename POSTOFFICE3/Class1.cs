using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        /*SqlConnection con = new SqlConnection(@  
        "Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
        SqlCommand cmd = new SqlCommand("sp_insert", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("name", TextBox1.Text);
        cmd.Parameters.AddWithValue("email", TextBox2.Text);
        cmd.Parameters.AddWithValue("education", TextBox3.Text);
        cmd.Parameters.AddWithValue("phoneno", TextBox4.Text);
        cmd.Parameters.AddWithValue("city", TextBox5.Text);
        con.Open();
        int k = cmd.ExecuteNonQuery();
        if (k != 0)
        {
            lblmsg.Text = "Record Inserted Succesfully into the Database";
            lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
        }
        con.Close();*/
    }
}