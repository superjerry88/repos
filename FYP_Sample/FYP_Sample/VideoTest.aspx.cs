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

public partial class VideoTest : System.Web.UI.Page
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
        string CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("spGetAllVideos", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile != null)
        {
            try
            {
                string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.PostedFile.SaveAs(Server.MapPath("UploadVideos/" + FileName));

                string CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spInsertVideo", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.Parameters.AddWithValue("@Name", FileName);
                    cmd.Parameters.AddWithValue("@Video_Path", "UploadVideos/" + FileName);
                    cmd.ExecuteNonQuery();
                    BindGrid();
                    lblMessage.Text = "Your file uploaded successfully";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Your file not uploaded";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}