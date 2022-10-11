<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="08finance_class.aspx.cs" Inherits="prjERP.MIT_class" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
        <asp:ListItem Selected="True" Value="0">收款方式</asp:ListItem>
        <asp:ListItem Value="1">發票聯式</asp:ListItem>
        <asp:ListItem Value="2">課稅別</asp:ListItem>
    </asp:RadioButtonList>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="pid" DataSourceID="way" DefaultMode="Insert" Height="50px" OnItemInserted="DetailsView1_ItemInserted" Width="400px">
        <Fields>
            <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" ReadOnly="True" SortExpression="pid" Visible="False" />
            <asp:TemplateField HeaderText="付款方式" SortExpression="payway">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("payway") %>' MaxLength="8"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_pay"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_pay"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="way" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Payway] WHERE [pid] = @pid" InsertCommand="INSERT INTO [Payway] ([payway]) VALUES (@payway)" SelectCommand="SELECT * FROM [Payway]" UpdateCommand="UPDATE [Payway] SET [payway] = @payway WHERE [pid] = @pid">
        <DeleteParameters>
            <asp:Parameter Name="pid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="payway" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="payway" Type="String" />
            <asp:Parameter Name="pid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="pid" DataSourceID="way">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_pay"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" ReadOnly="True" SortExpression="pid" Visible="False" />
            <asp:TemplateField HeaderText="付款方式" SortExpression="payway">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("payway") %>' MaxLength="8"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_pay"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("payway") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="uid" DataSourceID="invoice" DefaultMode="Insert" Height="50px" OnItemInserted="DetailsView2_ItemInserted" Width="400px">
        <Fields>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="發票聯式" SortExpression="invoice">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("invoice") %>' MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_inv"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("invoice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_inv"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="invoice" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Invoice_style] WHERE [uid] = @uid" InsertCommand="INSERT INTO [Invoice_style] ([invoice]) VALUES (@invoice)" SelectCommand="SELECT * FROM [Invoice_style]" UpdateCommand="UPDATE [Invoice_style] SET [invoice] = @invoice WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="invoice" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="invoice" Type="String" />
            <asp:Parameter Name="uid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="invoice">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_inv"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="發票聯式" SortExpression="invoice">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("invoice") %>' MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_inv"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("invoice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataKeyNames="uid" DataSourceID="tax" DefaultMode="Insert" Height="50px" OnItemInserted="DetailsView3_ItemInserted" Width="400px">
        <Fields>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="課稅別" SortExpression="tax_style">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tax_style") %>' MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_tax"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_tax"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="tax" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Tax_style] WHERE [uid] = @uid" InsertCommand="INSERT INTO [Tax_style] ([tax_style]) VALUES (@tax_style)" SelectCommand="SELECT * FROM [Tax_style]" UpdateCommand="UPDATE [Tax_style] SET [tax_style] = @tax_style WHERE [uid] = @uid">
        <DeleteParameters>
            <asp:Parameter Name="uid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="tax_style" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tax_style" Type="String" />
            <asp:Parameter Name="uid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="tax">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_tax"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" ReadOnly="True" SortExpression="uid" Visible="False" />
            <asp:TemplateField HeaderText="課稅別" SortExpression="tax_style">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tax_style") %>' MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_tax"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("tax_style") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />

</asp:Content>
