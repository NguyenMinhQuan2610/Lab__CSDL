<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qlNhanVien.aspx.cs" Inherits="Lab__CSDL.qlNhanVine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    .container-center {
        width: 90%;
        margin: 0 auto;
    }

    .gridview-style {
        width: 100%;
        border-collapse: collapse;
        font-family: Arial, sans-serif;
        font-size: 14px;
    }

    .gridview-style th,
    .gridview-style td {
        padding: 8px 12px;
        border: 1px solid #ccc;
        text-align: center;
    }

    .gridview-style th {
        background-color: #005f8d;
        color: white;
        font-weight: bold;
    }

    .gridview-style tr:nth-child(odd) {
        background: #f9f9f9;
    }

    .gridview-style tr:hover {
        background: #e1f0ff;
    }

    .gridview-style .pager {
        text-align: center;
        font-size: 13px;
        padding-top: 10px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 class="auto-style1">DANH SÁCH NHÂN VIÊN</h2>

            <hr />

            <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" 
                DeleteCommand="DELETE FROM [NhanVien] WHERE [MaNV] = @MaNV" 
                InsertCommand="INSERT INTO [NhanVien] ([HoNV], [TenNV], [Phai], [NgaySinh], [NoiSinh], [MaPhong]) VALUES (@HoNV, @TenNV, @Phai, @NgaySinh, @NoiSinh, @MaPhong)" 
                OnSelecting="SqlDataSource1_Selecting" 
                ProviderName="<%$ ConnectionStrings:QLNhanVienConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM [NhanVien]" 
                UpdateCommand="UPDATE [NhanVien] SET [HoNV] = @HoNV, [TenNV] = @TenNV, [Phai] = @Phai, [NgaySinh] = @NgaySinh, [NoiSinh] = @NoiSinh, [MaPhong] = @MaPhong WHERE [MaNV] = @MaNV">
                <DeleteParameters>
                    <asp:Parameter Name="MaNV" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="HoNV" Type="String" />
                    <asp:Parameter Name="TenNV" Type="String" />
                    <asp:Parameter Name="Phai" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="NgaySinh" />
                    <asp:Parameter Name="NoiSinh" Type="String" />
                    <asp:Parameter Name="MaPhong" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HoNV" Type="String" />
                    <asp:Parameter Name="TenNV" Type="String" />
                    <asp:Parameter Name="Phai" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="NgaySinh" />
                    <asp:Parameter Name="NoiSinh" Type="String" />
                    <asp:Parameter Name="MaPhong" Type="Int32" />
                    <asp:Parameter Name="MaNV" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="gvNhanVien" runat="server" CssClass="gridview-style" AutoGenerateColumns="False" DataKeyNames="MaNV" DataSourceID="dsNhanVien" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="MaNV" HeaderText="Mã NV" InsertVisible="False" ReadOnly="True" SortExpression="MaNV" />
                    <asp:BoundField DataField="HoNV" HeaderText="Họ NV" SortExpression="HoNV" />
                    <asp:BoundField DataField="TenNV" HeaderText="Tên NV" SortExpression="TenNV" />
                    <asp:CheckBoxField DataField="Phai" HeaderText="Phái" SortExpression="Phai" />
                    <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" SortExpression="NgaySinh" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="NoiSinh" HeaderText="Nơi Sinh" SortExpression="NoiSinh" />
                    <asp:BoundField DataField="MaPhong" HeaderText="Mã Phòng" SortExpression="MaPhong" />
                    <asp:CommandField ShowEditButton="true" ButtonType="Button" EditText="Sửa"/>
                    <asp:CommandField ShowDeleteButton="true" ButtonType="Button" DeleteText="Xóa"/>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>

        </div>
        <br />
        <a href="Default.aspx">Go Back</a>
    </form>
</body>
</html>
