using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_FileAccess : System.Web.UI.Page
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
                cmd.CommandText = "Select upload_id, file_customname, Subjects.subject_name, Subjects.subject_maker from " +
                    "UPLOADS INNER JOIN Subjects ON Uploads.subject_id = Subjects.subject_id";
                cmd.Connection = con;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }
    }
    protected void DownloadFile(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        byte[] bytes;
        string fileName, contentType;
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "Select file_name, file_data, file_type from Uploads where upload_id=@id";
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["file_data"];
                    contentType = sdr["file_type"].ToString();
                    fileName = sdr["file_name"].ToString();
                }
                con.Close();
            }
        }
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }

    protected void button_filter_Click(object sender, EventArgs e)
    {
        int subjectID = Convert.ToInt32(drop_subject.Text);
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "Select upload_id, file_customname, Subjects.subject_name, Subjects.subject_maker from " +
                    "UPLOADS INNER JOIN Subjects ON Uploads.subject_id = Subjects.subject_id WHERE Uploads.subject_id = '" + subjectID + "'";
                cmd.Connection = con;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }
    }

    protected void button_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("FileAccess.aspx");
    }

    protected void button_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentPage.aspx");
    }
}