<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yonetici.aspx.cs" Inherits="WebApplication4.Yonetici"  EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yonetici Sayfası</title>
    <style>
    .body{background:#000000;}
    .baslik{margin: 3% 0 0 25%;color:white}
    .cerceve{background:#000000; width:100%; height:80%;margin:0 3% 0 0;float:left}
    .kullanici{background:#0c6435 ;width:350px; height:600px;float:left; margin:20px 100px 0px 50px; border-radius:30px}
    .kullanicipng{background:url(img/1.png); width:250px;height:200px; margin:25px 50px 5px 50px; border-radius:30px}
    .table{display:block; margin-left:50px;}
    .labelYazi{display:block; width:200px; height:20px; font:bold 25px tahoma ;margin-top:10px ;margin-left:50px}
    .labelYazi2{display:block; width:200px; height:20px;font:bold 25px tahoma ;margin-top:0px  ;margin-left:95px; }
    .textbox{display:block; border-radius:15px; font:bold 25px tahoma; text-align:center; margin:10px 0px 0px 25px;  }
    .buton{display:block;border-radius:15px;font:bold 35px tahoma;margin:5px 0px 0px 25px}
    .sorgu{background:#0c6435 ; width:900px; height:600px;float:right;margin-left:0px;margin-top:20px;border-radius:30px ;margin-right:80px}
    .ortala{margin:10% auto} 
        .auto-style1 {
            background: #0c6435;
            width: 996px;
            height: 592px;
            float: right;
            margin-left: 0px;
            margin-top: 20px;
            border-radius: 30px;
            margin-right:50px;
    }
        .auto-style2 {
            background: #0c6435;
            width: 354px;
            height: 600px;
            float: left;
            margin: 20px 50px 0px 50px;
            border-radius: 30px;
        }
        .auto-style3 {
            margin: 10% auto 10% auto
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
      
            <h1 class="baslik" >YÖNETİCİ SAYFASINA HOŞGELDİNİZ</h1>
         <div class="cerceve">
            <%-- Kullanıcı için div --%>
                 <div class="auto-style1">
                   
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="178px" Width="840px" CssClass="auto-style3" Font-Bold="True" Font-Names="Arial" Font-Size="Large"  >
                         
                        <Columns>
                              <asp:TemplateField HeaderText="Kullanıcı Adı">                                
                                <ItemTemplate >
                                    <%# Eval("KullaniciAdi") %>
                                </ItemTemplate>
                            </asp:TemplateField>  

                              <asp:TemplateField HeaderText="Kullanıcı Şifre">                                
                                <ItemTemplate >
                                    <%# Eval("KullaniciSifre") %>
                                </ItemTemplate>
                            </asp:TemplateField>  

                            <asp:TemplateField HeaderText="ID">                                
                                <ItemTemplate >
                                    <%# Eval("ID") %>
                                </ItemTemplate>
                            </asp:TemplateField>   
                           
                            <asp:TemplateField HeaderText="Dosya Adi">                                
                                <ItemTemplate >
                                    <%# Eval("DosyaAdi") %>
                                </ItemTemplate>
                            </asp:TemplateField>  
                              <asp:TemplateField HeaderText="Pdf ID">                                
                                <ItemTemplate >
                                    <%# Eval("PdfID") %>
                                </ItemTemplate>
                            </asp:TemplateField> 
                            
                                

                           <asp:TemplateField HeaderText="Bilgiler">
                               <ItemTemplate>
                                   
                                   <%--<asp:LinkButton ID="LinkButton1" runat="server"  OnClick="LinkButton1_Click" DataKeyNames="ProfilePic" > <%# Eval("DosyaAdi") %> Bilgileri</asp:LinkButton>--%>
                              <asp:Button ID="buton1" runat="server"  OnClick="buton1_Click" Text="Bilgiler" Width="200px" Height="35px" CssClass="ortala"/>
                                   </ItemTemplate>
                           </asp:TemplateField>

                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                     </asp:GridView>
                     
                </div>
            <div class="auto-style2">
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
                       <asp:Button ID="Button1" runat="server" Text="Kullanıcıyı Ekle" Width="200px"  Height="45px" Font-Bold="true" Font-Size="25px" BackColor="#c5d08b" OnClick="Button1_Click" />
                   </td>
               </tr>
            <tr>
                   <td class="buton">
                       <asp:Button ID="Button2" runat="server" Text="Kullanıcıyı Sil" Width="200px"  Height="45px" Font-Bold="true" Font-Size="25px" BackColor="#c5d08b" OnClick="Button2_Click" />
                   </td>
               </tr>
            <tr>
                   <td class="buton">
                       <asp:Button ID="Button3" runat="server" Text="Kullanıcıyı Güncelle" Width="200px"  Height="45px" Font-Bold="true" Font-Size="20px" BackColor="#c5d08b" OnClick="Button3_Click" />
                   </td>
               </tr>
          
                
            </table>
              
            </div>
                 </form>
</body>
</html>
