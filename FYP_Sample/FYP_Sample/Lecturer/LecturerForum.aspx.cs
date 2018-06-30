using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lecturer_LecturerForum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT ForumTopic.f_topic, ForumSubtopic.sub_topic, users.user_fullname, Forum.forum_post, Forum.forum_datetime " +
                    "FROM Forum INNER JOIN users ON Forum.user_id = users.user_ID INNER JOIN ForumSubtopic ON Forum.sub_id = ForumSubtopic.sub_id " +
                    "INNER JOIN ForumTopic ON ForumSubtopic.f_id = ForumTopic.f_id";
                cmd.Connection = con;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }
    }

    protected void button_topic_Click(object sender, EventArgs e)
    {
        GridView1.DataSource = SqlDataSource4;
        GridView1.DataBind();
    }

    protected void button_subtopic_Click(object sender, EventArgs e)
    {
        GridView1.DataSource = SqlDataSource5;
        GridView1.DataBind();
    }

    protected void button_submit_Click(object sender, EventArgs e)
    {
        string post = text_post.Text;
        DateTime current = DateTime.Now;
        string sqlDate = current.ToString("yyyy-MM-dd HH:mm:ss");
        int subtopic = Convert.ToInt32(drop_chosen.SelectedValue.ToString());

        int id = Convert.ToInt32(Session["user_id"]);

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        string query = "INSERT INTO Forum (forum_post, user_id, forum_datetime, sub_id)" +
            " VALUES ('" + post+ "', " +id + ", '" + sqlDate + "', " + subtopic + ")";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("LecturerForum.aspx");
    }
}