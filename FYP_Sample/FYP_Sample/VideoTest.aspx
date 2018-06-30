<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VideoTest.aspx.cs" Inherits="VideoTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />  
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>  
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js" type="text/javascript"></script> 

<script type="text/javascript">  
    $(document).ready(function () {  
        $("#GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();  
    });  
</script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container py-3">  
            <h2 class="text-center text-uppercase">Video Upload and Play</h2>  
            <div class="row">  
                <div class="form-group">  
                    <label>Choose Video:</label>  
                    <div class="input-group">  
                        <div class="custom-file">  
                            <asp:FileUpload ID="FileUpload1" CssClass="custom-file-input" runat="server" />  
                            <label class="custom-file-label"></label>  
                        </div>  
                        <div class="input-group-append">  
                            <asp:Button ID="btnUpload" CssClass="btn btn-outline-secondary" runat="server" Text="Upload" OnClick="btnUpload_Click" />  
                        </div>  
                    </div>  
                </div>  
            </div>  
            <asp:Label ID="lblMessage" runat="server"></asp:Label>  
            <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="true" HeaderStyle-CssClass="bg-primary text-white" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">  
                <EmptyDataTemplate>  
                    <div class="text-center">No Data Found <strong>Upload New Video</strong></div>  
                </EmptyDataTemplate>  
                <Columns>  
                    <asp:BoundField HeaderText="ID" DataField="ID" />  
                    <asp:BoundField HeaderText="Name" DataField="Name" />  
                    <asp:TemplateField HeaderText="Videos">  
                        <ItemTemplate>  
                            <video width="130" height="130" controls>  
                                <source src='<%#Eval("Video_Path")%>' type="video/mp4">  
                            </video>  
                        </ItemTemplate>  
                    </asp:TemplateField>  
                </Columns>  
            </asp:GridView> 
            <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel> 
        </div>  
    </form>

</body>
</html>
