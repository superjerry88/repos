<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadFile.aspx.cs" Inherits="Lecturer_UploadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Upload File</h2>
        </div>
        <div>
            <asp:Label ID="label_upload" runat="server"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                 RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
                    AutoGenerateColumns="False">
            <Columns>
            <asp:BoundField DataField="upload_id" HeaderText="ID"/>
            <asp:BoundField DataField="file_customname" HeaderText="File Name"/>
            <asp:BoundField DataField="subject_name" HeaderText="Subject"/>
            <asp:BoundField DataField="subject_maker" HeaderText="Subject"/>
                <asp:TemplateField ItemStyle-HorizontalAlign = "Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                     CommandArgument='<%# Eval("upload_id") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderTemplate>
                     Download Link
                    </HeaderTemplate>
<ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:TemplateField>
                
    </Columns>
</asp:GridView>
 
            <br />
        </div>
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />
            <asp:Label ID="label_category" runat="server" Font-Size="Larger" Text="Select A Subject to Upload File"></asp:Label>
            <br />
            <asp:DropDownList ID="drop_name" runat="server" DataSourceID="SqlDataSource1" DataTextField="subject_name" DataValueField="subject_id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [subject_name], [subject_id] FROM [Subjects]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="label_custom" runat="server" Font-Size="Larger" Text="Custom File Name"></asp:Label>
            <br />
            <asp:TextBox ID="text_custom" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="button_upload" runat="server" Text="Upload" OnClick="button_upload_Click" style="height: 26px" />

            <br />
            <br />
            <asp:Label ID="label_create" runat="server" Font-Size="Larger" Text="Create New Subject"></asp:Label>
            <br />
            <asp:TextBox ID="text_create" runat="server" Width="195px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="button_create" runat="server" OnClick="button_create_Click" Text="Create Subject" />
            <br />
            <br />
            <asp:Button ID="button_back" runat="server" OnClick="button_back_Click" Text="Back To Menu" />
            <br />
            <br />

        </div>
    </form>
</body>
</html>
