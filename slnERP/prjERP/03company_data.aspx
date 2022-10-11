<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="03company_data.aspx.cs" Inherits="prjERP.Dealer_data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:RadioButtonList ID="RbtnL_cos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RbtnL_cos_SelectedIndexChanged" RepeatDirection="Horizontal" Width="400px">
        <asp:ListItem Selected="True" Value="0">銷售商資料</asp:ListItem>
        <asp:ListItem Value="1">供應商資料</asp:ListItem>
    </asp:RadioButtonList>
    <asp:SqlDataSource ID="SD_dealer" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Dealer_data] WHERE [Dealer_id] = @Dealer_id" InsertCommand="INSERT INTO [Dealer_data] ([Dealer_name], [Dealer_phone], [Dealer_address], [Dealer_number], [Dealer_email], [Dealer_head], [Dealer_head_phone]) VALUES (@Dealer_name, @Dealer_phone, @Dealer_address, @Dealer_number, @Dealer_email, @Dealer_head, @Dealer_head_phone)" SelectCommand="SELECT * FROM [Dealer_data]" UpdateCommand="UPDATE [Dealer_data] SET [Dealer_name] = @Dealer_name, [Dealer_phone] = @Dealer_phone, [Dealer_address] = @Dealer_address, [Dealer_number] = @Dealer_number, [Dealer_email] = @Dealer_email, [Dealer_head] = @Dealer_head, [Dealer_head_phone] = @Dealer_head_phone WHERE [Dealer_id] = @Dealer_id">
        <DeleteParameters>
            <asp:Parameter Name="Dealer_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Dealer_name" Type="String" />
            <asp:Parameter Name="Dealer_phone" Type="String" />
            <asp:Parameter Name="Dealer_address" Type="String" />
            <asp:Parameter Name="Dealer_number" Type="String" />
            <asp:Parameter Name="Dealer_email" Type="String" />
            <asp:Parameter Name="Dealer_head" Type="String" />
            <asp:Parameter Name="Dealer_head_phone" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Dealer_name" Type="String" />
            <asp:Parameter Name="Dealer_phone" Type="String" />
            <asp:Parameter Name="Dealer_address" Type="String" />
            <asp:Parameter Name="Dealer_number" Type="String" />
            <asp:Parameter Name="Dealer_email" Type="String" />
            <asp:Parameter Name="Dealer_head" Type="String" />
            <asp:Parameter Name="Dealer_head_phone" Type="String" />
            <asp:Parameter Name="Dealer_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DV_dealer" runat="server" AutoGenerateRows="False" DataKeyNames="Dealer_id" DataSourceID="SD_dealer" DefaultMode="Insert" Height="50px" Width="450px">
        <Fields>
            <asp:BoundField DataField="Dealer_id" HeaderText="Dealer_id" InsertVisible="False" ReadOnly="True" SortExpression="Dealer_id" />
            
            <asp:TemplateField HeaderText="銷貨商名稱" SortExpression="Dealer_name">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Dealer_name") %>' ValidationGroup="DV_dealer" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_dealer"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="銷貨商電話" SortExpression="Dealer_phone">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="16" Text='<%# Bind("Dealer_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="DV_dealer"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="地址" SortExpression="Dealer_address">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="150" Text='<%# Bind("Dealer_address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox4" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_dealer"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="統一編號" SortExpression="Dealer_number">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="8" Text='<%# Bind("Dealer_number") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox5" ErrorMessage="*格式錯誤" ValidationExpression="^(\d{8}|$)$" ValidationGroup="DV_dealer"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="E-mail" SortExpression="Dealer_email">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="320" Text='<%# Bind("Dealer_email") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="TextBox6" ErrorMessage="*格式錯誤" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="DV_dealer"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="負責人姓名" SortExpression="Dealer_head">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Dealer_head") %>' MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_dealer"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="負責人電話" SortExpression="Dealer_head_phone">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="16" Text='<%# Bind("Dealer_head_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="TextBox7" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="DV_dealer"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_dealer"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>

        </Fields>
    </asp:DetailsView>
    <asp:GridView ID="GV_dealer" runat="server" AutoGenerateColumns="False" DataKeyNames="Dealer_id" DataSourceID="SD_dealer">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_dealer"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Dealer_id" HeaderText="Dealer_id" InsertVisible="False" ReadOnly="True" SortExpression="Dealer_id" Visible="False" />
            <asp:TemplateField HeaderText="銷貨商名稱" SortExpression="Dealer_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Dealer_name") %>' MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_dealer"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Dealer_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="銷貨商電話" SortExpression="Dealer_phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="16" Text='<%# Bind("Dealer_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="GV_dealer"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Dealer_phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="地址" SortExpression="Dealer_address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="150" Text='<%# Bind("Dealer_address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox4" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_dealer"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Dealer_address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="統一編號" SortExpression="Dealer_number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="8" Text='<%# Bind("Dealer_number") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox5" ErrorMessage="*格式錯誤" ValidationExpression="^(\d{8}|$)$" ValidationGroup="GV_dealer"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Dealer_number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-mail" SortExpression="Dealer_email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="320" Text='<%# Bind("Dealer_email") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="TextBox6" ErrorMessage="*格式錯誤" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="GV_dealer"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Dealer_email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="負責人姓名" SortExpression="Dealer_head">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Dealer_head") %>' MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_dealer"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Dealer_head") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="負責人電話" SortExpression="Dealer_head_phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="16" Text='<%# Bind("Dealer_head_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ControlToValidate="TextBox7" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="GV_dealer"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Dealer_head_phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SD_supplier" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Supplier_data] WHERE [Supplier_id] = @Supplier_id" InsertCommand="INSERT INTO [Supplier_data] ([Supplier_name], [Supplier_phone], [Supplier_address], [Supplier_number], [Supplier_email], [Supplier_head], [Supplier_head_phone]) VALUES (@Supplier_name, @Supplier_phone, @Supplier_address, @Supplier_number, @Supplier_email, @Supplier_head, @Supplier_head_phone)" SelectCommand="SELECT * FROM [Supplier_data]" UpdateCommand="UPDATE [Supplier_data] SET [Supplier_name] = @Supplier_name, [Supplier_phone] = @Supplier_phone, [Supplier_address] = @Supplier_address, [Supplier_number] = @Supplier_number, [Supplier_email] = @Supplier_email, [Supplier_head] = @Supplier_head, [Supplier_head_phone] = @Supplier_head_phone WHERE [Supplier_id] = @Supplier_id">
        <DeleteParameters>
            <asp:Parameter Name="Supplier_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Supplier_name" Type="String" />
            <asp:Parameter Name="Supplier_phone" Type="String" />
            <asp:Parameter Name="Supplier_address" Type="String" />
            <asp:Parameter Name="Supplier_number" Type="String" />
            <asp:Parameter Name="Supplier_email" Type="String" />
            <asp:Parameter Name="Supplier_head" Type="String" />
            <asp:Parameter Name="Supplier_head_phone" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Supplier_name" Type="String" />
            <asp:Parameter Name="Supplier_phone" Type="String" />
            <asp:Parameter Name="Supplier_address" Type="String" />
            <asp:Parameter Name="Supplier_number" Type="String" />
            <asp:Parameter Name="Supplier_email" Type="String" />
            <asp:Parameter Name="Supplier_head" Type="String" />
            <asp:Parameter Name="Supplier_head_phone" Type="String" />
            <asp:Parameter Name="Supplier_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DV_supplier" runat="server" AutoGenerateRows="False" DataKeyNames="Supplier_id" DataSourceID="SD_supplier" DefaultMode="Insert" Height="50px" Width="450px">
        <Fields>
            <asp:BoundField DataField="Supplier_id" HeaderText="Supplier_id" InsertVisible="False" ReadOnly="True" SortExpression="Supplier_id" />
            
            <asp:TemplateField HeaderText="供應商名稱" SortExpression="Supplier_name">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Supplier_name") %>' MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_supplier"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="供應商電話" SortExpression="Supplier_phone">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="16" Text='<%# Bind("Supplier_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="DV_supplier"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="地址" SortExpression="Supplier_address">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="150" Text='<%# Bind("Supplier_address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox4" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_supplier"></asp:RequiredFieldValidator>
                </InsertItemTemplate>               
            </asp:TemplateField>

            <asp:TemplateField HeaderText="統一編號" SortExpression="Supplier_number">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="8" Text='<%# Bind("Supplier_number") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="*格式錯誤" ValidationExpression="^(\d{8}|$)$" ValidationGroup="DV_supplier"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="E-mail" SortExpression="Supplier_email">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="320" Text='<%# Bind("Supplier_email") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="TextBox6" ErrorMessage="*格式錯誤" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="DV_supplier"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="負責人姓名" SortExpression="Supplier_head">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Supplier_head") %>' MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox2" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_supplier"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="負責人電話" SortExpression="Supplier_head_phone">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="16" Text='<%# Bind("Supplier_head_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ControlToValidate="TextBox7" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="DV_supplier"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_supplier"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>

        </Fields>
    </asp:DetailsView>
    <asp:GridView ID="GV_supplier" runat="server" AutoGenerateColumns="False" DataKeyNames="Supplier_id" DataSourceID="SD_supplier">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_supplier"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Supplier_id" HeaderText="Supplier_id" InsertVisible="False" ReadOnly="True" SortExpression="Supplier_id" Visible="False" />
            <asp:TemplateField HeaderText="供應商名稱" SortExpression="Supplier_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Supplier_name") %>' MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_supplier"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Supplier_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="供應商電話" SortExpression="Supplier_phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="16" Text='<%# Bind("Supplier_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="GV_supplier"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Supplier_phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="地址" SortExpression="Supplier_address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="150" Text='<%# Bind("Supplier_address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox4" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_supplier"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Supplier_address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="統一編號" SortExpression="Supplier_number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" MaxLength="8" Text='<%# Bind("Supplier_number") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="*格式錯誤" ValidationExpression="^(\d{8}|$)$" ValidationGroup="GV_supplier"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Supplier_number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-mail" SortExpression="Supplier_email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="320" Text='<%# Bind("Supplier_email") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="TextBox6" ErrorMessage="*格式錯誤" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="GV_supplier"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Supplier_email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="負責人姓名" SortExpression="Supplier_head">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Supplier_head") %>' MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox2" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_supplier"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Supplier_head") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="負責人電話" SortExpression="Supplier_head_phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="16" Text='<%# Bind("Supplier_head_phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server" ControlToValidate="TextBox7" ErrorMessage="*格式錯誤，除國際碼+號外其餘請輸入純數字" ValidationExpression="^(\+\d{8,15})|\d{8,16}$" ValidationGroup="GV_supplier"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Supplier_head_phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />

</asp:Content>
