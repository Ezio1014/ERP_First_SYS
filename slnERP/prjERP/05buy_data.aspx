<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="05buy_data.aspx.cs" Inherits="prjERP.buy_data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="uid" DataSourceID="buy01" Height="50px" Width="500px" DefaultMode="Insert" OnItemInserted="DetailsView1_ItemInserted">
        <Fields>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" />
            <asp:TemplateField HeaderText="訂購人員" SortExpression="staff">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("staff") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="staff" DataTextField="staff_name" DataValueField="uid" SelectedValue='<%# Bind("staff") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("staff") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="purchase_id" HeaderText="訂購單號" SortExpression="purchase_id" />
            <asp:TemplateField HeaderText="訂購日期" SortExpression="purchase_date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("purchase_date") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" SelectedDate='<%# Bind("purchase_date") %>' Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("purchase_date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="抵達日期" SortExpression="arrival_date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("arrival_date") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" SelectedDate='<%# Bind("arrival_date") %>' Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("arrival_date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="declaration_form" HeaderText="報關單號" SortExpression="declaration_form" />
            <asp:BoundField DataField="freight" HeaderText="運費" SortExpression="freight" />
            <asp:TemplateField HeaderText="付款方式" SortExpression="payway">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("payway") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="payway" DataTextField="payway" DataValueField="pid" SelectedValue='<%# Bind("payway") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("payway") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="課稅別" SortExpression="tax_style">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("tax_style") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="tax" DataTextField="tax_style" DataValueField="uid" SelectedValue='<%# Bind("tax_style") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("tax_style") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="發票聯式" SortExpression="invoice_style">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("invoice_style") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="invoice" DataTextField="invoice" DataValueField="uid" SelectedValue='<%# Bind("invoice_style") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("invoice_style") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="invoice_num" HeaderText="發票號碼" SortExpression="invoice_num" />
            <asp:TemplateField HeaderText="供應商名稱" SortExpression="supplier_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("supplier_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="supplier" DataTextField="Supplier_name" DataValueField="Supplier_id" SelectedValue='<%# Bind("supplier_name") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("supplier_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="倉庫名稱" SortExpression="warehouse_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("warehouse_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="house" DataTextField="warehouse_name" DataValueField="uid" SelectedValue='<%# Bind("warehouse_name") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("warehouse_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="address" HeaderText="地址" SortExpression="address" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="buy01" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
        DeleteCommand="DELETE FROM [Buy_data1] WHERE [uid] = @uid" 
        InsertCommand="INSERT INTO [Buy_data1] ([purchase_id], [purchase_date], [arrival_date], [staff], [declaration_form], [freight], [payway], [invoice_style], [tax_style], [invoice_num], [supplier_name], [warehouse_name], [address]) VALUES (@purchase_id, @purchase_date, @arrival_date, @staff, @declaration_form, @freight, @payway, @invoice_style, @tax_style, @invoice_num, @supplier_name, @warehouse_name, @address)" 
        SelectCommand="SELECT * FROM [Buy_data1]" 
        UpdateCommand="UPDATE [Buy_data1] SET [purchase_id] = @purchase_id, [purchase_date] = @purchase_date, [arrival_date] = @arrival_date, [staff] = @staff, [declaration_form] = @declaration_form, [freight] = @freight, [payway] = @payway, [invoice_style] = @invoice_style, [tax_style] = @tax_style, [invoice_num] = @invoice_num, [supplier_name] = @supplier_name, [warehouse_name] = @warehouse_name, [address] = @address WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            
            <asp:Parameter Name="purchase_id" Type="String" />
            <asp:Parameter DbType="Date" Name="purchase_date" />
            <asp:Parameter DbType="Date" Name="arrival_date" />
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
            <asp:Parameter Name="purchase_id" Type="String" />
            <asp:Parameter DbType="Date" Name="purchase_date" />
            <asp:Parameter DbType="Date" Name="arrival_date" />
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
    <asp:SqlDataSource ID="invoice" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT * FROM [Invoice_style]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="tax" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT * FROM [Tax_style]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="supplier" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [Supplier_id], [Supplier_name] FROM [Supplier_data]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="house" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="select a.uid,a.warehouse_name + '--' + a.warehouse_address as warehouse_name from Warehouse_data a"></asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="buy01_GV" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowEditing="GridView2_RowEditing" OnRowUpdated="GridView2_RowUpdated">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="訂購人員" SortExpression="staff" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList18" runat="server" DataSourceID="staff" DataTextField="staff_name" DataValueField="uid" SelectedValue='<%# Bind("staff") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("staff") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="staff_name" HeaderText="訂購人員" SortExpression="staff_name" />
            <asp:BoundField DataField="purchase_id" HeaderText="訂購單號" SortExpression="purchase_id" />
            <asp:BoundField DataField="purchase_date" HeaderText="訂購日期" SortExpression="purchase_date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="arrival_date" HeaderText="到貨日期" SortExpression="arrival_date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="declaration_form" HeaderText="報關單號" SortExpression="declaration_form" />
            <asp:BoundField DataField="freight" HeaderText="運費" SortExpression="freight" DataFormatString="{0:N2}" />
            <asp:TemplateField HeaderText="付款方式" SortExpression="payway" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList19" runat="server" DataSourceID="payway" DataTextField="payway" DataValueField="pid" SelectedValue='<%# Bind("payway") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("payway") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="payway1" HeaderText="付款方式" SortExpression="payway1" />
            <asp:TemplateField HeaderText="課稅別" SortExpression="tax_style" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList20" runat="server" DataSourceID="tax" DataTextField="tax_style" DataValueField="uid" SelectedValue='<%# Bind("tax_style") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("tax_style") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="tax_style1" HeaderText="課稅別" SortExpression="tax_style1" />
            <asp:TemplateField HeaderText="發票聯式" SortExpression="invoice_style" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList21" runat="server" DataSourceID="invoice" DataTextField="invoice" DataValueField="uid" SelectedValue='<%# Bind("invoice_style") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("invoice_style") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="invoice" HeaderText="發票聯式" SortExpression="invoice" />
            <asp:BoundField DataField="invoice_num" HeaderText="發票號碼" SortExpression="invoice_num" />
            <asp:TemplateField HeaderText="供應商名稱" SortExpression="supplier_name" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList22" runat="server" DataSourceID="supplier" DataTextField="Supplier_name" DataValueField="Supplier_id" SelectedValue='<%# Bind("supplier_name") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("supplier_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Supplier_name1" HeaderText="供應商名稱" SortExpression="Supplier_name1" />
            <asp:TemplateField HeaderText="倉庫名稱" SortExpression="warehouse_name" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList23" runat="server" DataSourceID="house" DataTextField="warehouse_name" DataValueField="uid" SelectedValue='<%# Bind("warehouse_name") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("warehouse_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="warehouse_name1" HeaderText="倉庫名稱" SortExpression="warehouse_name1" />
            <asp:BoundField DataField="address" HeaderText="地址" SortExpression="address" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="buy01_GV" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
        DeleteCommand="DELETE FROM [Buy_data1] WHERE [uid] = @uid" 
        InsertCommand="INSERT INTO [Buy_data1] ([purchase_id], [purchase_date], [arrival_date], [staff], [declaration_form], [freight], [payway], [invoice_style], [tax_style], [invoice_num], [supplier_name], [warehouse_name], [address]) VALUES (@purchase_id, @purchase_date, @arrival_date, @staff, @declaration_form, @freight, @payway, @invoice_style, @tax_style, @invoice_num, @supplier_name, @warehouse_name, @address)" 
        SelectCommand="select a.*,b.staff_name,c.payway,d.invoice,e.tax_style,f.Supplier_name,g.warehouse_name from Buy_data1 a
	                    left join Staff_data b on a.staff =b.uid
	                    left join Payway c on a.payway = c.pid
	                    left join Invoice_style d on a.invoice_style = d.uid
	                    left join Tax_style e on a.tax_style = e.uid
	                    left join Supplier_data f on a.Supplier_name = f.Supplier_id
	                    left join Warehouse_data g on a.warehouse_name = g.uid" 
        UpdateCommand="UPDATE [Buy_data1] SET [purchase_id] = @purchase_id, [purchase_date] = @purchase_date, [arrival_date] = @arrival_date, [staff] = @staff, [declaration_form] = @declaration_form, [freight] = @freight, [payway] = @payway, [invoice_style] = @invoice_style, [tax_style] = @tax_style, [invoice_num] = @invoice_num, [supplier_name] = @supplier_name, [warehouse_name] = @warehouse_name, [address] = @address WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="purchase_id" Type="String" />
            <asp:Parameter DbType="Date" Name="purchase_date" />
            <asp:Parameter DbType="Date" Name="arrival_date" />
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
            <asp:Parameter Name="purchase_id" Type="String" />
            <asp:Parameter DbType="Date" Name="purchase_date" />
            <asp:Parameter DbType="Date" Name="arrival_date" />
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
    <br />
    <br />
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="uid" DataSourceID="buy02" DefaultMode="Insert" Height="50px" Width="450px" OnItemInserted="DetailsView2_ItemInserted">
        <Fields>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" />
            <asp:TemplateField HeaderText="訂購單號" SortExpression="purchase_id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("purchase_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="buy01_2" DataTextField="purchase_id" DataValueField="uid" SelectedValue='<%# Bind("purchase_id") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("purchase_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="商品名稱" SortExpression="item_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("item_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="item" DataTextField="Item_Name" DataValueField="Item_id" SelectedValue='<%# Bind("item_name") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("item_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="purchase_price" HeaderText="購買價格" SortExpression="purchase_price" />
            <asp:BoundField DataField="purchase_quantity" HeaderText="購買數量" SortExpression="purchase_quantity" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="buy02" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Buy_data2] WHERE [uid] = @uid" InsertCommand="INSERT INTO [Buy_data2] ([purchase_id], [item_name], [purchase_price], [purchase_quantity]) VALUES (@purchase_id, @item_name, @purchase_price, @purchase_quantity)" SelectCommand="SELECT * FROM [Buy_data2]" UpdateCommand="UPDATE [Buy_data2] SET [purchase_id] = @purchase_id, [item_name] = @item_name, [purchase_price] = @purchase_price, [purchase_quantity] = @purchase_quantity WHERE [uid] = @uid">
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
    <asp:SqlDataSource ID="buy01_2" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [uid], [purchase_id] FROM [Buy_data1]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="item" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [Item_id], [Item_Name] FROM [Item_data]"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="buy_02_2" DataKeyNames="uid" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="訂購單號" SortExpression="purchase_id" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList16" runat="server" DataSourceID="buy01" DataTextField="purchase_id" DataValueField="uid" SelectedValue='<%# Bind("purchase_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("purchase_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="purchase_id1" HeaderText="訂購單號" SortExpression="purchase_id1" />
            <asp:TemplateField HeaderText="商品名稱" SortExpression="item_name" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList17" runat="server" DataSourceID="item" DataTextField="Item_Name" DataValueField="Item_id" SelectedValue='<%# Bind("item_name") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("item_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="item_name1" HeaderText="商品名稱" SortExpression="item_name1" />
            <asp:BoundField DataField="purchase_price" HeaderText="購買價格" SortExpression="purchase_price" />
            <asp:BoundField DataField="purchase_quantity" HeaderText="購買數量" SortExpression="purchase_quantity" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="buy_02_2" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
        DeleteCommand="DELETE FROM [Buy_data2] WHERE [uid] = @uid" 
        InsertCommand="INSERT INTO [Buy_data2] ([purchase_id], [item_name], [purchase_price], [purchase_quantity]) VALUES (@purchase_id, @item_name, @purchase_price, @purchase_quantity)" 
        SelectCommand="select a.*,b.item_name,c.purchase_id from Buy_data2 a
	                    left join Item_data b on a.item_name =b.Item_id
	                    left join Buy_data1 c on a.purchase_id = c.uid" 
        UpdateCommand="UPDATE [Buy_data2] SET [purchase_id] = @purchase_id, [item_name] = @item_name, [purchase_price] = @purchase_price, [purchase_quantity] = @purchase_quantity WHERE [uid] = @uid">
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

</asp:Content>
