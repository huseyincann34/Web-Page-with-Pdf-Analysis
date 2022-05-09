<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kullanici.aspx.cs" Inherits="WebApplication4.Kullanici"  EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kullanıcı Sayfası</title>
    <style>
        .body{background:#000000;}
        .baslik{margin: 3% 0 0 32%;color:white}
        .cerceve{background:#000000; width:100%; height:80%;margin:0 3% 0 0;float:left}
        .kullanici{background:#0c6435 ;width:850px; height:600px;float:left; margin:2% 15%  0 25%; border-radius:30px;padding-left:2%}
        .sorgu{background:#0c6435 ; width:400px; height:600px;float:right;margin-left:0px;margin-top:20px;border-radius:30px ;margin-right:80px}
        .ortala{margin:1% 0 1% 5%}
        .auto-style1 {
            background: #0c6435;
            width: 768px;
            height: 566px;           
            margin: 2% 35% 0 27%;
            border-radius: 30px;
            padding-left: 2%;
        }
    </style>
    
</head>
<body class="body">
    <form id="form1" runat="server">
       <h1 class="baslik" >KULLANICI SAYFASINA HOŞGELDİNİZ</h1>
            <div class="cerceve">
     <%--yüklenecek pdf alanı--%>
                <div class="auto-style1">
                     <br /><br /> 
                      <asp:FileUpload ID="FileUpload1" runat="server" Height="40px" Width="300px" Font-Bold="True" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="Medium" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" Height="40px" Width="143px" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
                    <br />
                     <br />
                     <br />
           
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="158px" Width="637px"  Font-Bold="True" Font-Names="Arial" Font-Size="Large" CssClass="ortala" >
                         
                        <Columns>
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
                              <asp:Button ID="buton1" runat="server"  OnClick="buton1_Click" Text="Bilgiler" Width="300px" Height="35px" CssClass="ortala" Font-Bold="True" Font-Names="Arial" Font-Size="Large" />
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
                </div>
    </form>
</body>
</html>
