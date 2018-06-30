<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Register.</h2>

    <div class="form-horizontal">
        <h4>Create a new account.</h4>
        <hr />
        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="text_username" CssClass="col-md-2 control-label">User name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="text_username" runat="server" Width="168px"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="text_password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="text_password" runat="server" Width="165px"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Drop_roles" CssClass="col-md-2 control-label">Roles</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="Drop_roles" runat="server" Height="37px" Width="127px">
                    <asp:ListItem Value="student">Student</asp:ListItem>
                    <asp:ListItem Value="lecturer">Lecturer</asp:ListItem>
                </asp:DropDownList>
                <br />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
                <br />
        <asp:Label ID="ErrorLabel" runat="server" Font-Size="Larger"></asp:Label>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [user_ID] = @user_ID" InsertCommand="INSERT INTO [users] ([user_name], [user_password], [user_type]) VALUES (@user_name, @user_password, @user_type)" SelectCommand="SELECT * FROM [users]" UpdateCommand="UPDATE [users] SET [user_name] = @user_name, [user_password] = @user_password, [user_type] = @user_type WHERE [user_ID] = @user_ID">
                <DeleteParameters>
                    <asp:Parameter Name="user_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="text_username" Name="user_name" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="text_password" Name="user_password" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="Drop_roles" Name="user_type" PropertyName="SelectedValue" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="user_name" Type="String" />
                    <asp:Parameter Name="user_password" Type="String" />
                    <asp:Parameter Name="user_type" Type="String" />
                    <asp:Parameter Name="user_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </div>
</asp:Content>

