using System;
using System.Data.SqlClient;

namespace WebApplication4
{
    public partial class GirisSayfasi : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-ROLKJ2V;initial Catalog=Web;Integrated Security=true");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Visible = false;
            Label6.Visible = false; 
            

        }
       
      
        public void Button1_Click(object sender, EventArgs e)
        {
            sqlCon.Open();
            SqlCommand komut = new SqlCommand("Select * From KullaniciLogin  where KullaniciAdi=@P1 AND KullaniciSifre=@P2", sqlCon);
            komut.Parameters.AddWithValue("@P1", TextBox1.Text.Trim());
            komut.Parameters.AddWithValue("@P2", TextBox2.Text.Trim());

            SqlDataReader dataReader = komut.ExecuteReader();
            if (dataReader.Read())
            {

                sqlCon.Close();
                sqlCon.Open();
                SqlCommand komut2 = new SqlCommand("Select ID From KullaniciLogin  where KullaniciAdi=@P3 AND KullaniciSifre=@P4", sqlCon);
                komut.Parameters.AddWithValue("@P3", TextBox1.Text.Trim());
                komut.Parameters.AddWithValue("@P4", TextBox2.Text.Trim());              
                SqlDataReader dataReader2 = komut.ExecuteReader();
                if (dataReader2.Read())
                {
                    int ID = Convert.ToInt32(dataReader2["ID"]);                  
                    Response.Redirect("Kullanici.aspx?ID=" + ID);
                                   
                }

                sqlCon.Close();
            }
            else
            {
                Label3.Visible = true;           
                sqlCon.Close();

            }
        }

        public void Button2_Click(object sender, EventArgs e)
        {
         
            sqlCon.Open();
            SqlCommand komut = new SqlCommand("Select * From YoneticiLogin  where KullaniciAdi=@P1 AND KullaniciSifre=@P2", sqlCon);
            komut.Parameters.AddWithValue("@P1", TextBox3.Text.Trim());
            komut.Parameters.AddWithValue("@P2", TextBox4.Text.Trim());

            SqlDataReader dataReader = komut.ExecuteReader();
            if (dataReader.Read())
            {

                sqlCon.Close();
                sqlCon.Open();
                SqlCommand komut2 = new SqlCommand("Select ID From YoneticiLogin  where KullaniciAdi=@P3 AND KullaniciSifre=@P4", sqlCon);
                komut.Parameters.AddWithValue("@P3", TextBox3.Text.Trim());
                komut.Parameters.AddWithValue("@P4", TextBox4.Text.Trim());
                SqlDataReader dataReader2 = komut.ExecuteReader();
                if (dataReader2.Read())
                {
                    int ID = Convert.ToInt32(dataReader2["ID"]);
                    Response.Redirect("Yonetici.aspx?ID=" + ID);

                }

                sqlCon.Close();
            }
            else
                {
                    Label6.Visible = true;

                }
            }
        }
    }
