<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="LecturerForum.aspx.cs" Inherits="Lecturer_LecturerForum" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <div>
            <h2>Lecturer Forum Discussion</h2>
        </div>
        <div style="font-weight: 700">
            <asp:GridView ID="GridView1" CssClass="gridtest" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="f_topic" HeaderText="ID"/>
                    <asp:BoundField DataField="sub_topic" HeaderText="File Name"/>
                    <asp:BoundField DataField="user_fullname" HeaderText="Subject"/>
                    <asp:BoundField DataField="forum_post" HeaderText="Subject"/>
                    <asp:BoundField DataField="forum_datetime" HeaderText="Subject"/>
                </Columns>

            </asp:GridView>
        </div>
        <div>
            <h3>Filters</h3>
            <div>
            <h4>
                Forum Topic
            </h4>
            <p>
                <asp:DropDownList ID="drop_topic" runat="server" DataSourceID="SqlDataSource1" DataTextField="f_topic" DataValueField="f_topic">
                </asp:DropDownList>  
                <br />
                <br />
                <asp:Button ID="button_topic" runat="server" Text="Search" OnClick="button_topic_Click" />

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [f_topic] FROM [ForumTopic]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ForumTopic.f_topic, ForumSubtopic.sub_topic, users.user_fullname, Forum.forum_post, Forum.forum_datetime FROM Forum INNER JOIN users ON Forum.user_id = users.user_ID INNER JOIN ForumSubtopic ON Forum.sub_id = ForumSubtopic.sub_id INNER JOIN ForumTopic ON ForumSubtopic.f_id = ForumTopic.f_id WHERE (ForumTopic.f_topic = @f_topic)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="drop_topic" Name="f_topic" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
        </div>
        <div>
            <h4>
                Forum Subtopic
            </h4>
            <asp:DropDownList ID="drop_subtopic" runat="server" DataSourceID="SqlDataSource2" DataTextField="sub_topic" DataValueField="sub_topic" style="font-weight: 700"></asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="button_subtopic" runat="server" Text="Search" />                
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [sub_topic] FROM [ForumSubtopic]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ForumTopic.f_topic, ForumSubtopic.sub_topic, users.user_fullname, Forum.forum_post, Forum.forum_datetime FROM Forum INNER JOIN users ON Forum.user_id = users.user_ID INNER JOIN ForumSubtopic ON Forum.sub_id = ForumSubtopic.sub_id INNER JOIN ForumTopic ON ForumSubtopic.f_id = ForumTopic.f_id WHERE (ForumSubtopic.sub_topic = @sub_topic)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="drop_subtopic" Name="sub_topic" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        </div> 

</asp:Content>
