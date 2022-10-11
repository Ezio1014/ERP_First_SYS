<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="10buy_list.aspx.cs" Inherits="prjERP._10buy_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="DDL01" DataTextField="Supplier_name" DataValueField="Supplier_name">
    <asp:ListItem Selected="True" Value="X">--所有供應商--</asp:ListItem>
</asp:DropDownList>
<asp:SqlDataSource ID="DDL01" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT [Supplier_name] FROM [Supplier_data]"></asp:SqlDataSource>
    <br />
    <br />
    訂購單號模糊查詢：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <br />
    供應商名稱模糊查詢：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
<asp:Button ID="Button1" runat="server" Text="查詢" />
&nbsp;&nbsp;&nbsp;<br />
&nbsp;<asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
    <OtherMonthDayStyle ForeColor="#999999" />
    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
    <TodayDayStyle BackColor="#CCCCCC" />
</asp:Calendar>
<asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
    <OtherMonthDayStyle ForeColor="#999999" />
    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
    <TodayDayStyle BackColor="#CCCCCC" />
</asp:Calendar>
<asp:GridView ID="GridView1" runat="server" DataSourceID="GV_buy_list">
</asp:GridView>
<asp:SqlDataSource ID="GV_buy_list" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="purchase_list" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="Calendar1" DefaultValue="1911-01-01" Name="start_date" PropertyName="SelectedDate" Type="DateTime" />
        <asp:ControlParameter ControlID="Calendar2" DefaultValue="2999-12-31" Name="end_date" PropertyName="SelectedDate" Type="DateTime" />
        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="X" Name="supplier" PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter ControlID="TextBox1" DefaultValue="X" Name="txtSupplier" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="TextBox2" DefaultValue="X" Name="txtPurchaseNum" PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<br />
</asp:Content>
