using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication4
{
   
    public partial class KullaniciPdfBilgileri : System.Web.UI.Page
    {
        
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-ROLKJ2V;initial Catalog=Web;Integrated Security=true");
        static public string TeslimDonem;
        static public string AnahtarKelime;
        static public string Ogrenci;
        static public string DersAdi;
        static public string Ozet;
        static public string Danisman;
        static public string Juri;
        static public string ProjeAdi;
        int ID2;
        protected void Page_Load(object sender, EventArgs e)
        {

            string DosyaAdi = Request.QueryString["DosyaAdi"];
            string PdfID = Request.QueryString["PdfID"];
            ID2 = Convert.ToInt32(Request.QueryString["ID"]);
            int PDFID = Convert.ToInt32(PdfID);
            string PdfUrl = @"C:\Users\LENOVO\source\repos\WebApplication4\WebApplication4\Files\" + DosyaAdi;

            string Arama1 = pdf2(PdfUrl);
            string Arama2 = pdf1(PdfUrl);        
            string Ogrenci = YazarBilgisiAra(Arama1);
            string DersAdı = DersAdiAra(Arama2);
            string Ozet = ProjeOzetiAra(Arama1);
            string Tarih=TeslimDonemAra(Arama2);
            string ProjeAdı = ProjeBasligiAra(Arama2);
            string AnahtarKelime= AnahtarKelimeleriAra(Arama2);
            string Danisman = DanismanBilgileriAra(Arama2);
            string Juri= JuriBilgileriAra(Arama2);

            sqlCon.Open();
            SqlCommand komut = new SqlCommand("Select * From YoneticiPdfBilgileri where PdfID=@p1 ",sqlCon);
            komut.Parameters.AddWithValue("@p1",PDFID);
            SqlDataReader dr = komut.ExecuteReader();
           
            if (dr.Read()==false)
            {
                sqlCon.Close();
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("insert into YoneticiPdfBilgileri (PdfID,YazarBilgileri,DersAdi,ProjeOzeti,ProjeninTeslimEdildigiDonem,ProjeBasligi,AnahtarKelimeler,DanismanBilgiler,JuriBilgileri,ID) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10)", sqlCon);
                cmd.Parameters.AddWithValue("@p1", PDFID);
                cmd.Parameters.AddWithValue("@p2", Ogrenci);
                cmd.Parameters.AddWithValue("@p3", DersAdı);
                cmd.Parameters.AddWithValue("@p4", Ozet);
                cmd.Parameters.AddWithValue("@p5", Tarih);
                cmd.Parameters.AddWithValue("@p6", ProjeAdı);
                cmd.Parameters.AddWithValue("@p7", AnahtarKelime);
                cmd.Parameters.AddWithValue("@p8", Danisman);
                cmd.Parameters.AddWithValue("@p9", Juri);
                cmd.Parameters.AddWithValue("@p10", ID2);
                cmd.ExecuteNonQuery();
                sqlCon.Close();
            }          
            sqlCon.Close();
        }
     
        public string pdf2(string pdfYolu)
         {
            if (File.Exists(pdfYolu))
            {
                PdfReader pdfOkuyucu = new PdfReader(pdfYolu);
                string icerik = "";
                for (int sayfa = 2; sayfa <= pdfOkuyucu.NumberOfPages; sayfa++)
                {
                    icerik += PdfTextExtractor.GetTextFromPage(pdfOkuyucu, sayfa);
                }
                pdfOkuyucu.Close();
              
                return icerik;
            }
            else
            {
               
                return "Yok";
            }
          
         }
        public string pdf1(string pdfYolu)
        {
            
            if (File.Exists(pdfYolu))
            {
                PdfReader pdfOkuyucu = new PdfReader(pdfYolu);
                string icerik = "";
                for (int sayfa = 1; sayfa <= pdfOkuyucu.NumberOfPages; sayfa++)
                {
                    icerik += PdfTextExtractor.GetTextFromPage(pdfOkuyucu, sayfa);
                }
                pdfOkuyucu.Close();
              
                return icerik;
            }
            else
            {
             
                return "Yok";
            }
         
        }
         public string YazarBilgisiAra(string metin)
         {
            char[] strArray = metin.ToCharArray();
            int Sonuc1 = metin.IndexOf("Öğrenci No:", 0, metin.Length - 1);
            int Sonuc2 = metin.IndexOf("İÇİNDEKİLER", 0, metin.Length - 1);

            Ogrenci = metin.Substring(Sonuc1, Sonuc2 - Sonuc1);
            Ogrenci = Ogrenci.Replace("Öğrenci No:", String.Empty);
            Ogrenci = Ogrenci.Replace("Adı Soyadı:", String.Empty);
            Ogrenci = Ogrenci.Replace("İmza:", String.Empty);
            Ogrenci = Ogrenci.Replace(".", String.Empty);
            Ogrenci = Ogrenci.Replace("\n", String.Empty);

            TextBox1.Text = Ogrenci;

            return Ogrenci;
         }
        string DersAdiAra(string metin)
        {
            int Sonuc1 = metin.IndexOf("ARAŞTIRMA PROBLEMLERİ", 0, metin.Length - 1);
            int Sonuc2 = metin.IndexOf("BİTİRME PROJESİ", 0, metin.Length - 1);

            if (Sonuc1 != -1)
            {
                DersAdi = metin.Substring(Sonuc1, 21);
                TextBox2.Text = DersAdi;
                return DersAdi;
            }
            else
            {
                DersAdi = metin.Substring(Sonuc2, 15);
                TextBox2.Text = DersAdi;
                return DersAdi;
            }            
        }
        string ProjeOzetiAra(string metin)
        {
            int Sonuc1 = metin.LastIndexOf("ÖZET");
            int Sonuc2 = metin.LastIndexOf("Anahtar kelimeler:");
            Sonuc2 = Sonuc2 - Sonuc1 - 5;
            Ozet = metin.Substring(Sonuc1 + 5, Sonuc2);
            TextBox3.Text = Ozet;
            return Ozet;
        }
         public string TeslimDonemAra(string metin)
        {
      
            int metin2 = metin.IndexOf("Tarih:", 0, metin.Length - 1);

            TeslimDonem = metin.Substring(metin2 + 6, 15);
            TeslimDonem = TeslimDonem.Replace(" ", String.Empty);
            char[] strArray = TeslimDonem.ToCharArray();
            int j = 0;
            for (int i = 1; i < strArray.Length; i++)
            {
                if (char.IsDigit(strArray[i]))
                    if (char.IsDigit(strArray[i + 1]))
                        if (char.IsDigit(strArray[i + 2]))
                            if (char.IsDigit(strArray[i + 3]))
                            {
                                j = i;
                                TeslimDonem = TeslimDonem.Substring(i - 3, 7);
                                break;
                            }
            }

            TeslimDonem = TeslimDonem.Replace(" ", String.Empty);

            int ay = Convert.ToInt32(TeslimDonem.Substring(0, 2));
            int yil = Convert.ToInt32(TeslimDonem.Substring(TeslimDonem.Length - 4, 4));
            if (ay < 9)
            {
                TeslimDonem = (yil - 1).ToString() + "-" + yil.ToString() + " BAHAR";
            }
            else
            {
                TeslimDonem = (yil).ToString() + (yil + 1).ToString() + " GÜZ";
            }
            
            TextBox4.Text = TeslimDonem;
            return TeslimDonem;
        }
        public string ProjeBasligiAra(string metin)
        {
           
            char[] strArray = metin.ToCharArray();
            int metin2 = DersAdi.Length;
            int Sonuc1 = metin.IndexOf(DersAdi, 0, metin.Length - 1);
            Sonuc1 = Sonuc1 + metin2;
            string alfabe = "ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZabcçdefgğhıijklmnoöprsştuüvyz";
            int k = 0;
            for (int i = Sonuc1; i < metin.Length; i++)
            {
                int t = alfabe.IndexOf(strArray[i], 0, alfabe.Length - 1);
                if (t != -1)
                {
                    int e = 0;
                    for (int j = i; j < metin.Length; j++)
                    {
                        if (strArray[j] == '\n')
                            e++;

                        if (e > 1)
                        {
                            k = j;
                            break;
                        }

                    }
                    break;
                }
            }
            ProjeAdi = metin.Substring(Sonuc1, k - Sonuc1);
            ProjeAdi = ProjeAdi.Replace("\n", String.Empty);
            TextBox5.Text = ProjeAdi;
            return ProjeAdi;
        }

         public string AnahtarKelimeleriAra(string metin)
        {
            char[] strArray = metin.ToCharArray();
            int b, a = 0;

            int Sonuc = metin.IndexOf("Anahtar kelimeler:", 0, metin.Length - 1);
            b = Sonuc + 18;
            for (int i = Sonuc + 18; i < strArray.Length; i++)
            {
                a++;
                if (strArray[i] == ',' || strArray[i] == '.')
                {
                    AnahtarKelime += metin.Substring(b, a - 1) + "  -   ";
                    b = i + 1;
                    a = 0;
                }
                if (strArray[i] == '.')
                    break;
            }
            AnahtarKelime = AnahtarKelime + "  ";
            AnahtarKelime = AnahtarKelime.Replace("\n", String.Empty);
            AnahtarKelime = AnahtarKelime.Replace("-     ", String.Empty);
            TextBox6.Text = AnahtarKelime;
            return AnahtarKelime;
           
        }

         public string DanismanBilgileriAra(string metin)
        {
            string metin2 = "";
            char[] strArray = metin.ToCharArray();
            int Sonuc1 = metin.IndexOf("Danışman", 0, metin.Length - 1);
            int a = 0;
            for (int i = Sonuc1 - 1; i > 0; i--)
            {
                a++;
                if (strArray[i - 1] == '\n')
                {
                    metin2 += metin.Substring(i - 1, a);
                    break;
                }
            }
            for (int i = Sonuc1; i < Sonuc1 + 8; i++)
            {
                strArray[i] = 'a';
            }
            metin = new string(strArray);
           
            int b = 1;
            for (int e = 0; e < 5; e++)
            {
                Sonuc1 = metin.IndexOf("Danışman", 0, metin.Length - 1);
                if (Sonuc1 != -1)
                {
                    a = 0;
                    for (int i = Sonuc1 - 1; i > 0; i--)
                    {
                        a++;
                        if (strArray[i - 1] == '\n')
                        {
                            metin2 += "-  " + metin.Substring(i, a);
                            b++;
                            break;
                        }
                    }
                    for (int i = Sonuc1; i < Sonuc1 + 8; i++)
                    {
                        strArray[i] = 'a';
                    }
                    metin = new string(strArray);
                }
            }
            Danisman = metin2;
            Danisman = Danisman.Replace("\n", String.Empty);
            TextBox7.Text = Danisman;
            return Danisman;

        }


         public string JuriBilgileriAra(string metin)
        {
            string metin2 = metin;
            char[] strArray = metin.ToCharArray();
            int Sonuc1 = metin.IndexOf("Jüri Üyesi", 0, metin.Length - 1);
            int a = 0;
            for (int i = Sonuc1 - 1; i > 0; i--)
            {
                a++;
                if (strArray[i] == '\n')
                {
                    Juri += metin.Substring(i, a);
                    break;
                }
            }
            for (int i = Sonuc1; i < Sonuc1 + 10; i++)
            {
                strArray[i] = 'a';
            }
            metin = new string(strArray);
           
            int b = 1;
            for (int e = 0; e < 5; e++)
            {
                Sonuc1 = metin.IndexOf("Jüri Üyesi", 0, metin.Length - 1);
                if (Sonuc1 != -1)
                {
                    a = 0;
                    for (int i = Sonuc1 - 1; i > 0; i--)
                    {
                        a++;
                        if (strArray[i - 1] == '\n')
                        {
                            Juri += "-  " + metin.Substring(i, a);
                            b++;
                            break;
                        }
                    }
                    for (int i = Sonuc1; i < Sonuc1 + 8; i++)
                    {
                        strArray[i] = 'a';
                    }
                    metin = new string(strArray);
                }
            }
            metin = metin2;
           
            Juri = Juri.Replace("\n", String.Empty);
            Juri = Juri.Replace("    ", String.Empty);
            TextBox8.Text = Juri;
            return Juri;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
 
                sqlCon.Open();
                SqlCommand komut2 = new SqlCommand("Select * From YoneticiPdfBilgileri Where ID=@p1 and  YazarBilgileri like'" + TextBox1.Text + "%'", sqlCon);
                    komut2.Parameters.AddWithValue("@p1", ID2);
            DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(komut2))
                {
                    sda.Fill(dt);
                    DataList1.DataSource = dt;

                    DataList1.DataBind();
                }
                sqlCon.Close();
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
              
                sqlCon.Open();
                SqlCommand komut2 = new SqlCommand("Select * From YoneticiPdfBilgileri Where ID=@p1 and DersAdi like'" + TextBox2.Text + "%'", sqlCon);
                komut2.Parameters.AddWithValue("@p1",ID2);
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(komut2))
                {
                    sda.Fill(dt);
                    DataList1.DataSource = dt;

                    DataList1.DataBind();
                    
                }
                sqlCon.Close();
            

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            sqlCon.Open();
            SqlCommand komut2 = new SqlCommand("Select * From YoneticiPdfBilgileri Where ID=@p1 and  ProjeninTeslimEdildigiDonem like'" + TextBox4.Text + "%'", sqlCon);
            komut2.Parameters.AddWithValue("@p1", ID2);
            DataTable dt = new DataTable();
            using (SqlDataAdapter sda = new SqlDataAdapter(komut2))
            {
                sda.Fill(dt);
                DataList1.DataSource = dt;

                DataList1.DataBind();
               
            }
            sqlCon.Close();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            sqlCon.Open();
            SqlCommand komut2 = new SqlCommand("Select * From YoneticiPdfBilgileri Where ID=@p1 and  ProjeBasligi like'" + TextBox5.Text + "%'", sqlCon);
            komut2.Parameters.AddWithValue("@p1", ID2);
            DataTable dt = new DataTable();
            using (SqlDataAdapter sda = new SqlDataAdapter(komut2))
            {
                sda.Fill(dt);
                DataList1.DataSource = dt;

                DataList1.DataBind();
                
            }
            sqlCon.Close();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            sqlCon.Open();
            SqlCommand komut2 = new SqlCommand("Select * From YoneticiPdfBilgileri Where  ID=@p1 and AnahtarKelimeler like'" + TextBox6.Text + "%'", sqlCon);
      
            komut2.Parameters.AddWithValue("@p1", ID2);
            DataTable dt = new DataTable();
            using (SqlDataAdapter sda = new SqlDataAdapter(komut2))
            {
                sda.Fill(dt);
                DataList1.DataSource = dt;

                DataList1.DataBind();
             
            }
            sqlCon.Close();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
          
                sqlCon.Open();
                SqlCommand komut2 = new SqlCommand("Select * From YoneticiPdfBilgileri Where ID=@p1 and DanismanBilgiler like'" + TextBox7.Text + "%'", sqlCon);
                komut2.Parameters.AddWithValue("@p1", ID2);
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(komut2))
                {
                    sda.Fill(dt);
                    DataList1.DataSource = dt;

                    DataList1.DataBind();
                }
                sqlCon.Close();
           
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
    
           
        }
    }
}