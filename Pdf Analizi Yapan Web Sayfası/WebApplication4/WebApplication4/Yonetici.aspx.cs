using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;
using System.Data.OleDb;
namespace WebApplication4
{
    public partial class Yonetici : System.Web.UI.Page
    {
      
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-ROLKJ2V;initial Catalog=Web;Integrated Security=true");
        string connectionString = @"Data Source=DESKTOP-ROLKJ2V;Initial Catalog=Web;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
     
            con.Open();
            string select = "Select * From PdfBilgileri Inner Join KullaniciLogin on PdfBilgileri.ID=KullaniciLogin.ID";
            SqlDataAdapter da = new SqlDataAdapter(select,con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();

            


        }


        

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand("insert into KullaniciLogin (KullaniciAdi,KullaniciSifre) values (@p1,@p2)", con);

            komut.Parameters.AddWithValue("@p1", TextBox1.Text);
            komut.Parameters.AddWithValue("@p2", TextBox2.Text);
            komut.ExecuteNonQuery();
            con.Close();

            string myStringVariable = string.Empty;
            myStringVariable = "Kullanıcı Başarıyla Kaydoldu";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komutsil = new SqlCommand("Delete From KullaniciLogin Where KullaniciAdi=@k1", con);
            komutsil.Parameters.AddWithValue("@k1", TextBox1.Text);
            komutsil.ExecuteNonQuery();
            con.Close();
            string myStringVariable = string.Empty;
            myStringVariable = "Kullanıcı Başarıyla Silindi";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komutgüncelle = new SqlCommand("Update KullaniciLogin Set KullaniciAdi=@a1, KullaniciSifre=@a2 where KullaniciAdi=@a3", con);
            komutgüncelle.Parameters.AddWithValue("@a1", TextBox1.Text);
            komutgüncelle.Parameters.AddWithValue("@a2", TextBox2.Text);
            komutgüncelle.Parameters.AddWithValue("@a3", TextBox1.Text);
            komutgüncelle.ExecuteNonQuery();
            con.Close();
            string myStringVariable = string.Empty;
            myStringVariable = "Kullanıcı Başarıyla Güncellendi";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
        }
        protected void buton1_Click(object sender, EventArgs e)
        {
            Button link = sender as Button;
            GridViewRow gridRow = link.NamingContainer as GridViewRow;
            int satir = gridRow.RowIndex;

          

                con.Open();
                string select = "Select * From PdfBilgileri";
                SqlDataAdapter da = new SqlDataAdapter(select, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                string ID3= dt.Rows[1][0].ToString();
                String DosyaAdi2 = dt.Rows[satir][1].ToString();
                String PdfID = dt.Rows[satir][3].ToString();
                Response.Redirect("YoneticiPdfBilgileri.aspx?DosyaAdi=" + DosyaAdi2 + "&PdfID=" + PdfID + "&ID=" + ID3);
                GridView1.DataBind();
                con.Close();

               
            
        }

      
    }
}