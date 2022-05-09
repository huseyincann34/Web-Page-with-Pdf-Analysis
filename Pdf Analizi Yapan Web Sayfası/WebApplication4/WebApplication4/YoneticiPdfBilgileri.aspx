
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YoneticiPdfBilgileri.aspx.cs" Inherits="WebApplication4.YoneticiPdfBilgileri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kullanici PDF Sayfasi</title>
    <style>
        .baslik{margin: 1% 0 0 32%;color:white}
        .body{background:#000000;}
        .cerceve{background:#000000; width:100%; height:85%;margin:0 3% 0 0;float:left}
        .kullanici{background:#0c6435 ;width:45%; height:650px;float:left; margin-top:1%;margin-left:1%; border-radius:30px;padding-left:2%}
        .sorgu{background:#0c6435 ; width:40%; height:650px;float:right;margin-top:1%; border-radius:30px }
        .labelYazi{display:block; width:400px; height:25px; font:bold 25px tahoma ;margin-top:5px ;margin-left:50px}
        .ortala{margin-left:5px}
        .auto-style1 {
            background: #0c6435;
            width: 40%;
            height: 1035px;
            float: left;
            margin-top: 1%;
         
            margin-left: 1%;
            border-radius: 30px;
            padding-left: 2%;
        }
        .auto-style2 {
            background: #0c6435;
            width: 55%;
            height: 1032px;
            float: right;
            margin-top: 1%;
            border-radius: 30px;
            color:aliceblue;
        }
        .auto-style3 {
            display: block;
            font: bold 25px tahoma;
            margin-top: 5px;
            
        }
        .auto-style4 {
            display: block;
            font: bold 25px tahoma;
            margin-top: 0px;
            margin-left: 50px;
        }
        .auto-style5 {
            display: block;
            font: bold 25px tahoma;
            margin-top: 5px;
            margin-left: 50px;
        }
        .auto-style6 {
            background: #000000;
            width: 97%;
            height: 1089px;
            margin: 0 3% 0 0;
            float: left;
        }
        .auto-style7 {
            width: 100%;
        }
        .Bir{Width:5%}
        .iki{Width:10%}
        .uc{Width:15%}
        .dort{Width:10%}
        .bes{Width:10%}
        .alti{Width:20%}
        .yedi{Width:10%}
        .sekiz{Width:20%}

        </style>
</head>
<body class="body">
    <form id="form2" runat="server">
        <h1 class="baslik" >KULLANICILARIN PDF BİLGİLERİ</h1>
        <div class="auto-style6">
            <%--Bilgiler Kısmı--%>
            <div class="auto-style2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" SelectCommand="SELECT * FROM [YoneticiPdfBilgileri]"></asp:SqlDataSource>
                <br />
                <br />
                <br />
                &nbsp;&nbsp;<asp:DataList ID="DataList1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" Width="100%" Height="500px" CssClass="ortala">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        <table class="auto-style7">
                            <tr>
                                <td class="Bir">ID</td>
                                <td class="iki">Yazar Bilgisi</td>
                                <td class="uc">Ders adı</td>
                               
                                <td class="dort">Tarih</td>
                                <td class="bes">Baslik</td>
                                <td class="alti">Anahtar Kelimeler</td>
                                <td class="yedi">Danışman</td>
                                <td class="sekiz">Juri Bilgisi</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="White" />
                    <ItemTemplate>
                        <table class="auto-style7">
                            <tr>
                                <td class="Bir"><%# Eval("PdfID")%></td>
                                <td class="iki"><%# Eval("YazarBilgileri")%></td>
                                <td class="uc"><%# Eval("DersAdi")%></td>
                               
                                <td class="dort"><%# Eval("ProjeninTeslimEdildigiDonem")%></td>
                                <td class="bes"><%# Eval("ProjeBasligi")%></td>
                                <td class="alti"><%# Eval("AnahtarKelimeler")%></td>
                                <td class="yedi"><%# Eval("DanismanBilgiler")%></td>
                                <td class="sekiz"><%# Eval("JuriBilgileri")%></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
            </div>
            <div class="auto-style1">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Yazar Bilgileri" CssClass="auto-style3" Width="210px" ForeColor="White"></asp:Label>
                    <br />
                    <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Height="32px" Width="400px" Font-Bold="True" Font-Names="Arial" Font-Size="18px"></asp:TextBox> 
                    <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Height="37px" OnClick="Button1_Click" Text="Ara" Width="65px" />
                    <br /> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Label ID="Label2" runat="server" Text="Ders Adı" CssClass="auto-style3" Width="217px" ForeColor="White"></asp:Label>
                    <br />
                    <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Height="32px" Width="400px" Font-Bold="True" Font-Names="Arial" Font-Size="18px"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="Ara" OnClick="Button2_Click" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Height="37px" Width="65px" />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:Label ID="Label3" runat="server" Text="Proje Özeti" CssClass="auto-style3" Height="34px" ForeColor="White"></asp:Label>
                    <br />
                    <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox3" runat="server" Height="212px" Width="400px" Font-Bold="True" Font-Names="Arial" Font-Size="18px" TextMode="MultiLine" > </asp:TextBox>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" Text="Projenin Teslim Edildiği Dönem" CssClass="auto-style3" Height="35px" Width="412px" ForeColor="White" ></asp:Label>
                    <br />
                    <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox4" runat="server" Height="32px" Width="400px" Font-Bold="True" Font-Names="Arial" Font-Size="18px"></asp:TextBox>
                    <asp:Button ID="Button4" runat="server" Text="Ara" OnClick="Button4_Click" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Height="37px" Width="65px" />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Text="Proje Başlığı" CssClass="auto-style3" Height="33px" Width="184px" ForeColor="White"></asp:Label>
                    <br />
&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox5" runat="server" Height="32px" Width="400px" Font-Bold="True" Font-Names="Arial" Font-Size="18px"></asp:TextBox>
                    <asp:Button ID="Button5" runat="server" Text="Ara" OnClick="Button5_Click" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Height="37px" Width="65px" />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server" Text="Anahtar Kelimeler" CssClass="auto-style4" Width="249px" ForeColor="White"></asp:Label>
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox6" runat="server" Height="32px" Width="400px" Font-Bold="True" Font-Italic="False" Font-Names="Arial" Font-Size="18px"></asp:TextBox>
                    <asp:Button ID="Button6" runat="server" Text="Ara" OnClick="Button6_Click" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Height="37px" Width="65px" />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label7" runat="server" Text="Danışman Bilgileri" CssClass="auto-style5" Width="264px" ForeColor="White" ></asp:Label>
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox7" runat="server" Height="32px" Width="400px" Font-Bold="True" Font-Names="Arial" Font-Size="18px"></asp:TextBox>
                    <asp:Button ID="Button7" runat="server" Text="Ara" OnClick="Button7_Click" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Height="37px" Width="65px" />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label8" runat="server" Text="Jüri Bilgileri" CssClass="auto-style5" Width="262px" ForeColor="White"></asp:Label>
                    <br />
                    <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox8" runat="server" Height="32px" Width="400px" Font-Bold="True" Font-Names="Arial" Font-Size="18px" ></asp:TextBox>
            </div>
            <br />
            <%--Sorgu Kısmı--%>
        </div>
    </form>
</body>
</html>
