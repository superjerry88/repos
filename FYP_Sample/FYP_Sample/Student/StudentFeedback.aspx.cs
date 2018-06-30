using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_StudentFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Session["user_name"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            else if ((string)Session["user_type"] == "lecturer")
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
        string username = (string)Session["user_name"];
        int id = Convert.ToInt32(Session["user_id"]);
        Label_Welcome.Text = "Welcome " + username + " your ID number is " + id;
    }

    protected void button_submit_Click(object sender, EventArgs e)
    {
        string title = this.text_title.Text;
        int id = Convert.ToInt32(Session["user_id"]);

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        string query = "SELECT * FROM Feedback WHERE Feedback_Title ='" + title + "'";

        SqlCommand cmd = new SqlCommand(query, con);

        cmd.CommandType = CommandType.Text;
        SqlDataReader dr = cmd.ExecuteReader();

        this.SqlDataSource1.Insert();
        con.Close();
        Response.Redirect("StudentPage.aspx");
    }

    protected void button_clear_Click(object sender, EventArgs e)
    {
        text_title.Text = string.Empty;
        text_description.Text = string.Empty;
    }
}