<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentFeedback.aspx.cs" Inherits="Student_StudentFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Feedback Submission</h2>
            <p>
                <asp:Label ID="Label_Welcome" runat="server" Text="Label"></asp:Label>
            </p>
        </div>
        <div class="feedback_text">
            <asp:Label ID="label_title" runat="server" AssociatedControlID="text_title" Font-Size="Larger" Text="Feedback Title"></asp:Label>
            <br />
            <br />

            <asp:TextBox ID="text_title" runat="server" Width="231px"></asp:TextBox>

            <br />
            <br />
            <asp:Label ID="Label_description" runat="server" Text="Feedback Description" AssociatedControlID="text_description" Font-Size="Larger"></asp:Label>

            <br />
            <br />
            <asp:TextBox ID="text_description" runat="server" Height="173px" Width="239px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label_lecturer" runat="server" Font-Size="Larger" Text="Lecturer List"></asp:Label>
            <br />
            <asp:DropDownList ID="Drop_NameList" runat="server" DataSourceID="SqlDataSource2" DataTextField="user_fullname" DataValueField="user_fullname" Height="22px" Width="243px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [user_fullname] FROM [users] WHERE ([user_type] = @user_type)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="lecturer" Name="user_type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="button_submit" runat="server" OnClick="button_submit_Click" Text="Submit" Width="99px" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Feedback] WHERE [Feedback_ID] = @Feedback_ID" InsertCommand="INSERT INTO [Feedback] ([Feedback_Title], [Feedback_Description], [user_ID], [Feedback_Status], [Feedback_Respond], [Feedback_Receiver]) VALUES (@Feedback_Title, @Feedback_Description, @user_ID, @Feedback_Status, @Feedback_Respond, @Feedback_Receiver)" SelectCommand="SELECT * FROM [Feedback]" UpdateCommand="UPDATE [Feedback] SET [Feedback_Title] = @Feedback_Title, [Feedback_Description] = @Feedback_Description, [user_ID] = @user_ID, [Feedback_Status] = @Feedback_Status, [Feedback_Respond] = @Feedback_Respond, [Feedback_Receiver] = @Feedback_Receiver WHERE [Feedback_ID] = @Feedback_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Feedback_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="text_title" Name="Feedback_Title" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="text_description" Name="Feedback_Description" PropertyName="Text" Type="String" />
                    <asp:SessionParameter Name="user_ID" SessionField="user_id" Type="Int32" />
                    <asp:Parameter Name="Feedback_Status" Type="String" />
                    <asp:Parameter Name="Feedback_Respond" Type="String" />
                    <asp:ControlParameter ControlID="Drop_NameList" Name="Feedback_Receiver" PropertyName="SelectedValue" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Feedback_Title" Type="String" />
                    <asp:Parameter Name="Feedback_Description" Type="String" />
                    <asp:Parameter Name="user_ID" Type="Int32" />
                    <asp:Parameter Name="Feedback_Status" Type="String" />
                    <asp:Parameter Name="Feedback_Respond" Type="String" />
                    <asp:Parameter Name="Feedback_Receiver" Type="String" />
                    <asp:Parameter Name="Feedback_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="button_clear" runat="server" OnClick="button_clear_Click" Text="Clear" Width="100px" />

            <br />

        </div>
    <div>

        <asp:Button ID="button_back" runat="server" Text="Back To Menu" />

    </div>
    </form>
    </body>
</html>
