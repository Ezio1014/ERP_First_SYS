<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="00login.aspx.cs" Inherits="prjERP.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" style="margin-top:30px;">

           <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body bg-primary">
                            <h4 style="color:white;">使用者登入區</h4>
                        </div>
                        <div class="card-body">

                            <br />
                            <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
                            </asp:Login>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="staff_account" HeaderText="staff_account" SortExpression="staff_account" />
                                    <asp:BoundField DataField="staff_pwd" HeaderText="staff_pwd" SortExpression="staff_pwd" />
                                    <asp:BoundField DataField="posts_name" HeaderText="posts_name" SortExpression="posts_name" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT a.staff_account,a.staff_pwd,b.posts_name
	FROM Staff_data a
	left join Posts_class b on a.posts = b.uid"></asp:SqlDataSource>
                            <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TxtPWD" runat="server"></asp:TextBox>
                            <br />
                            <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Submit" />
                            <br />

                        </div>
                     </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
