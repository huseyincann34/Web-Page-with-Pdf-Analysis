using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;
using System.Data.OleDb;
namespace WebApplication4

{
    public partial class Kullanici : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString);
        string connectionString = @"Data Source=DESKTOP-ROLKJ2V;Initial Catalog=Web;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            ID = Request.QueryString["ID"];
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {

                sqlcon.Open();

                SqlCommand komut = new SqlCommand("select * from PdfBilgileri WHERE [ID] = @p1", sqlcon);
                komut.Parameters.AddWithValue("@p1", ID);
                komut.Connection = con;
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(komut))
                {
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                   
                    GridView1.DataBind();
                }
             

                sqlcon.Close();
            }





        }
   
   
        protected void Button1_Click(object sender, EventArgs e)
        {

            if (FileUpload1.HasFile)
            {
                string fname = FileUpload1.PostedFile.FileName;
                string extension = Path.GetExtension(fname);
                int fsize = FileUpload1.PostedFile.ContentLength;

                int flag = 0;
                switch (extension.ToLower())
                {
                    case ".pdf":
                        flag = 1;
                        break;
                    default:
                        flag = 0;
                        break;

                }
                if (flag == 1)
                {
                    FileUpload1.SaveAs(Server.MapPath("~/Files/") + fname);
                    string PdfUrl = @"C:\Users\LENOVO\source\repos\WebApplication4\WebApplication4\Files\" + fname;
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ID + "');", true);
                    SqlCommand cmd = new SqlCommand("insert into PdfBilgileri(ID,DosyaAdi,PdfUrl) values(@p1,@p2,@p3)", con);
                    con.Open();
                    cmd.Parameters.AddWithValue("@p1", ID);
                    cmd.Parameters.AddWithValue("@p2", fname);
                    cmd.Parameters.AddWithValue("@p3", PdfUrl);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label1.Text = "Dosya yükleme başarılı";
                    Label1.ForeColor = System.Drawing.Color.White;
                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Sadece pdf formatında dosya yüklenebilir.";
                }

            }
            else
            {
                Label1.Text = "Dosya Secin";
            }
        }
   
        protected void buton1_Click(object sender, EventArgs e)
        {
            Button link=sender as Button;
            GridViewRow gridRow = link.NamingContainer as GridViewRow;  
            int satir = gridRow.RowIndex;

            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {

                sqlcon.Open();

                SqlCommand komut = new SqlCommand("select * from PdfBilgileri WHERE [ID] = @p1", sqlcon);
                komut.Parameters.AddWithValue("@p1", ID);
                komut.Connection = sqlcon;
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(komut))
                {
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    String ID = dt.Rows[satir][0].ToString();
                    String DosyaAdi2=dt.Rows[satir][1].ToString();
                    String PdfID = dt.Rows[satir][3].ToString();
                   
                    Response.Redirect("KullaniciPdfBilgileri.aspx?DosyaAdi=" + DosyaAdi2+"&PdfID="+PdfID+"&ID="+ID);
                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ID + "');", true);
                    GridView1.DataBind();
                   
                }
               
                sqlcon.Close();
            }
         
        }

 
    }
}