using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_StudentPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string test = (string)Session["user_type"];
        int id = Convert.ToInt32(Session["user_id"]);
        if (!this.IsPostBack)
        {
            if (test == null)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            else if (test == "lecturer")
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        string query2 = "SELECT user_fullname FROM users WHERE user_id='" + id + "'";
        SqlCommand cmd2 = new SqlCommand(query2, con);
        string name = cmd2.ExecuteScalar().ToString();

        this.Session["full_name"] = name;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Account/Login.aspx");
    }


    protected void Button_Feedback_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentFeedback.aspx");
    }

    protected void Button_Files_Click(object sender, EventArgs e)
    {
        Response.Redirect("FileAccess.aspx");
    }

    protected void Button_Forum_Click(object sender, EventArgs e)
    {

    }

    protected void Button_Videos_Click(object sender, EventArgs e)
    {

    }
}