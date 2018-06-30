<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentPage.aspx.cs" Inherits="Student_StudentPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Student Page here</p>
            <p>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Logout" />
            </p>
        </div>
        <div class="Button-List">
            
            <asp:Button ID="Button_Feedback" runat="server" Text="Submit Feedback" OnClick="Button_Feedback_Click" />
            <br />
            <br />
            <asp:Button ID="Button_Files" runat="server" Text="Access Files" OnClick="Button_Files_Click" />
            <br />
            <br />
            <asp:Button ID="Button_Forum" runat="server" Text="Forum Discussion" OnClick="Button_Forum_Click" />
            
            <br />
            <br />
            <asp:Button ID="Button_Videos" runat="server" Text="Past Lecture Videos" OnClick="Button_Videos_Click" />
            
        </div>
    </form>
</body>
</html>
