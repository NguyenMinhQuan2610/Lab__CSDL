<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qlPhongBan.aspx.cs" Inherits="Lab__CSDL.qlPhongBan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container-center {
            width: 90%;
            margin: 30px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: 600;
            font-size: 26px;
        }

        #Panel1 {
            width: 350px;
            margin: 0 auto 15px auto;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            background: #ffffff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

            #Panel1 legend {
                font-weight: 600;
                color: #333;
                font-size: 16px;
            }

        .filter-center {
            text-align: center;
        }

        #ddlPhongBan {
            width: 220px;
            padding: 6px 10px;
            font-size: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 12px;
        }

            table th, table td {
                padding: 10px 12px;
                border-bottom: 1px solid #dee2e6;
                font-size: 15px;
                color: #2c3e50;
            }

            table th {
                background-color: #006699;
                color: #ffffff;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            table tr:nth-child(even) {
                background: #fdfdfd;
            }

            table tr:hover {
                background: #ebf5ff;
            }

        .gridview button {
            padding: 4px 8px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: #fff;
        }

        .gridview .btn-edit {
            background-color: #28a745;
        }

            .gridview .btn-edit:hover {
                background-color: #218838;
            }

        .gridview .btn-delete {
            background-color: #dc3545;
        }

            .gridview .btn-delete:hover {
                background-color: #c82333;
            }

        .EmptyData {
            text-align: center;
            padding: 20px;
            color: #777;
            font-style: italic;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 18px;
            font-size: 14px;
            color: #006699;
            text-decoration: none;
        }

            a:hover {
                text-decoration: underline;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 class="auto-style1">Quản Lý Phòng Ban</h2>

            <br />

            <asp:SqlDataSource ID="dsNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString2 %>" DeleteCommand="DELETE FROM [NhanVien] WHERE [MaNV] = @MaNV" InsertCommand="INSERT INTO [NhanVien] ([HoNV], [TenNV], [Phai], [NgaySinh], [NoiSinh], [MaPhong]) VALUES (@HoNV, @TenNV, @Phai, @NgaySinh, @NoiSinh, @MaPhong)" SelectCommand="SELECT * FROM [NhanVien] WHERE ([MaPhong] = @MaPhong2)" UpdateCommand="UPDATE [NhanVien] SET [HoNV] = @HoNV, [TenNV] = @TenNV, [Phai] = @Phai, [NgaySinh] = @NgaySinh, [NoiSinh] = @NoiSinh, [MaPhong] = @MaPhong WHERE [MaNV] = @MaNV">
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
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlPhongBan" Name="MaPhong2" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
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

            <asp:SqlDataSource ID="dsPhong" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString2 %>" DeleteCommand="DELETE FROM [Phong] WHERE [MaPhong] = @MaPhong" InsertCommand="INSERT INTO [Phong] ([TenPhong]) VALUES (@TenPhong)" ProviderName="<%$ ConnectionStrings:QLNhanVienConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Phong]" UpdateCommand="UPDATE [Phong] SET [TenPhong] = @TenPhong WHERE [MaPhong] = @MaPhong">
                <DeleteParameters>
                    <asp:Parameter Name="MaPhong" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TenPhong" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenPhong" Type="String" />
                    <asp:Parameter Name="MaPhong" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <hr />
            <asp:Panel ID="Panel1" runat="server" GroupingText="Danh Sách Phòng Ban">
                <div class="filter-center">
                    <asp:DropDownList ID="ddlPhongBan" runat="server"
                        DataSourceID="dsPhong"
                        DataTextField="TenPhong"
                        DataValueField="MaPhong"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

            </asp:Panel>

        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="MaNV" DataSourceID="dsNhanVien" EmptyDataText="Không có dữ liệu" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="MaNV" HeaderText="Mã NV" InsertVisible="False" ReadOnly="True" SortExpression="MaNV" />
                <asp:BoundField DataField="HoNV" HeaderText="Họ NV" SortExpression="HoNV" />
                <asp:BoundField DataField="TenNV" HeaderText="Tên NV" SortExpression="TenNV" />
                <asp:CheckBoxField DataField="Phai" HeaderText="Phái" SortExpression="Phai" />
                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" SortExpression="NgaySinh" />
                <asp:BoundField DataField="NoiSinh" HeaderText="Nơi Sinh" SortExpression="NoiSinh" />
                <asp:BoundField DataField="MaPhong" HeaderText="Mã phòng" SortExpression="MaPhong" />
                <asp:CommandField ShowEditButton="true" ButtonType="Button" EditText="Sửa" />
                <asp:CommandField ShowDeleteButton="true" ButtonType="Button" DeleteText="Xóa" />
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

        <br />
        <a href="Default.aspx">Go Back</a>
    </form>
</body>
</html>
