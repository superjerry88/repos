<%@ Page Title="lecturer Homepage" Language="C#"  AutoEventWireup="true" CodeFile="LecturerPage.aspx.cs" Inherits="Lecturer_LecturerPage" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Lecturer Page here</p>
        </div>
        <div class="button-list">

            <asp:Button ID="text_feedback" runat="server" Text="Check Feedback" OnClick="text_feedback_Click" />
            <br />
            <br />
            <asp:Button ID="text_file" runat="server" Text="Upload Files" OnClick="text_file_Click" />
            <br />
            <br />
            <asp:Button ID="text_forum" runat="server" Text="Forum Discussion" OnClick="text_forum_Click" />
            <br />
            <br />
            <asp:Button ID="text_upload" runat="server" Text="Upload Lecturer Video" />
        </div>
    </form>
</body>
</html>
