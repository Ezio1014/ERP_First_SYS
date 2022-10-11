<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="06warehouse_data.aspx.cs" Inherits="prjERP.warehouse_data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    新增倉儲資料<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="uid" DataSourceID="house" DefaultMode="Insert" Height="50px" Width="450px" OnItemInserted="DetailsView1_ItemInserted">
        <Fields>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" />
            <asp:TemplateField HeaderText="倉庫名稱" SortExpression="warehouse_name">
                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("warehouse_name") %>' MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_house"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="地址" SortExpression="warehouse_address">
                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("warehouse_address") %>' MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_house"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="電話" SortExpression="warehouse_phone">
                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="16" Text='<%# Bind("warehouse_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="DV_house"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="負責人員" SortExpression="staff">
                
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="staff" DataTextField="staff_name" DataValueField="uid" SelectedValue='<%# Bind("staff") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="新增" ValidationGroup="DV_house"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="清除"></asp:LinkButton>
                </InsertItemTemplate>
                
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="staff" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
                        SelectCommand="select a.uid,a.staff_name,b.department_name from
		                                Staff_data a 
                                        left join Department_class b on a.department=b.uid
                                        where b.department_name = '資材'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="house" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Warehouse_data] WHERE [uid] = @uid" InsertCommand="INSERT INTO [Warehouse_data] ([warehouse_name], [warehouse_address], [warehouse_phone], [staff]) VALUES (@warehouse_name, @warehouse_address, @warehouse_phone, @staff)" SelectCommand="SELECT * FROM [Warehouse_data]" UpdateCommand="UPDATE [Warehouse_data] SET [warehouse_name] = @warehouse_name, [warehouse_address] = @warehouse_address, [warehouse_phone] = @warehouse_phone, [staff] = @staff WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="warehouse_name" Type="String" />
            <asp:Parameter Name="warehouse_address" Type="String" />
            <asp:Parameter Name="warehouse_phone" Type="String" />
            <asp:Parameter Name="staff" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="warehouse_name" Type="String" />
            <asp:Parameter Name="warehouse_address" Type="String" />
            <asp:Parameter Name="warehouse_phone" Type="String" />
            <asp:Parameter Name="staff" Type="Int32" />
            <asp:Parameter Name="uid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="SqlDataSource1" >
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_house"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="倉庫名稱" SortExpression="warehouse_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("warehouse_name") %>' MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_house"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("warehouse_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="地址" SortExpression="warehouse_address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("warehouse_address") %>' MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_house"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("warehouse_address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="電話" SortExpression="warehouse_phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("warehouse_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="GV_house"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("warehouse_phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="負責人員" SortExpression="staff">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="staff" DataTextField="staff_name" DataValueField="uid" SelectedValue='<%# Bind("staff") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("staff_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="staff_name" HeaderText="負責人員" SortExpression="staff_name" Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
        DeleteCommand="DELETE FROM [Warehouse_data] WHERE [uid] = @uid" 
        InsertCommand="INSERT INTO [Warehouse_data] ([warehouse_name], [warehouse_address], [warehouse_phone], [staff]) VALUES (@warehouse_name, @warehouse_address, @warehouse_phone, @staff)" 
        SelectCommand="select a.*,b.staff_name from
		                Warehouse_data a
		                left join Staff_data b on a.staff=b.uid" 
        UpdateCommand="UPDATE [Warehouse_data] SET [warehouse_name] = @warehouse_name, [warehouse_address] = @warehouse_address, [warehouse_phone] = @warehouse_phone, [staff] = @staff WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="warehouse_name" Type="String" />
            <asp:Parameter Name="warehouse_address" Type="String" />
            <asp:Parameter Name="warehouse_phone" Type="String" />
            <asp:Parameter Name="staff" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="warehouse_name" Type="String" />
            <asp:Parameter Name="warehouse_address" Type="String" />
            <asp:Parameter Name="warehouse_phone" Type="String" />
            <asp:Parameter Name="staff" Type="Int32" />
            <asp:Parameter Name="uid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />

</asp:Content>
