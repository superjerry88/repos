using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using FYP_Sample;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Account_Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void LogIn(object sender, EventArgs e)
    {
        string user_name = this.text_username.Text;
        string user_password = this.text_password.Text;
        string role = this.Radio_role.Text;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        con.Open();
        string query = "SELECT * FROM users WHERE user_name='" + user_name + "' AND user_password='" + user_password + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        //SqlDataReader dr = cmd.ExecuteReader();

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        con.Open();
        string query2 = "SELECT user_id FROM users WHERE user_name='" + user_name + "' AND user_password='" + user_password + "'";
        SqlCommand cmd2 =  new SqlCommand(query2, con);
        int id = (Int32)cmd2.ExecuteScalar();        

        if (dt.Rows.Count > 0)
        {
            this.Session["user_name"] = user_name;
            this.Session["user_type"] = role;
            this.Session["user_id"] = id;

            if (role == "student")
            {
                Response.Redirect("~/Student/StudentPage.aspx");
            }
            else if (role == "lecturer")
            {
                Response.Redirect("~/Lecturer/LecturerPage.aspx");
            }
        }
        else
        {
            Label1.Text = "Your Username/Password is incorrect";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        
        con.Close();
    }
}