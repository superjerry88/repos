using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lecturer_LecturerFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string test = (string)Session["user_type"];
        if (!this.IsPostBack)
        {
            if (test == null)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            else if (test == "student")
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void button_approve_Click(object sender, EventArgs e)
    {
        string response = text_response.Text;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        string query = "UPDATE Feedback SET Feedback_Respond ='" + response + "', Feedback_Status = 'Approved' WHERE Feedback_ID ='" + drop_feedback.SelectedValue + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("LecturerFeedback.aspx");
    }

    protected void button_reject_Click(object sender, EventArgs e)
    {
        string response = text_response.Text;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        string query = "UPDATE Feedback SET Feedback_Respond ='" + response + "', Feedback_Status = 'Rejected' WHERE Feedback_ID ='" + drop_feedback.SelectedValue + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("LecturerFeedback.aspx");
    }
}