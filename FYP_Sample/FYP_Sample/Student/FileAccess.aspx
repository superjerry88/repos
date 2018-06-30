<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileAccess.aspx.cs" Inherits="Student_FileAccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Student Download Files</h2>
        </div>
        <div>
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
        </div>
        <div>
            <h4>Filter Subject</h4>
            <asp:DropDownList ID="drop_subject" runat="server" DataSourceID="SqlDataSource1" DataTextField="subject_name" DataValueField="subject_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [subject_id], [subject_name] FROM [Subjects]"></asp:SqlDataSource>
            <asp:Button ID="button_filter" runat="server" OnClick="button_filter_Click" Text="Filter" />
            <asp:Button ID="button_reset" runat="server" OnClick="button_reset_Click" Text="Reset" />
            <br />
            <br />
            <asp:Button ID="button_back" runat="server" OnClick="button_back_Click" Text="Back To Menu" />
            <br />

        </div>
    </form>
</body>
</html>
