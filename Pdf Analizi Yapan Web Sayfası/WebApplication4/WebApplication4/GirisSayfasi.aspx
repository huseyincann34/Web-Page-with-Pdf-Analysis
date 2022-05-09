a<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GirisSayfasi.aspx.cs" Inherits="WebApplication4.GirisSayfasi"  EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Giris Ekranı</title>
    <style>
    .body{background:#000000;}
    .cerceve{background:#000000; width:900px; height:600px;margin:20px auto}
    .kullanici{background:#0c6435 ;width:350px; height:500px;float:left; margin:50px 100px 50px 50px; border-radius:30px}
    .yonetici{background:#0c6435 ;width:350px; height:500px;float:right;margin:50px 50px 50px 0;border-radius:30px}    
    .kullanicipng{background:url(img/1.png); width:250px;height:200px; margin:25px 50px 5px 50px; border-radius:30px}
    .yoneticipng{background:url(img/2.png); width:250px;height:200px; margin:25px 50px 5px 50px; border-radius:30px}
    .table{display:block; margin-left:50px;}
    .labelYazi{display:block; width:200px; height:20px; font:bold 25px tahoma ;margin-top:10px ;margin-left:50px}
    .labelYazi2{display:block; width:200px; height:20px;font:bold 25px tahoma ;margin-top:0px  ;margin-left:95px; }
    .textbox{display:block;  font:bold 25px tahoma; text-align:center; margin:10px 0px 0px 25px;  }
    .buton{display:block;font:bold 35px tahoma;margin:5px 0px 0px 25px}
    </style>
</head>
<body class="body" >
    <form id="form1" runat="server" > 
        <div class="cerceve">
            <%-- Kullanıcı için div --%>
            <div class="kullanici">
            <div class="kullanicipng"></div>
            <table class="table">
            <tr >
             
                <td class="labelYazi">
                    <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı" ></asp:Label>
                </td>
                </tr>
                <tr class="textbox">
                   <td>
                       <asp:TextBox ID="TextBox1" runat="server" Width="200px" Height="30px" BackColor="#c5d08b"  BorderWidth="0px" BorderStyle="None" Font-Bold="true" Font-Size="25px" ></asp:TextBox>
                    </td>                    
                </tr>          
                <tr>                 
                    <td class="labelYazi2">
                        <asp:Label ID="Label2" runat="server" Text="Şifre"></asp:Label>
                    </td>

                </tr>
                    <tr class="textbox">
                       <td>
                        <asp:TextBox ID="TextBox2" runat="server" Width="200px" Height="30px"  BackColor="#c5d08b" BorderWidth="0px" Font-Bold="true" Font-Size="25px" TextMode="Password" ></asp:TextBox>
                       </td>
                    </tr>
               <tr>
                   <td class="buton">
                       <asp:Button ID="Button1" runat="server" Text="Giriş Yap" Width="200px"  Height="45px" Font-Bold="true" Font-Size="35px" OnClick="Button1_Click" BackColor="#c5d08b"  BorderWidth="0px"/>
                   </td>
               </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label3" runat="server" Text="Kullanıcı Adı veya Şifre Yalnış!" Font-Size="20px" ForeColor="#ffffff"></asp:Label>
                 </td>
             </tr>
                
            </table>
            </div>
            <%-- Yönetici için div --%>
            <div class="yonetici">
            <div class="yoneticipng"></div>
                 <table class="table">
            <tr >
             
                <td class="labelYazi">
                    <asp:Label ID="Label4" runat="server" Text="Kullanıcı Adı" ></asp:Label>
                </td>
                </tr>
                <tr class="textbox">
                   <td>
                       <asp:TextBox ID="TextBox3" runat="server" Width="200px" Height="30px" BackColor="#c5d08b" BorderWidth="0px" BorderStyle="None" Font-Bold="true" Font-Size="25px" ></asp:TextBox>
                    </td>                    
                </tr>          
                <tr>                 
                    <td class="labelYazi2">
                        <asp:Label ID="Label5" runat="server" Text="Şifre"></asp:Label>
                    </td>

                </tr>
                    <tr class="textbox">
                       <td>
                        <asp:TextBox ID="TextBox4" runat="server" Width="200px" Height="30px"  BackColor="#c5d08b" BorderWidth="0px" Font-Bold="true" Font-Size="25px" TextMode="Password" ></asp:TextBox>
                       </td>
                    </tr>
               <tr>
                   <td class="buton">
                       <asp:Button ID="Button2" runat="server" Text="Giriş Yap" Width="200px"  Height="45px" Font-Bold="true" Font-Size="35px" OnClick="Button2_Click"  BackColor="#c5d08b"  BorderWidth="0px"/>
                   </td>
               </tr>
             <tr>
                 <td>
                     <asp:Label ID="Label6" runat="server" Text="Kullanıcı Adı veya Şifre Yalnış!" Font-Size="20px"  ForeColor="#ffffff"></asp:Label>
                 </td>
             </tr>
                
            </table>
            </div>
        </div>
    </form>
</body>
</html>
