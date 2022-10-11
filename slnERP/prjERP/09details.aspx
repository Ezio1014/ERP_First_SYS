<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="09details.aspx.cs" Inherits="prjERP.details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
        <asp:ListItem Value="0" Selected="True">進貨明細表</asp:ListItem>
        <asp:ListItem Value="1">銷貨明細表</asp:ListItem>
        <asp:ListItem Value="2">損益表</asp:ListItem>
        <asp:ListItem Value="3">現金流量表</asp:ListItem>
        <asp:ListItem Value="4">成本報表</asp:ListItem>
        <asp:ListItem Value="5">熱銷商品表</asp:ListItem>
    </asp:RadioButtonList>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Supplier_name" DataValueField="Supplier_id" AppendDataBoundItems="True">
        <asp:ListItem Selected="True" Value="-2">--請選擇供應商--</asp:ListItem>
        <asp:ListItem Value="-1">所有供應商</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [Supplier_name], [Supplier_id] FROM [Supplier_data]"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="Dealer_name" DataValueField="Dealer_id" AppendDataBoundItems="True">
        <asp:ListItem Selected="True" Value="-2">--請選擇銷貨商--</asp:ListItem>
        <asp:ListItem Value="-1">--所有銷貨商--</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [Dealer_id], [Dealer_name] FROM [Dealer_data]"></asp:SqlDataSource>
    <br />
    起始日期<asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>
    <br />
    結束日期<asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" >
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>
    <asp:Label ID="Label2" runat="server" Text="訂購單號查詢："></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="銷貨單號查詢："></asp:Label>
    <asp:TextBox ID="TB1" runat="server" MaxLength="16"></asp:TextBox>
    <asp:Button ID="Button2" runat="server" Text="查詢" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="purchase_name" HeaderText="訂購單號" SortExpression="purchase_name" />
            <asp:BoundField DataField="staff_name" HeaderText="經辦人" SortExpression="staff_name" />
            <asp:TemplateField HeaderText="訂購日期" SortExpression="purchase_date">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("purchase_date", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="arrival_date" HeaderText="到貨日期" SortExpression="arrival_date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Supplier_name" HeaderText="供應商名稱" SortExpression="Supplier_name" />
            <asp:BoundField DataField="item_name" HeaderText="商品名稱" SortExpression="item_name" />
            <asp:BoundField DataField="purchase_price" HeaderText="訂購價格" SortExpression="purchase_price" />
            <asp:BoundField DataField="purchase_quantity" HeaderText="訂購數量" SortExpression="purchase_quantity" />
            <asp:BoundField DataField="freight" HeaderText="進貨運費" SortExpression="freight" DataFormatString="{0:c}" />
            <asp:BoundField DataField="s_money" HeaderText="小計" SortExpression="s_money" DataFormatString="{0:c}" />
            <asp:BoundField DataField="declaration_form" HeaderText="報關單號" SortExpression="declaration_form" />
            <asp:BoundField DataField="payway" HeaderText="付款方式" SortExpression="payway" />
            <asp:BoundField DataField="invoice" HeaderText="發票聯式" SortExpression="invoice" />
            <asp:BoundField DataField="invoice_num" HeaderText="發票號碼" SortExpression="invoice_num" />
            <asp:BoundField DataField="tax_style" HeaderText="課稅別" SortExpression="tax_style" />
            <asp:BoundField DataField="warehouse_name" HeaderText="倉庫名稱" SortExpression="warehouse_name" />
            <asp:BoundField DataField="address" HeaderText="其他地址" SortExpression="address" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>"
        SelectCommand="select 
                                        a.purchase_name, a.purchase_date, a.arrival_date, a.declaration_form, 
                                        a.freight, a.invoice_num, a.address, b.purchase_price, b.purchase_quantity, 
                                        c.item_name, d.staff_name, e.payway, f.invoice, g.tax_style, h.Supplier_name, 
                                        i.warehouse_name, (b.purchase_price*b.purchase_quantity) as s_money 
                                       from Buy_data1 a 
                                        left join Buy_data2 b on a.uid = b.purchase_id 
                                        left join Item_data c on b.item_name  =c.Item_id
                                        left join Staff_data d on a.staff = d.uid 
                                        left join Payway e on a.payway = e.pid 
                                        left join Invoice_style f on a.invoice_style = f.uid 
                                        left join Tax_style g on a.tax_style = g.uid 
                                        left join Supplier_data h on a.supplier_name = h.Supplier_id 
                                        left join Warehouse_data i on a.warehouse_name = i.uid 

                                       where (purchase_date between @start_date and @end_date)
                                        and (case when @supplier='-1' then 1 
                                                  when a.Supplier_name = @supplier then 1 
                                                  else 0 end) = 1
                                        and (case when  @buy_tb = 'X' then 1
                                                  when a.purchase_name LIKE '%'+@buy_tb+'%'  then 1                                                   
                                                  else 0 end) = 1
                                       ORDER BY a.purchase_date, h.Supplier_name, c.item_name
                                    ">
        <SelectParameters>
            <asp:ControlParameter ControlID="TB1" Name="buy_tb" PropertyName="Text" Type="String" DefaultValue="X" />
            <asp:ControlParameter ControlID="DropDownList1" Name="supplier" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="Calendar1" Name="start_date" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="Calendar2" Name="end_date" PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>

    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource3" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="o_id" HeaderText="銷貨單號" SortExpression="o_id" />
            <asp:BoundField DataField="order_date" HeaderText="銷貨日期" SortExpression="order_date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="staff_name" HeaderText="經辦人" SortExpression="staff_name" />
            <asp:BoundField DataField="dealer_name" HeaderText="銷貨商名稱" SortExpression="dealer_name" />
            <asp:BoundField DataField="address" HeaderText="其他地址" SortExpression="address" />
            <asp:BoundField DataField="Item_Name" HeaderText="商品名稱" SortExpression="Item_Name" />
            <asp:BoundField DataField="pricing" HeaderText="定價" SortExpression="pricing" />
            <asp:BoundField DataField="sell_quantity" HeaderText="銷貨數量" SortExpression="sell_quantity" />
            <asp:BoundField DataField="freight" HeaderText="銷貨運費" SortExpression="freight" DataFormatString="{0:c}" />
            <asp:BoundField DataField="s_money" HeaderText="小計" ReadOnly="True" SortExpression="s_money" DataFormatString="{0:c}" />
            <asp:BoundField DataField="payway" HeaderText="付款方式" SortExpression="payway" />
            <asp:BoundField DataField="tax_style" HeaderText="課稅別" SortExpression="tax_style" />
            <asp:BoundField DataField="invoice" HeaderText="發票聯式" SortExpression="invoice" />
            <asp:BoundField DataField="invoice_num" HeaderText="發票號碼" SortExpression="invoice_num" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>"
        SelectCommand="select
	                     a.o_id, a.order_date, b.staff_name, c.dealer_name, a.freight, a.address,  
	                     (g.sell_quantity * h.pricing) as s_money, d.payway, e.invoice, f.tax_style,  
	                     a.invoice_num, g.sell_quantity, h.Item_Name, h.pricing 
                       from Sell_data1 a  
	                     left join Staff_data b on a.staff = b.uid  
	                     left join Dealer_data c on a.dealer_name = c.Dealer_id  
	                     left join Payway d on a.payway = d.pid  
	                     left join Invoice_style e on a.invoice_style = e.uid  
	                     left join Tax_style f on a.tax = f.uid  
	                     left join Sell_data2 g on a.sid = g.order_id  
	                     left join Item_data h on g.item_name = h.Item_id
                       where
	                     (order_date between @start_date and @end_date)
	                     and
	                     (case when @ddl_sell = a.Dealer_name then 1
		                       when @ddl_sell = '-1' then 1
		                       else 0 end) = 1
                         and
                         (case when a.o_id like '%'+@sell_tb+'%' then 1
                               when @sell_tb = 'X' then 1
                               else 0 end) = 1
                       ORDER BY a.order_date, c.dealer_name, h.Item_Name">
        <SelectParameters>
            <asp:ControlParameter ControlID="TB1" Name="sell_tb" PropertyName="Text" Type="String" DefaultValue="X"/>
            <asp:ControlParameter ControlID="DropDownList2" Name="ddl_sell" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="Calendar1" Name="start_date" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="Calendar2" Name="end_date" PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7">
        <Columns>
            <asp:BoundField DataField="type" HeaderText="type" ReadOnly="True" SortExpression="type" />
            <asp:BoundField DataField="total" HeaderText="total" ReadOnly="True" SortExpression="total" />
            <asp:BoundField DataField="tax" HeaderText="tax" ReadOnly="True" SortExpression="tax" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>"
        SelectCommand="select v_test.type,sum(total) as total,sum(tax) as tax from v_test
                        group by v_test.type
                        union
                        select '03毛利',(select sum(total) from v_test a where a.type = '01銷貨收入')-(select sum(total) from v_test a where a.type = '02進貨成本'),null 
                        from v_test"></asp:SqlDataSource>
    <br />
    損益表02<asp:GridView ID="GridView7" runat="server" DataSourceID="SqlDataSource10">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
        SelectCommand="first_SP" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8">
        <Columns>
            <asp:BoundField DataField="type" HeaderText="項目" ReadOnly="True" SortExpression="type" />
            <asp:BoundField DataField="num" HeaderText="單號" ReadOnly="True" SortExpression="num" />
            <asp:BoundField DataField="total" DataFormatString="{0:c4}" HeaderText="總金額(現金收付)" ReadOnly="True" SortExpression="total" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>"
        SelectCommand="select '02進貨成本' as type,b.purchase_name as num 
                        ,(case when c.payway = '商業匯票' or c.payway = '銀行承兌匯票' 
		                then sum(a.purchase_price*a.purchase_quantity*d.tax_rate*c.fee)+b.freight
		                else sum(a.purchase_price*a.purchase_quantity*d.tax_rate)+c.fee+b.freight
		                end) as total
                        from Buy_data2 a
                        left join Buy_data1 b on a.purchase_id = b.uid
                        left join Payway c on b.payway = c.pid
                        left join Tax_style d on b.tax_style = d.uid
                        where c.payway = '現金'
                        group by b.purchase_name,b.freight,c.payway,c.fee
                        union select '01銷貨收入',c.o_id
                        ,sum(a.sell_quantity*b.pricing*(e.tax_rate-1))
                        from Sell_data2 a
                        left join Item_data b on a.item_name = b.Item_id
                        left join Sell_data1 c on a.order_id = c.sid
                        left join Tax_style e on c.tax = e.uid
                        left join Payway f on c.payway = f.pid
                        where f.payway = '現金'
                        group by c.o_id,c.freight"></asp:SqlDataSource>
    現金流量表02<br />
    <br />
    自<asp:Label ID="Label4" runat="server" Text="XXX"></asp:Label>
    到<asp:Label ID="Label5" runat="server" Text="XXX"></asp:Label>
    <br />
    <asp:Button ID="Button3" runat="server" Text="查詢" />
    <asp:GridView ID="GridView8" runat="server" DataSourceID="SqlDataSource11">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
        SelectCommand="sec_SP" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Calendar1" DefaultValue="1911-01-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="Calendar2" DefaultValue="2999-12-31" Name="end" PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    成本報表<br />
    <asp:GridView ID="GridView9" runat="server" DataSourceID="buy_list_forItem">
    </asp:GridView>
    <asp:SqlDataSource ID="buy_list_forItem" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
        SelectCommand="third_SP" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Calendar1" DefaultValue="1911-01-01" Name="start" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="Calendar2" DefaultValue="2999-12-31" Name="end" PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    自
    <asp:Label ID="start_date_buy" runat="server"></asp:Label>
    &nbsp;到 
    <asp:Label ID="end_date_buy" runat="server" Text=""></asp:Label>
    &nbsp;的商品成本金額(應稅+手續費)<br />
    &nbsp;<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>"
        SelectCommand="select a.purchase_name, a.freight, a.purchase_date, d.tax_style, d.tax_rate, c.payway,
	                        sum(b.purchase_price*b.purchase_quantity) as total_money01, 
	                        sum(case when c.payway = '商業匯票' then ((a.freight+(b.purchase_price*b.purchase_quantity*d.tax_rate))*(c.fee-1))
			                         when c.payway = '銀行承兌匯票' then ((a.freight+(b.purchase_price*b.purchase_quantity*d.tax_rate))*(c.fee-1))		
			                         else c.fee
			                         end) as bank_fee, 
	                        sum((b.purchase_price*b.purchase_quantity*d.tax_rate)+
		                        (case when c.payway = '商業匯票' then ((a.freight+(b.purchase_price*b.purchase_quantity*d.tax_rate))*(c.fee-1))
			                          when c.payway = '銀行承兌匯票' then ((a.freight+(b.purchase_price*b.purchase_quantity*d.tax_rate))*(c.fee-1))		
			                          else c.fee
			                          end))+a.freight as total 
                            from Buy_data1 a
	                        left join Buy_data2 b on a.uid = b.purchase_id
	                        left join Payway c on a.payway= c.pid
	                        left join Tax_style d on a.tax_style = d.uid
                        group by a.purchase_name, a.freight, a.purchase_date, d.tax_style, d.tax_rate, c.payway, c.fee
                        order by a.purchase_date"></asp:SqlDataSource>
    <br />
    TOP10<asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6">
        <Columns>
            <asp:BoundField DataField="item_name" HeaderText="商品名稱" SortExpression="item_name" />
            <asp:BoundField DataField="Item_C1" HeaderText="商品類別" SortExpression="Item_C1" />
            <asp:BoundField DataField="top10" HeaderText="銷售數量" SortExpression="top10" ReadOnly="True" />
            <asp:BoundField DataField="pricing" HeaderText="定價" SortExpression="pricing" />
            <asp:BoundField DataField="total_pricing" HeaderText="總銷售金額" ReadOnly="True" SortExpression="total_pricing" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>"
        SelectCommand="select 
    top (10) sum(a.sell_quantity) as top10 , b.item_name, b.pricing, d.Item_C1, sum(a.sell_quantity*b.pricing) as total_pricing
from Sell_data2 a 
    left join Item_data b on a.item_name = b.Item_id
    left join Item_C2 c on b.Item_C2 = c.cid
    left join Item_C1 d on c.C1_id = d.cid
group by b.item_name , d.Item_C1, b.pricing
order by sum(a.sell_quantity) desc"></asp:SqlDataSource>    

    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString='<%$ ConnectionStrings:ezioConnectionString %>' 
        SelectCommand="DiffList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="TP" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>



</asp:Content>
