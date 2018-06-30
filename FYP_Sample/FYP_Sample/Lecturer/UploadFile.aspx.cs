using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lecturer_UploadFile : System.Web.UI.Page
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
    protected void button_upload_Click(object sender, EventArgs e)
    {
        if(FileUpload1.HasFile)
        {
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string contentType = FileUpload1.PostedFile.ContentType;            
            int subjectID = Convert.ToInt32(drop_name.Text);
            string customName = text_custom.Text;
            using (Stream fs = FileUpload1.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "INSERT INTO Uploads (file_name, file_type, file_data, subject_id, file_customname)" +
                            "VALUES(@file_name, @file_type, @file_data, @subject_id, @file_customname)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@file_name", filename);
                            cmd.Parameters.AddWithValue("@file_type", contentType);
                            cmd.Parameters.AddWithValue("@file_data", bytes);
                            cmd.Parameters.AddWithValue("@subject_id", subjectID);
                            cmd.Parameters.AddWithValue("@file_customname", customName);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
            }
            Response.Redirect("UploadFile");
        }
        else
        {
            label_upload.Text = "Please Upload a File";
        }
        
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void button_create_Click(object sender, EventArgs e)
    {
        string create = text_create.Text;
        string fullname = (string)Session["full_name"];
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        string query = "INSERT INTO Subjects VALUES ('"+ create + "','" + fullname + "')";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("UploadFile.aspx");
    }

    protected void button_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("LecturerPage.aspx");
    }
}