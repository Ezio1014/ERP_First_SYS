<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="02product_data.aspx.cs" Inherits="prjERP.Items_data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    商品相關資料增修<br />

    <asp:Button ID="btn_pdt_new" runat="server" Text="商品資料" OnClick="btn_pdt_new_Click" />
    <asp:Button ID="Button2" runat="server" Text="商品類別大項" OnClick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="商品類別細項" OnClick="Button3_Click" />
    <br />
    <br />
    <asp:DetailsView ID="DV_product" runat="server" AutoGenerateRows="False" DataKeyNames="Item_id" DataSourceID="SD_product_data_new" Width="600px" DefaultMode="Insert" OnItemInserted="DetailsView1_ItemInserted">
        <Fields>
            <asp:BoundField DataField="Item_id" HeaderText="Item_id" InsertVisible="False" ReadOnly="True" SortExpression="Item_id" />
            
            <asp:TemplateField HeaderText="商品名稱" SortExpression="Item_Name">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Item_Name") %>' MaxLength="50" ValidationGroup="DV_product"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可空白" ValidationGroup="DV_product"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="商品類別" SortExpression="Item_C2">                
                <InsertItemTemplate>
                    <asp:DropDownList ID="DDL_C2" runat="server" DataSourceID="C1andC2" DataTextField="Item_C2" DataValueField="cid" Text='<%# Bind("Item_C2") %>' SelectedValue='<%# Bind("Item_C2") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="商品條碼(EAN)" SortExpression="EAN">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="13" Text='<%# Bind("EAN") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox7" ErrorMessage="*格式錯誤" ValidationExpression="^($|\d{8,13}$)" ValidationGroup="DV_product"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="商品定價" SortExpression="pricing">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="21" Text='<%# Bind("pricing") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="*格式錯誤，請輸入數字" ValidationExpression="^[0-9]+(.[0-9]{2})?$" ValidationGroup="DV_product"></asp:RegularExpressionValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="商品型號" SortExpression="model">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="40" Text='<%# Bind("model") %>'></asp:TextBox>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="功能說明" SortExpression="Function_Description">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Function_Description") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox4" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_product"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="商品規格" SortExpression="specification">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("specification") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox5" ErrorMessage="*欄位不可為空白" ValidationGroup="DV_product"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="說明檔案(PDF)" SortExpression="PDF">                
                <InsertItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="新建" ValidationGroup="DV_product"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="清除"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>

        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="C1andC2" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>"
        SelectCommand="select a.cid,b.Item_C1 + '--' + a.Item_C2 as item_C2 
                                        from ezio.dbo.item_C2 a left join ezio.dbo.Item_C1 b 
                                        on a.C1_id = b.cid"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SD_product_data_new" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Item_data] WHERE [Item_id] = @Item_id" InsertCommand="INSERT INTO [Item_data] ([Item_Name], [Item_C2], [EAN], [pricing], [model], [Function_Description], [specification], [PDF]) VALUES (@Item_Name, @Item_C2, @EAN, @pricing, @model, @Function_Description, @specification, @PDF)" SelectCommand="SELECT * FROM [Item_data]" UpdateCommand="UPDATE [Item_data] SET [Item_Name] = @Item_Name, [Item_C2] = @Item_C2, [EAN] = @EAN, [pricing] = @pricing, [model] = @model, [Function_Description] = @Function_Description, [specification] = @specification, [PDF] = @PDF WHERE [Item_id] = @Item_id">
        <DeleteParameters>
            <asp:Parameter Name="Item_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Item_Name" Type="String" />
            <asp:Parameter Name="Item_C2" Type="Int32" />
            <asp:Parameter Name="EAN" Type="Int32" />
            <asp:Parameter Name="pricing" Type="Decimal" />
            <asp:Parameter Name="model" Type="String" />
            <asp:Parameter Name="Function_Description" Type="String" />
            <asp:Parameter Name="specification" Type="String" />
            <asp:Parameter Name="PDF" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Item_Name" Type="String" />
            <asp:Parameter Name="Item_C2" Type="Int32" />
            <asp:Parameter Name="EAN" Type="Int32" />
            <asp:Parameter Name="pricing" Type="Decimal" />
            <asp:Parameter Name="model" Type="String" />
            <asp:Parameter Name="Function_Description" Type="String" />
            <asp:Parameter Name="specification" Type="String" />
            <asp:Parameter Name="PDF" Type="String" />
            <asp:Parameter Name="Item_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <%--下面對SqlDataSource的SelectCommand判別式做手動輸入，將C1表的大項名稱與C2表的細項名稱合併，
        使用left join、條件式為a.cid=b.c1_id，可以秀出 電動工具--衝擊和緊固工具 這樣具好辨識功能的下拉選單
        並且令a.Item_C1+'--'+b.Item_C2  as Item_C2 可以讓下拉繫結 Text='<%# Bind("Item_C2") %>'--%>

    <asp:GridView ID="GV_product" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellSpacing="5" DataKeyNames="Item_id" DataSourceID="SD_product_data" Width="800px">
        <Columns>
            <asp:BoundField DataField="Item_id" HeaderText="Item_id" InsertVisible="False" ReadOnly="True" SortExpression="Item_id" Visible="False" />
            <asp:TemplateField HeaderText="商品名稱" SortExpression="Item_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Item_Name") %>' ValidationGroup="GV_product" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可空白" ValidationGroup="GV_product"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="商品類別" SortExpression="Item_C2">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="item_class" DataTextField="item_class" DataValueField="cid" SelectedValue='<%# Bind("Item_C2") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="item_class" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>"
                        SelectCommand="select a.cid,b.item_c1 + '--' + a.item_c2 as item_class from Item_C2 a
	                                        left join Item_C1 b on a.C1_id = b.cid"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("item_c21") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EAN條碼" SortExpression="EAN">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="13" Text='<%# Bind("EAN") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*格式錯誤" ValidationExpression="^($|\d{8,13}$)" ValidationGroup="GV_product"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("EAN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="定價" SortExpression="pricing">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="21" Text='<%# Bind("pricing") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="*格式錯誤，請輸入數字" ValidationExpression="^[0-9]+(.[0-9]{2})?$" ValidationGroup="GV_product"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("pricing") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="型號" SortExpression="model">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="40" Text='<%# Bind("model") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("model") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="功能說明" SortExpression="Function_Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Function_Description") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox5" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_product"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Function_Description") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="400px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="規格" SortExpression="specification">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("specification") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox6" ErrorMessage="*欄位不可為空白" ValidationGroup="GV_product"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("specification") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="說明檔案(PDF)" SortExpression="PDF">
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload2" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("PDF") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="資料編輯" ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_product"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="80px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SD_product_data" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" 
            DeleteCommand="DELETE FROM [Item_data] WHERE [Item_id] = @Item_id" 
            InsertCommand="INSERT INTO [Item_data] ([Item_Name], [Item_C2], [EAN], [pricing], [model], [Function_Description], [specification], [PDF]) VALUES (@Item_Name, @Item_C2, @EAN, @pricing, @model, @Function_Description, @specification, @PDF)" 
            SelectCommand="SELECT a.*,b.item_c2 FROM Item_data a
	                        left join Item_C2 b on a.Item_C2 = b.cid" 
            UpdateCommand="UPDATE [Item_data] SET [Item_Name] = @Item_Name, [Item_C2] = @Item_C2, [EAN] = @EAN, [pricing] = @pricing, [model] = @model, [Function_Description] = @Function_Description, [specification] = @specification, [PDF] = @PDF WHERE [Item_id] = @Item_id">
        <DeleteParameters>
            <asp:Parameter Name="Item_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Item_Name" Type="String" />
            <asp:Parameter Name="Item_C2" Type="Int32" />
            <asp:Parameter Name="EAN" Type="Int32" />
            <asp:Parameter Name="pricing" Type="Decimal" />
            <asp:Parameter Name="model" Type="String" />
            <asp:Parameter Name="Function_Description" Type="String" />
            <asp:Parameter Name="specification" Type="String" />
            <asp:Parameter Name="PDF" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Item_Name" Type="String" />
            <asp:Parameter Name="Item_C2" Type="Int32" />
            <asp:Parameter Name="EAN" Type="Int32" />
            <asp:Parameter Name="pricing" Type="Decimal" />
            <asp:Parameter Name="model" Type="String" />
            <asp:Parameter Name="Function_Description" Type="String" />
            <asp:Parameter Name="specification" Type="String" />
            <asp:Parameter Name="PDF" Type="String" />
            <asp:Parameter Name="Item_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SD_C1_new" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Item_C1] WHERE [cid] = @cid" InsertCommand="INSERT INTO [Item_C1] ([Item_C1]) VALUES (@Item_C1)" SelectCommand="SELECT * FROM [Item_C1]" UpdateCommand="UPDATE [Item_C1] SET [Item_C1] = @Item_C1 WHERE [cid] = @cid">
        <DeleteParameters>
            <asp:Parameter Name="cid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Item_C1" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Item_C1" Type="String" />
            <asp:Parameter Name="cid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:DetailsView ID="DV_C1" runat="server" AutoGenerateRows="False" DataKeyNames="cid" DataSourceID="SD_C1_new" DefaultMode="Insert" Height="50px" Width="450px" OnItemInserted="DV_C1_ItemInserted">
        <Fields>
            <asp:BoundField DataField="cid" HeaderText="cid" InsertVisible="False" ReadOnly="True" SortExpression="cid" Visible="False" />
            
            <asp:TemplateField HeaderText="商品類別大項" SortExpression="Item_C1">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Item_C1") %>' ValidationGroup="DV_C1" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="*資料欄位不可空白" ValidationGroup="DV_C1"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_C1"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>

        </Fields>
    </asp:DetailsView>

    <asp:GridView ID="GV_C1" runat="server" AutoGenerateColumns="False" DataKeyNames="cid" DataSourceID="SD_C1_new">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_C1"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="cid" HeaderText="cid" InsertVisible="False" ReadOnly="True" SortExpression="cid" Visible="False" />
            <asp:TemplateField HeaderText="商品類別大項" SortExpression="Item_C1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Item_C1") %>' ValidationGroup="GV_C1" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可空白" ValidationGroup="GV_C1"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Item_C1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SD_C2_new" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" DeleteCommand="DELETE FROM [Item_C2] WHERE [cid] = @cid" InsertCommand="INSERT INTO [Item_C2] ([C1_id], [Item_C2]) VALUES (@C1_id, @Item_C2)" SelectCommand="SELECT * FROM [Item_C2]" UpdateCommand="UPDATE [Item_C2] SET [C1_id] = @C1_id, [Item_C2] = @Item_C2 WHERE [cid] = @cid">
        <DeleteParameters>
            <asp:Parameter Name="cid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="C1_id" Type="Int32" />
            <asp:Parameter Name="Item_C2" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="C1_id" Type="Int32" />
            <asp:Parameter Name="Item_C2" Type="String" />
            <asp:Parameter Name="cid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DV_C2" runat="server" DataSourceID="SD_C2_new" DefaultMode="Insert" Height="50px" Width="450px" AutoGenerateRows="False" DataKeyNames="cid" OnItemInserted="DV_C2_ItemInserted">
        <Fields>
            <asp:BoundField DataField="cid" HeaderText="cid" InsertVisible="False" ReadOnly="True" SortExpression="cid" />
            
            <asp:TemplateField HeaderText="商品類別大項" SortExpression="C1_id">                
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SD_C1" DataTextField="Item_C1" DataValueField="cid" SelectedValue='<%# Bind("C1_id") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField HeaderText="商品類別細項" SortExpression="Item_C2">                
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Item_C2") %>' ValidationGroup="DV_C2" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*商品細項不可空白" ValidationGroup="DV_C2"></asp:RequiredFieldValidator>
                </InsertItemTemplate>                
            </asp:TemplateField>

            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" ValidationGroup="DV_C2"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </InsertItemTemplate>                
            </asp:TemplateField>

        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SD_C1" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>" SelectCommand="SELECT * FROM [Item_C1]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SD_C2" runat="server" ConnectionString="<%$ ConnectionStrings:ezioConnectionString %>"
        SelectCommand="select a.*,b.Item_C1 from ezio.dbo.item_C2 a left join ezio.dbo.Item_C1 b on a.C1_id = b.cid"
        DeleteCommand="DELETE FROM [Item_C2] WHERE [cid] = @cid"
        InsertCommand="INSERT INTO [Item_C2] ([C1_id], [Item_C2]) VALUES (@C1_id, @Item_C2)"
        UpdateCommand="UPDATE [Item_C2] SET [C1_id] = @C1_id, [Item_C2] = @Item_C2 WHERE [cid] = @cid">
        <DeleteParameters>
            <asp:Parameter Name="cid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="C1_id" Type="Int32" />
            <asp:Parameter Name="Item_C2" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="C1_id" Type="Int32" />
            <asp:Parameter Name="Item_C2" Type="String" />
            <asp:Parameter Name="cid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GV_C2" runat="server" AutoGenerateColumns="False" DataKeyNames="cid" DataSourceID="SD_C2">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" ValidationGroup="GV_C2"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="cid" HeaderText="cid" InsertVisible="False" ReadOnly="True" SortExpression="cid" Visible="False" />
            <asp:TemplateField HeaderText="商品類別大項" SortExpression="C1_id">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SD_C1_new" DataTextField="Item_C1" DataValueField="cid" SelectedValue='<%# Bind("C1_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Item_C1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Item_C1" HeaderText="商品類別大項" SortExpression="Item_C1" Visible="False" />
            <asp:TemplateField HeaderText="商品類別細項" SortExpression="Item_C2">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Item_C2") %>' ValidationGroup="GV_C2" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="*欄位不可空白" ValidationGroup="GV_C2"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Item_C2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <br />

</asp:Content>
