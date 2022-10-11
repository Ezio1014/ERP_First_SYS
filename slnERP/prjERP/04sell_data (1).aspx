<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="04sell_data.aspx.cs" Inherits="prjERP.sell_data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="500px" AutoGenerateRows="False" DataKeyNames="sid" DataSourceID="sell01_GV" DefaultMode="Insert" OnItemInserted="DetailsView1_ItemInserted">
        <Fields>
            <asp:BoundField DataField="sid" HeaderText="sid" InsertVisible="False" ReadOnly="True" SortExpression="sid" Visible="False" />
            <asp:TemplateField HeaderText="經辦人" SortExpression="staff">         
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="staff" DataTextField="staff_name" DataValueField="uid" SelectedValue='<%# Bind("staff") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="銷貨單號" SortExpression="o_id">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Text='<%# Bind("o_id") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_sell01"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="銷貨日期" SortExpression="order_date">                
                <InsertItemTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" SelectedDate='<%# Bind("order_date") %>' Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*請選取訂購日期" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True" ValidationGroup="DV_sell01"></asp:CustomValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="銷貨商名稱" SortExpression="dealer_name">                
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dealer" DataTextField="Dealer_name" DataValueField="Dealer_id" SelectedValue='<%# Bind("dealer_name") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="其他地址" SortExpression="address">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="運費" SortExpression="freight">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="21" Text='<%# Bind("freight") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="*格式錯誤" ValidationExpression="^[1-9][0-9]*(.[0-9]{2})?$" ValidationGroup="DV_sell01"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_sell01"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="付款方式" SortExpression="payway">                
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="payway" DataTextField="payway" DataValueField="pid" SelectedValue='<%# Bind("payway") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="課稅別" SortExpression="tax">                
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="tax" DataTextField="tax_style" DataValueField="uid" SelectedValue='<%# Bind("tax") %>'>
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
                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="20" Text='<%# Bind("invoice_num") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="*格式錯誤" ValidationExpression="^[A-Za-z0-9]+$" ValidationGroup="DV_sell01"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="備註" SortExpression="remark">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="150" Text='<%# Bind("remark") %>'></asp:TextBox>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_sell01"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>

        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="staff" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [uid], [staff_name] FROM [Staff_data]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dealer" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [Dealer_id], [Dealer_name] FROM [Dealer_data]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="payway" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT * FROM [Payway]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="invoice" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT * FROM [Invoice_style]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="tax" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT * FROM [Tax_style]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sid" DataSourceID="sell01_GV" OnRowUpdated="GridView1_RowUpdated">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_sell01"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="sid" HeaderText="sid" InsertVisible="False" ReadOnly="True" SortExpression="sid" Visible="False" />
            <asp:TemplateField HeaderText="經辦人" SortExpression="staff">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList10" runat="server" DataSourceID="staff" DataTextField="staff_name" DataValueField="uid" SelectedValue='<%# Bind("staff") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("staff_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="staff_name" HeaderText="經辦人" SortExpression="staff_name" Visible="False" />
            <asp:TemplateField HeaderText="銷貨單號" SortExpression="o_id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Text='<%# Bind("o_id") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_sell01"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("o_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="銷貨日期" SortExpression="order_date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("order_date", "{0:d}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("order_date", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="銷貨商名稱" SortExpression="dealer_name">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList15" runat="server" DataSourceID="tax" DataTextField="tax_style" DataValueField="uid" SelectedValue='<%# Bind("tax") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("tax_style") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="dealer" DataTextField="Dealer_name" DataValueField="Dealer_id" SelectedValue='<%# Bind("dealer_name") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("dealer_name1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="dealer_name1" HeaderText="銷貨商名稱" SortExpression="dealer_name1" Visible="False" />
            <asp:TemplateField HeaderText="其他地址" SortExpression="address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="運費" SortExpression="freight">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="21" Text='<%# Bind("freight") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="*格式錯誤" ValidationExpression="^[1-9][0-9]*(.[0-9]{2})?$" ValidationGroup="GV_sell01"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_sell01"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("freight", "{0:N2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="總金額" SortExpression="total_money">
                <EditItemTemplate>
                    <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("total_money", "{0:N2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="付款方式" SortExpression="payway">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList12" runat="server" DataSourceID="payway" DataTextField="payway" DataValueField="pid" SelectedValue='<%# Bind("payway") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("payway1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="payway1" HeaderText="付款方式" SortExpression="payway1" Visible="False" />
            <asp:TemplateField HeaderText="課稅別" SortExpression="tax">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList16" runat="server" DataSourceID="tax" DataTextField="tax_style" DataValueField="uid" SelectedValue='<%# Bind("tax") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("tax_style") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="tax_style" HeaderText="課稅別" SortExpression="tax_style" Visible="False" />
            <asp:TemplateField HeaderText="發票聯式" SortExpression="invoice_style">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList14" runat="server" DataSourceID="invoice" DataTextField="invoice" DataValueField="uid" SelectedValue='<%# Bind("invoice_style") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("invoice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="invoice" HeaderText="發票聯式" SortExpression="invoice" Visible="False" />
<asp:TemplateField HeaderText="發票號碼" SortExpression="invoice_num"><EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="20" Text='<%# Bind("invoice_num") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="*格式錯誤" ValidationExpression="^[A-Za-z0-9]+$" ValidationGroup="GV_sell01"></asp:RegularExpressionValidator>
                
</EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("invoice_num") %>'></asp:Label>
                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="備註" SortExpression="remark"><EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="150" Text='<%# Bind("remark") %>'></asp:TextBox>
                
</EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("remark") %>'></asp:Label>
                
</ItemTemplate>
</asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sell01_GV" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
        DeleteCommand="DELETE FROM [Sell_data1] WHERE [sid] = @sid" 
        InsertCommand="INSERT INTO [Sell_data1] ([o_id], [order_date], [staff], [dealer_name], [freight], [address], [payway], [invoice_style], [tax], [invoice_num], [remark]) VALUES (@o_id, @order_date, @staff, @dealer_name, @freight, @address, @payway, @invoice_style, @tax, @invoice_num, @remark)" 
        SelectCommand="select a.*,b.staff_name,c.dealer_name,d.payway,e.invoice,f.tax_style from Sell_data1 a
	                    left join Staff_data b on a.staff = b.uid
	                    left join Dealer_data c on a.dealer_name = c.Dealer_id
	                    left join Payway d on a.payway = d.pid
	                    left join Invoice_style e on a.invoice_style = e.uid
	                    left join Tax_style f on a.tax = f.uid" 
        UpdateCommand="UPDATE [Sell_data1] SET [o_id] = @o_id, [order_date] = @order_date, [staff] = @staff, [dealer_name] = @dealer_name, [freight] = @freight, [address] = @address, [total_money] = @total_money, [payway] = @payway, [invoice_style] = @invoice_style, [tax] = @tax, [invoice_num] = @invoice_num, [remark] = @remark WHERE [sid] = @sid">
        <DeleteParameters>
            <asp:Parameter Name="sid" Type="Int32" />
        </DeleteParameters>        
        <UpdateParameters>
            <asp:Parameter Name="o_id" Type="String" />
            <asp:Parameter Name="order_date" Type="DateTime" />
            <asp:Parameter Name="staff" Type="Int32" />
            <asp:Parameter Name="dealer_name" Type="Int32" />
            <asp:Parameter Name="freight" Type="Decimal" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="total_money" Type="Decimal" />
            <asp:Parameter Name="payway" Type="Int32" />
            <asp:Parameter Name="invoice_style" Type="Int32" />
            <asp:Parameter Name="tax" Type="Int32" />
            <asp:Parameter Name="invoice_num" Type="String" />
            <asp:Parameter Name="remark" Type="String" />
            <asp:Parameter Name="sid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="sid" DataSourceID="sell02_DV" DefaultMode="Insert" Height="50px" Width="450px" OnItemInserted="DetailsView2_ItemInserted">
        <Fields>
            <asp:BoundField DataField="sid" HeaderText="sid" InsertVisible="False" ReadOnly="True" SortExpression="sid" Visible="False" />
            
            <asp:TemplateField HeaderText="銷貨單號" SortExpression="o_id">                
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="s01_order" DataTextField="o_id" DataValueField="sid" SelectedValue='<%# Bind("order_id") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="商品名稱" SortExpression="item_name">                
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="item" DataTextField="Item_Name" DataValueField="Item_id" SelectedValue='<%# Bind("item_name") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="銷貨數量" SortExpression="sell_quantity">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="8" Text='<%# Bind("sell_quantity") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox1" ErrorMessage="*數量不得為0" ValidationExpression="^\+?[1-9]+[0-9]*$" ValidationGroup="DV_sell02"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_sell02"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_sell02"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>

        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sell02_DV" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
        DeleteCommand="DELETE FROM [Sell_data2] WHERE [sid] = @sid" 
        InsertCommand="INSERT INTO [Sell_data2] ([order_id], [item_name], [sell_quantity]) VALUES (@order_id, @item_name, @sell_quantity)" 
        SelectCommand="select a.*, b.o_id, c.Item_Name from Sell_data2 a
	                    left join Sell_data1 b on a.order_id = b.sid
	                    left join Item_data c on a.item_name = c.Item_id" 
        UpdateCommand="UPDATE [Sell_data2] SET [order_id] = @order_id, [item_name] = @item_name, [sell_quantity] = @sell_quantity WHERE [sid] = @sid">
        <DeleteParameters>
            <asp:Parameter Name="sid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="order_id" Type="Int32" />
            <asp:Parameter Name="item_name" Type="Int32" />
            <asp:Parameter Name="sell_quantity" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="order_id" Type="Int32" />
            <asp:Parameter Name="item_name" Type="Int32" />
            <asp:Parameter Name="sell_quantity" Type="String" />
            <asp:Parameter Name="sid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="s01_order" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [sid], [o_id] FROM [Sell_data1]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="item" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [Item_id], [Item_Name] FROM [Item_data]"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList19" runat="server" AutoPostBack="True" DataSourceID="s01_order" DataTextField="o_id" DataValueField="sid">
    </asp:DropDownList>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="sid" DataSourceID="sell02_GV">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_sell02"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="sid" HeaderText="sid" InsertVisible="False" ReadOnly="True" SortExpression="sid" Visible="False" />
            <asp:TemplateField HeaderText="銷貨單號" SortExpression="order_id">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList20" runat="server" DataSourceID="s01_order" DataTextField="o_id" DataValueField="sid" SelectedValue='<%# Bind("order_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("o_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="商品名稱" SortExpression="item_name">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList21" runat="server" DataSourceID="item" DataTextField="Item_Name" DataValueField="Item_id" SelectedValue='<%# Bind("item_name") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Item_Name1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="銷貨數量" SortExpression="sell_quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("sell_quantity") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox3" ErrorMessage="*數量不得為0" ValidationExpression="^\+?[1-9]+[0-9]*$" ValidationGroup="GV_sell02"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_sell02"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("sell_quantity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sell02_GV" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
        DeleteCommand="DELETE FROM [Sell_data2] WHERE [sid] = @sid" 
        SelectCommand="select a.*, b.o_id, c.Item_Name from Sell_data2 a
	                    left join Sell_data1 b on a.order_id = b.sid
	                    left join Item_data c on a.item_name = c.Item_id 
                        WHERE ([order_id] = @order_id)" 
        UpdateCommand="UPDATE [Sell_data2] SET [order_id] = @order_id, [item_name] = @item_name, [sell_quantity] = @sell_quantity WHERE [sid] = @sid" InsertCommand="INSERT INTO [Sell_data2] ([order_id], [item_name], [sell_quantity]) VALUES (@order_id, @item_name, @sell_quantity)">
        <DeleteParameters>
            <asp:Parameter Name="sid" Type="Int32" />
        </DeleteParameters>        
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList19" Name="order_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="order_id" Type="Int32" />
            <asp:Parameter Name="item_name" Type="Int32" />
            <asp:Parameter Name="sell_quantity" Type="String" />
            <asp:Parameter Name="sid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />

</asp:Content>
