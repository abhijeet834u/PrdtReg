<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="ProductsForm.aspx.cs" Inherits="Product.ProductsForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Question 1</title>
</head>
<body>
    <form id="form1" runat="server">

        <div style="align-items: center">

            <asp:Label ID="Label1" runat="server" Text="Product Name :"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Height="22px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="P1" ErrorMessage="Product name cannot be left empty!" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Product Category :"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Selected="True" Value="0">Select Category</asp:ListItem>
                <asp:ListItem>Mobile and Accessories</asp:ListItem>
                <asp:ListItem>Powder Detergent</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="P1" InitialValue="0" ErrorMessage="Please select a category!" ControlToValidate="DropDownList1" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Quantity :"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" Height="22px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="P1" ErrorMessage="Quantity cannot be left empty!" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ErrorMessage="Numeric Only" ControlToValidate="TextBox3"
                ValidationExpression="^\d+$" ForeColor="Red"></asp:RegularExpressionValidator>

            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Price :"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" Height="22px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="P1" ErrorMessage="Price cannot be left empty!" ControlToValidate="TextBox4" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ErrorMessage="Numeric Only" ControlToValidate="TextBox4"
                ValidationExpression="^\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Product Description :"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" Height="22px" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="P1" ErrorMessage="Please enter product description!" ControlToValidate="TextBox5" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="btn_Submit" ValidationGroup="P1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Reset" OnClick="btn_Reset" CausesValidation="False" Height="26px" Width="61px" ValidationGroup="P1" />
            <br />
        </div>
        <br />

        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="Groove" BorderWidth="1px" CellPadding="3" DataKeyNames="productId" DataSourceID="SqlDataSource1" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="productId" HeaderText="productId" ReadOnly="True" SortExpression="productId" Visible="false" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="Product Name" />
                <asp:BoundField DataField="ProductCategory" HeaderText="Product Category" SortExpression="Product Category" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="ProductDescription" HeaderText="Product Description" SortExpression="Product Description" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" BorderStyle="Solid" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" BorderStyle="Solid" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Products %>" DeleteCommand="DELETE FROM [tblProducts] WHERE [productId] = @productId" InsertCommand="INSERT INTO [tblProducts] ([productId], [ProductName], [ProductCategory], [Quantity], [Price], [ProductDescription]) VALUES (@productId, @ProductName, @ProductCategory, @Quantity, @Price, @ProductDescription)" SelectCommand="SELECT * FROM [tblProducts]" UpdateCommand="UPDATE [tblProducts] SET [ProductName] = @ProductName, [ProductCategory] = @ProductCategory, [Quantity] = @Quantity, [Price] = @Price, [ProductDescription] = @ProductDescription WHERE [productId] = @productId">
            <DeleteParameters>
                <asp:Parameter Name="productId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="productId" Type="Int32" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="ProductCategory" Type="String" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Price" Type="Int32" />
                <asp:Parameter Name="ProductDescription" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductName" Type="String" ConvertEmptyStringToNull="true" />
                <asp:Parameter Name="ProductCategory" Type="String" ConvertEmptyStringToNull="true" />
                <asp:Parameter Name="Quantity" Type="Int32" ConvertEmptyStringToNull="true" />
                <asp:Parameter Name="Price" Type="Int32" ConvertEmptyStringToNull="true" />
                <asp:Parameter Name="ProductDescription" Type="String" ConvertEmptyStringToNull="true" />
                <asp:Parameter Name="productId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>