using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab__CSDL
{
    public partial class qlPhongBan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                dsNhanVien.InsertParameters["HoNV"].DefaultValue = txtHoNV.Text;
                dsNhanVien.InsertParameters["TenNV"].DefaultValue = txtTenNV.Text;
                dsNhanVien.InsertParameters["Phai"].DefaultValue = ddlPhai.SelectedValue;
                dsNhanVien.InsertParameters["NgaySinh"].DefaultValue = txtNgaySinh.Text;
                dsNhanVien.InsertParameters["NoiSinh"].DefaultValue = txtNoiSinh.Text;
                dsNhanVien.InsertParameters["MaPhong"].DefaultValue = ddlMaPhongMoi.SelectedValue;

                int result = dsNhanVien.Insert();

                if (result > 0)
                {
                    lblMessage.Text = "Thêm thành công!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    txtHoNV.Text = "";
                    txtTenNV.Text = "";
                    txtNgaySinh.Text = "";
                    txtNoiSinh.Text = "";

                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Lỗi: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}