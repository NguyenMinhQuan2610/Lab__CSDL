<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab__CSDL.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 class="auto-style1">DEMO QUẢN LÝ NHÂN VIÊN</h2>
            <hr />

            <br />
            <div class="auto-style2" style="width:100px">
                <asp:Panel ID="Panel1" runat="server" Width="240px" GroupingText="Chức năng">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/qlNhanVien.aspx">Quản lý nhân viên</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/qlPhongBan.aspx">Quản lý phòng ban</asp:HyperLink>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
