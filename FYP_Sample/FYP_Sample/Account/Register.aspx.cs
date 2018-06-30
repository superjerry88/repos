using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using FYP_Sample;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        string user_name = this.text_username.Text;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        string query = "SELECT * FROM users WHERE user_name='" + user_name + "'";

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.CommandType = CommandType.Text;
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            ErrorLabel.Text = "Username is already exist. Please choose another one.";
            ErrorLabel.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            this.SqlDataSource1.Insert();
            Response.Redirect("Login.aspx");
        }
    }
}