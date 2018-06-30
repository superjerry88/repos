<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="LecturerFeedback.aspx.cs" Inherits="Lecturer_LecturerFeedback" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div>
            <h2>Feedback</h2>
            <p>
                <asp:Label ID="Label_Welcome" runat="server" Text="Label"></asp:Label>
            </p>
        </div>
        <div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Feedback_ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Feedback_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Feedback_ID" />
                    <asp:BoundField DataField="Feedback_Title" HeaderText="Title" SortExpression="Feedback_Title" />
                    <asp:BoundField DataField="Feedback_Description" HeaderText="Description" SortExpression="Feedback_Description" />
                    <asp:BoundField DataField="Feedback_Status" HeaderText="Status" SortExpression="Feedback_Status" />
                    <asp:BoundField DataField="Feedback_Respond" HeaderText="Respond" SortExpression="Feedback_Respond" />
                    <asp:BoundField DataField="user_fullname" HeaderText="Sender" SortExpression="user_fullname" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Feedback] WHERE [Feedback_ID] = @Feedback_ID" InsertCommand="INSERT INTO [Feedback] ([Feedback_Title], [Feedback_Description], [Feedback_Status], [Feedback_Respond], [user_ID]) VALUES (@Feedback_Title, @Feedback_Description, @Feedback_Status, @Feedback_Respond, @user_ID)" SelectCommand="SELECT Feedback.Feedback_ID, Feedback.Feedback_Title, Feedback.Feedback_Description, Feedback.Feedback_Status, Feedback.Feedback_Respond, users.user_fullname FROM Feedback INNER JOIN users ON Feedback.user_ID = users.user_ID WHERE (Feedback.Feedback_Receiver = @Feedback_Receiver)" UpdateCommand="UPDATE [Feedback] SET [Feedback_Title] = @Feedback_Title, [Feedback_Description] = @Feedback_Description, [Feedback_Status] = @Feedback_Status, [Feedback_Respond] = @Feedback_Respond, [user_ID] = @user_ID WHERE [Feedback_ID] = @Feedback_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Feedback_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Feedback_Title" Type="String" />
                    <asp:Parameter Name="Feedback_Description" Type="String" />
                    <asp:Parameter Name="Feedback_Status" Type="String" />
                    <asp:Parameter Name="Feedback_Respond" Type="String" />
                    <asp:Parameter Name="user_ID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Feedback_Receiver" SessionField="full_name" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Feedback_Title" Type="String" />
                    <asp:Parameter Name="Feedback_Description" Type="String" />
                    <asp:Parameter Name="Feedback_Status" Type="String" />
                    <asp:Parameter Name="Feedback_Respond" Type="String" />
                    <asp:Parameter Name="user_ID" Type="Int32" />
                    <asp:Parameter Name="Feedback_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        <div>
            <h3>Select an ID to Respond</h3>
            <asp:DropDownList ID="drop_feedback" runat="server" DataSourceID="SqlDataSource1" DataTextField="Feedback_ID" DataValueField="Feedback_ID" Height="16px" Width="251px">
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:TextBox ID="text_response" runat="server" Height="112px" Width="245px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="button_approve" runat="server" Text="Approve" OnClick="button_approve_Click" />
            <br />
            <br />
            <asp:Button ID="button_reject" runat="server" Height="28px" Text="Reject" Width="64px" OnClick="button_reject_Click" />
            <br />
        </div>
</asp:Content>
        
