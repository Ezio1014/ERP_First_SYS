<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="05buy_data.aspx.cs" Inherits="prjERP.buy_data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="uid" DataSourceID="SD_buy01" Height="50px" Width="500px" DefaultMode="Insert" OnItemInserted="DetailsView1_ItemInserted">
        <Fields>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" />
            <asp:TemplateField HeaderText="訂購人員" SortExpression="staff">

                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="20" Text='<%# Bind("freight") %>'></asp:TextBox>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="staff" DataTextField="staff_name" DataValueField="uid" SelectedValue='<%# Bind("staff") %>'>
                    </asp:DropDownList>

                </InsertItemTemplate>


                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="staff" DataTextField="staff_name" DataValueField="uid" SelectedValue='<%# Bind("staff") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="訂購單號" SortExpression="purchase_name">

                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="16" Text='<%# Bind("purchase_name") %>'></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不得為空白" OnServerValidate="CustomValidator3_ServerValidate" ValidateEmptyText="True" ValidationGroup="DV_buy01"></asp:CustomValidator>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="訂購日期" SortExpression="purchase_date">

                <InsertItemTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" SelectedDate='<%# Bind("purchase_date") %>' Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                    <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="*請選取訂購日期" ForeColor="Red" OnServerValidate="CustomValidator4_ServerValidate" ValidateEmptyText="True" ValidationGroup="DV_buy01"></asp:CustomValidator>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="到貨日期" SortExpression="arrival_date">

                <InsertItemTemplate>
                    <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" SelectedDate='<%# Bind("arrival_date") %>' Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                    <asp:CustomValidator ID="CustomValidator5" runat="server" ErrorMessage="*請選取到貨日期" ForeColor="Red" OnServerValidate="CustomValidator5_ServerValidate" ValidateEmptyText="True" ValidationGroup="DV_buy01"></asp:CustomValidator>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="報關單號" SortExpression="declaration_form">

                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="20" Text='<%# Bind("payway") %>'></asp:TextBox>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="運費" SortExpression="freight">

                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox16" runat="server" MaxLength="21" Text='<%# Bind("freight","{0:N2}") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox16" ErrorMessage="*格式錯誤" ValidationExpression="^[0-9]+(.[0-9]{2})?$" ValidationGroup="DV_buy01"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox16" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_buy01"></asp:RequiredFieldValidator>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="付款方式" SortExpression="payway">

                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="payway" DataTextField="payway" DataValueField="pid" SelectedValue='<%# Bind("payway") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="課稅別" SortExpression="tax_style">

                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="tax" DataTextField="tax_style" DataValueField="uid" SelectedValue='<%# Bind("tax_style") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="發票聯式" SortExpression="invoice_style">
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="invoice" DataTextField="invoice" DataValueField="uid" SelectedValue='<%# Bind("invoice_style") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="發票號碼" SortExpression="invoice_num">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox15" runat="server" MaxLength="12" Text='<%# Bind("invoice_num") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox15" ErrorMessage="*格式錯誤" ValidationExpression="^[A-Za-z0-9]+$" ValidationGroup="DV_buy01"></asp:RegularExpressionValidator>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="供應商名稱" SortExpression="supplier_name">
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="supplier" DataTextField="Supplier_name" DataValueField="Supplier_id" SelectedValue='<%# Bind("supplier_name") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="倉庫名稱" SortExpression="warehouse_name">

                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="house" DataTextField="warehouse_name" DataValueField="uid" SelectedValue='<%# Bind("warehouse_name") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="其他地址" SortExpression="address">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox14" runat="server" MaxLength="150" Text='<%# Bind("address") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_buy01"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>

            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SD_buy01" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>"
        DeleteCommand="DELETE FROM [Buy_data1] WHERE [uid] = @uid"
        InsertCommand="INSERT INTO [Buy_data1] ([purchase_name], [purchase_date], [arrival_date], [staff], [declaration_form], [freight], [payway], [invoice_style], [tax_style], [invoice_num], [supplier_name], [warehouse_name], [address]) VALUES (@purchase_name, @purchase_date, @arrival_date, @staff, @declaration_form, @freight, @payway, @invoice_style, @tax_style, @invoice_num, @supplier_name, @warehouse_name, @address)"
        SelectCommand="select a.*, b.staff_name, c.payway, d.invoice, e.tax_style, f.Supplier_name, g.warehouse_name from Buy_data1 a
	                    left join Staff_data b on a.staff = b.uid
	                    left join Payway c on a.payway = c.pid
	                    left join Invoice_style d on a.invoice_style = d.uid
	                    left join Tax_style e on a.tax_style = e.uid
	                    left join Supplier_data f on a.supplier_name = f.Supplier_id
	                    left join Warehouse_data g on a.warehouse_name = g.uid"
        UpdateCommand="UPDATE [Buy_data1] SET [purchase_name] = @purchase_name, [purchase_date] = @purchase_date, [arrival_date] = @arrival_date, [staff] = @staff, [declaration_form] = @declaration_form, [freight] = @freight, [payway] = @payway, [invoice_style] = @invoice_style, [tax_style] = @tax_style, [invoice_num] = @invoice_num, [supplier_name] = @supplier_name, [warehouse_name] = @warehouse_name, [address] = @address WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="purchase_name" Type="String" />
            <asp:Parameter Name="purchase_date" Type="DateTime" />
            <asp:Parameter Name="arrival_date" Type="DateTime" />
            <asp:Parameter Name="staff" Type="Int32" />
            <asp:Parameter Name="declaration_form" Type="String" />
            <asp:Parameter Name="freight" Type="Decimal" />
            <asp:Parameter Name="payway" Type="Int32" />
            <asp:Parameter Name="invoice_style" Type="Int32" />
            <asp:Parameter Name="tax_style" Type="Int32" />
            <asp:Parameter Name="invoice_num" Type="String" />
            <asp:Parameter Name="supplier_name" Type="Int32" />
            <asp:Parameter Name="warehouse_name" Type="Int32" />
            <asp:Parameter Name="address" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="purchase_name" Type="String" />
            <asp:Parameter Name="purchase_date" Type="DateTime" />
            <asp:Parameter Name="arrival_date" Type="DateTime" />
            <asp:Parameter Name="staff" Type="Int32" />
            <asp:Parameter Name="declaration_form" Type="String" />
            <asp:Parameter Name="freight" Type="Decimal" />
            <asp:Parameter Name="payway" Type="Int32" />
            <asp:Parameter Name="invoice_style" Type="Int32" />
            <asp:Parameter Name="tax_style" Type="Int32" />
            <asp:Parameter Name="invoice_num" Type="String" />
            <asp:Parameter Name="supplier_name" Type="Int32" />
            <asp:Parameter Name="warehouse_name" Type="Int32" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="uid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="staff" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [uid], [staff_name] FROM [Staff_data]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="payway" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT * FROM [Payway]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="tax" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT * FROM [Tax_style]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="invoice" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT * FROM [Invoice_style]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="supplier" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [Supplier_id], [Supplier_name] FROM [Supplier_data]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="house" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [uid], [warehouse_name] FROM [Warehouse_data]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="SD_buy01" OnRowUpdated="GridView1_RowUpdated" ClientIDMode="Static">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_buy01"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="訂購人員" SortExpression="staff">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="staff" DataTextField="staff_name" DataValueField="uid" SelectedValue='<%# Bind("staff") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("staff_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="訂購單號" SortExpression="purchase_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("purchase_name") %>'></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator6" runat="server" ControlToValidate="TextBox10" ErrorMessage="*欄位不可為空白" OnServerValidate="CustomValidator6_ServerValidate" ValidateEmptyText="True" ValidationGroup="GV_buy01"></asp:CustomValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Eval("purchase_name") %>' AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="訂購日期" SortExpression="purchase_date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("purchase_date","{0:d}") %>' MaxLength="24"></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToValidate="TextBox13" ErrorMessage="*欄位不可為空白" OnServerValidate="CustomValidator7_ServerValidate" ValidateEmptyText="True" ValidationGroup="GV_buy01"></asp:CustomValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("purchase_date","{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="到貨日期" SortExpression="arrival_date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("arrival_date","{0:d}") %>' MaxLength="24"></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator8" runat="server" ControlToValidate="TextBox12" ErrorMessage="*欄位不可為空白" OnServerValidate="CustomValidator8_ServerValidate" ValidateEmptyText="True" ValidationGroup="GV_buy01"></asp:CustomValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("arrival_date","{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="報關單號" SortExpression="declaration_form">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("declaration_form") %>' MaxLength="20"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("declaration_form") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="運費" SortExpression="freight">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("freight","{0:N2}") %>' MaxLength="21"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox8" ErrorMessage="*格式錯誤" ValidationExpression="^[0-9]+(.[0-9]{2})?$" ValidationGroup="GV_buy01"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox8" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_buy01"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("freight","{0:N2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="付款方式" SortExpression="payway">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList10" runat="server" DataSourceID="payway" DataTextField="payway" DataValueField="pid" SelectedValue='<%# Bind("payway") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("payway1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="課稅別" SortExpression="tax_style">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="tax" DataTextField="tax_style" DataValueField="uid" SelectedValue='<%# Bind("tax_style") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("tax_style1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="發票聯式" SortExpression="invoice_style">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList12" runat="server" DataSourceID="invoice" DataTextField="invoice" DataValueField="uid" SelectedValue='<%# Bind("invoice_style") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("invoice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="發票號碼" SortExpression="invoice_num">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("invoice_num") %>' MaxLength="12"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="*格式錯誤" ValidationExpression="^[A-Za-z0-9]+$" ValidationGroup="GV_buy01"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("invoice_num") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="供應商名稱" SortExpression="supplier_name">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList13" runat="server" DataSourceID="supplier" DataTextField="Supplier_name" DataValueField="Supplier_id" SelectedValue='<%# Bind("supplier_name") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Supplier_name1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="倉庫名稱" SortExpression="warehouse_name">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList14" runat="server" DataSourceID="house" DataTextField="warehouse_name" DataValueField="uid" SelectedValue='<%# Bind("warehouse_name") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("warehouse_name1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="其他地址" SortExpression="address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("address") %>' MaxLength="150"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="staff_name" HeaderText="staff_name" SortExpression="staff_name" Visible="False" />
            <asp:BoundField DataField="payway1" HeaderText="payway1" SortExpression="payway1" Visible="False" />
            <asp:BoundField DataField="invoice" HeaderText="invoice" SortExpression="invoice" Visible="False" />
            <asp:BoundField DataField="tax_style1" HeaderText="tax_style1" SortExpression="tax_style1" Visible="False" />
            <asp:BoundField DataField="Supplier_name1" HeaderText="Supplier_name1" SortExpression="Supplier_name1" Visible="False" />
            <asp:BoundField DataField="warehouse_name1" HeaderText="warehouse_name1" SortExpression="warehouse_name1" Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="450px" DefaultMode="Insert" AutoGenerateRows="False" DataKeyNames="uid" DataSourceID="DV_buy02" OnItemInserted="DetailsView2_ItemInserted1">
        <Fields>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" />

            <asp:TemplateField HeaderText="訂購單號" SortExpression="purchase_id">
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList16" runat="server" DataSourceID="buy01" DataTextField="purchase_name" DataValueField="uid" SelectedValue='<%# Bind("purchase_id") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="商品名稱" SortExpression="item_name">
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList15" runat="server" DataSourceID="item" DataTextField="Item_Name" DataValueField="Item_id" SelectedValue='<%# Bind("item_name") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="進貨價格" SortExpression="purchase_price">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="21" Text='<%# Bind("purchase_price") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox2" ErrorMessage="*價格不可為零" ValidationExpression="^\+?[1-9]+[0-9]*$" ValidationGroup="DV_buy02"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_buy02"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="進貨數量" SortExpression="purchase_quantity">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="8" Text='<%# Bind("purchase_quantity") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox3" ErrorMessage="*數量不可為零" ValidationExpression="^\+?[1-9]+[0-9]*$" ValidationGroup="DV_buy02"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_buy02"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_buy02"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>
            </asp:TemplateField>

        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="DV_buy02" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Buy_data2] WHERE [uid] = @uid" InsertCommand="INSERT INTO [Buy_data2] ([purchase_id], [item_name], [purchase_price], [purchase_quantity]) VALUES (@purchase_id, @item_name, @purchase_price, @purchase_quantity)" SelectCommand="SELECT * FROM [Buy_data2]" UpdateCommand="UPDATE [Buy_data2] SET [purchase_id] = @purchase_id, [item_name] = @item_name, [purchase_price] = @purchase_price, [purchase_quantity] = @purchase_quantity WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="purchase_id" Type="Int32" />
            <asp:Parameter Name="item_name" Type="Int32" />
            <asp:Parameter Name="purchase_price" Type="Decimal" />
            <asp:Parameter Name="purchase_quantity" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="purchase_id" Type="Int32" />
            <asp:Parameter Name="item_name" Type="Int32" />
            <asp:Parameter Name="purchase_price" Type="Decimal" />
            <asp:Parameter Name="purchase_quantity" Type="String" />
            <asp:Parameter Name="uid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="item" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [Item_id], [Item_Name] FROM [Item_data]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="buy01" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [uid], [purchase_name] FROM [Buy_data1]"></asp:SqlDataSource>
    訂購單號：<asp:Label ID="pid" runat="server"></asp:Label>
    <asp:DropDownList ID="DropDownList17" runat="server" AutoPostBack="True" DataSourceID="buy01" DataTextField="purchase_name" DataValueField="uid">
    </asp:DropDownList>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="GV_buy02">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_buy02"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="訂購單號" SortExpression="purchase_id">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList18" runat="server" DataSourceID="buy01" DataTextField="purchase_name" DataValueField="uid" SelectedValue='<%# Bind("purchase_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("purchase_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="商品名稱" SortExpression="item_name">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList19" runat="server" DataSourceID="item" DataTextField="Item_Name" DataValueField="Item_id" SelectedValue='<%# Bind("item_name") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Item_Name1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="進貨價格" SortExpression="purchase_price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("purchase_price") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="*價格不可為零" ValidationExpression="^\+?[1-9]+[0-9]*(.[0-9]{2})?$" ValidationGroup="GV_buy02"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_buy02"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("purchase_price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="進貨數量" SortExpression="purchase_quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("purchase_quantity") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox4" ErrorMessage="*數量不可為零" ValidationExpression="^\+?[1-9]+[0-9]*$" ValidationGroup="GV_buy02"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_buy02"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("purchase_quantity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="purchase_name" HeaderText="purchase_name" SortExpression="purchase_name" Visible="False" />
            <asp:BoundField DataField="Item_Name1" HeaderText="Item_Name1" SortExpression="Item_Name1" Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="GV_buy02" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>"
        DeleteCommand="DELETE FROM [Buy_data2] WHERE [uid] = @uid"
        SelectCommand="select a.*, b.purchase_name, c.Item_Name from Buy_data2 a
	                    left join Buy_data1 b on a.purchase_id = b.uid
	                    left join Item_data c on a.item_name = c.Item_id
                       where (a.purchase_id = @uid)
                       ORDER BY c.Item_Name"
        UpdateCommand="UPDATE [Buy_data2] SET [purchase_id] = @purchase_id, [item_name] = @item_name, [purchase_price] = @purchase_price, [purchase_quantity] = @purchase_quantity WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>

        <SelectParameters>
            <%--GridView 的 SelectedValue 屬性會傳回所選資料列的第一個資料索引鍵值，所以在這裡點選選取時回傳GirdView1的uid值--%>
            <asp:ControlParameter ControlID="GridView1" Name="uid" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>

        <UpdateParameters>
            <asp:Parameter Name="purchase_id" Type="Int32" />
            <asp:Parameter Name="item_name" Type="Int32" />
            <asp:Parameter Name="purchase_price" Type="Decimal" />
            <asp:Parameter Name="purchase_quantity" Type="String" />
            <asp:Parameter Name="uid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />

</asp:Content>
