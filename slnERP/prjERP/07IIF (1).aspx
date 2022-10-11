<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="07IIF.aspx.cs" Inherits="prjERP.IDL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
        <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" Text="部門人事資料"></asp:Label>
    </p>
    <asp:RadioButtonList ID="RbtnL_IIF" runat="server" AutoPostBack="True" BorderStyle="Solid" CellSpacing="2" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
        <asp:ListItem Selected="True" Value="0">部門人事資料</asp:ListItem>
        <asp:ListItem Value="1">部門類別新建</asp:ListItem>
        <asp:ListItem Value="2">職位類別新建</asp:ListItem>
    </asp:RadioButtonList>
    <asp:SqlDataSource ID="SD_IIF" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
                       DeleteCommand="DELETE FROM [Staff_data] WHERE [uid] = @uid" 
                       InsertCommand="INSERT INTO [Staff_data] ([department], [posts], [staff_name], [staff_phone], [staff_cellphone], [staff_account], [staff_pwd]) VALUES (@department, @posts, @staff_name, @staff_phone, @staff_cellphone, @staff_account, @staff_pwd)" 
                       SelectCommand="SELECT * FROM [Staff_data]" 
                       UpdateCommand="UPDATE [Staff_data] SET [department] = @department, [posts] = @posts, [staff_name] = @staff_name, [staff_phone] = @staff_phone, [staff_cellphone] = @staff_cellphone, [staff_account] = @staff_account, [staff_pwd] = @staff_pwd WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="department" Type="Int32" />
            <asp:Parameter Name="posts" Type="Int32" />
            <asp:Parameter Name="staff_name" Type="String" />
            <asp:Parameter Name="staff_phone" Type="String" />
            <asp:Parameter Name="staff_cellphone" Type="String" />
            <asp:Parameter Name="staff_account" Type="String" />
            <asp:Parameter Name="staff_pwd" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="department" Type="Int32" />
            <asp:Parameter Name="posts" Type="Int32" />
            <asp:Parameter Name="staff_name" Type="String" />
            <asp:Parameter Name="staff_phone" Type="String" />
            <asp:Parameter Name="staff_cellphone" Type="String" />
            <asp:Parameter Name="staff_account" Type="String" />
            <asp:Parameter Name="staff_pwd" Type="String" />
            <asp:Parameter Name="uid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DV_IIF" runat="server" AutoGenerateRows="False" DataKeyNames="uid" DataSourceID="SD_IIF" DefaultMode="Insert" Height="60px" Width="500px" OnItemInserted="DV_IIF_ItemInserted">
        <Fields>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" />
            <asp:TemplateField HeaderText="部門類別" SortExpression="department">                
                <InsertItemTemplate>
                    <asp:DropDownList ID="IIF_dep" runat="server" Text='<%# Bind("department") %>' DataSourceID="SD_dep" DataTextField="department_name" DataValueField="uid"></asp:DropDownList>
                </InsertItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="職稱" SortExpression="posts">                
                <InsertItemTemplate>
                    <%--2021/10/29
                    繼2021/10/28的 02product_data.aspx內所建立的 Text='<%# Bind("Item_C2") %>'，這裡在製作時的方式為
                    1.將表格欄位轉成template後放入 DropDownList
                    2.設定繫結內容 DataSourceID="SD_post" 畫面顯示內容 DataTextField="posts_name" 選項值：DataValueField="uid"
                    3.編輯DataBindings：
                        繫結屬性選 SelectedValue、SelectValue繫結可從欄位繫結選取需要的項目，也可從運算式建立，雙向繫結打勾。
                    以上方式得到的結果與 02product_data.aspx內所建立的 Text='<%# Bind("Item_C2") %>'效果相同，而且可全以小精靈完成。--%>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SD_post" DataTextField="posts_name" 
                                      DataValueField="uid" SelectedValue='<%# Bind("posts") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="員工姓名" SortExpression="staff_name">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("staff_name") %>' MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_IIF"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="員工電話" SortExpression="staff_phone">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="16" Text='<%# Bind("staff_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox4" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="DV_IIF"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="員工手機" SortExpression="staff_cellphone">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="16" Text='<%# Bind("staff_cellphone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox5" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="DV_IIF"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="員工帳號" SortExpression="staff_account">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("staff_account") %>' MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBox2" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_IIF"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="員工密碼" SortExpression="staff_pwd">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" MaxLength="50" Text='<%# Bind("staff_pwd") %>'></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBox8" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="DV_IIF" ValidateEmptyText="True"></asp:CustomValidator>
                    <br />
                </InsertItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_IIF" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="清除" />
                </InsertItemTemplate>                
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SD_IIF_GV" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
        DeleteCommand="DELETE FROM [Staff_data] WHERE [uid] = @uid" 
        InsertCommand="INSERT INTO [Staff_data] ([department], [posts], [staff_name], [staff_phone], [staff_cellphone], [staff_account], [staff_pwd]) VALUES (@department, @posts, @staff_name, @staff_phone, @staff_cellphone, @staff_account, @staff_pwd)" 
        SelectCommand="select a.*, b.posts_name, department_name from staff_data a
	                    left join posts_class b on a.uid = b.uid
	                    left join Department_class c on a.uid = c.uid" 
        UpdateCommand="UPDATE [Staff_data] SET [department] = @department, [posts] = @posts, [staff_name] = @staff_name, [staff_phone] = @staff_phone, [staff_cellphone] = @staff_cellphone, [staff_account] = @staff_account, [staff_pwd] = @staff_pwd WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="department" Type="Int32" />
            <asp:Parameter Name="posts" Type="Int32" />
            <asp:Parameter Name="staff_name" Type="String" />
            <asp:Parameter Name="staff_phone" Type="String" />
            <asp:Parameter Name="staff_cellphone" Type="String" />
            <asp:Parameter Name="staff_account" Type="String" />
            <asp:Parameter Name="staff_pwd" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="department" Type="Int32" />
            <asp:Parameter Name="posts" Type="Int32" />
            <asp:Parameter Name="staff_name" Type="String" />
            <asp:Parameter Name="staff_phone" Type="String" />
            <asp:Parameter Name="staff_cellphone" Type="String" />
            <asp:Parameter Name="staff_account" Type="String" />
            <asp:Parameter Name="staff_pwd" Type="String" />
            <asp:Parameter Name="uid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GV_IIF" runat="server" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="SD_IIF_GV" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_IIF"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="部門類別" SortExpression="department" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SD_dep" DataTextField="department_name" DataValueField="uid" SelectedValue='<%# Bind("department") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("department_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="職稱" SortExpression="posts" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SD_post" DataTextField="posts_name" DataValueField="uid" SelectedValue='<%# Bind("posts") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("posts_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="department_name" HeaderText="部門類別" SortExpression="department_name" />
            <asp:BoundField DataField="posts_name" HeaderText="職稱" SortExpression="posts_name" />
            <asp:TemplateField HeaderText="員工姓名" SortExpression="staff_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("staff_name") %>' MaxLength="100"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可空白，最大100字元" ValidationExpression="^(?=.{1,100}).*$" ValidationGroup="GV_IIF"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("staff_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="員工電話" SortExpression="staff_phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("staff_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox4" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="GV_IIF"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("staff_phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="員工手機" SortExpression="staff_cellphone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("staff_cellphone") %>' MaxLength="16"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="GV_IIF"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("staff_cellphone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="員工帳號" SortExpression="staff_account">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("staff_account") %>' MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBox2" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_IIF"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("staff_account") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="員工密碼" SortExpression="staff_pwd">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("staff_pwd") %>' MaxLength="50"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="*格式錯誤" ValidationExpression="^(?!.*[^\x21-\x7e])(?=.{4,}).*$" ValidationGroup="GV_IIF"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("staff_pwd") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SD_dep" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Department_class] WHERE [uid] = @uid" InsertCommand="INSERT INTO [Department_class] ([department_name]) VALUES (@department_name)" SelectCommand="SELECT * FROM [Department_class]" UpdateCommand="UPDATE [Department_class] SET [department_name] = @department_name WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="department_name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="department_name" Type="String" />
            <asp:Parameter Name="uid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DV_dep" runat="server" AutoGenerateRows="False" DataKeyNames="uid" DataSourceID="SD_dep" DefaultMode="Insert" Height="50px" Width="400px">
        <Fields>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" />
            <asp:TemplateField HeaderText="部門類別" SortExpression="department_name">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("department_name") %>' MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_dep"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_dep"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:GridView ID="GV_dep" runat="server" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="SD_dep">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_dep"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="部門類別" SortExpression="department_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("department_name") %>' MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_dep"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("department_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SD_post" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Posts_class] WHERE [uid] = @uid" InsertCommand="INSERT INTO [Posts_class] ([posts_name]) VALUES (@posts_name)" SelectCommand="SELECT * FROM [Posts_class]" UpdateCommand="UPDATE [Posts_class] SET [posts_name] = @posts_name WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="posts_name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="posts_name" Type="String" />
            <asp:Parameter Name="uid" Type="Int32" />            
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DV_post" runat="server" AutoGenerateRows="False" DataKeyNames="uid" DataSourceID="SD_post" DefaultMode="Insert" Height="50px" Width="400px">
        <Fields>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" />
            <asp:TemplateField HeaderText="職稱" SortExpression="posts_name">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("posts_name") %>' MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_post"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_post"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:GridView ID="GV_post" runat="server" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="SD_post">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_post"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="職稱類別" SortExpression="posts_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("posts_name") %>' MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_post"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("posts_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <br />
    <br />

</asp:Content>
