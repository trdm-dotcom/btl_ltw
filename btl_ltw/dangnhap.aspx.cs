using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_ltw
{
    public partial class dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            acc account = (acc)Session["acc"];
            if (Session["giohang"] != null || account.Cart != null)
            {
                DataTable cart = (account.Hoten == null) ? (DataTable)Session["giohang"] : account.Cart;
                string sl = cart.Rows.Count.ToString();
                soluongArea.Text = sl;
            }
            if (account.Hoten != null)
            {
                Response.Redirect("trangchu.aspx");
            }
            if ((int)Session["solan"] >= 5)
            {
                dangnhap_btn.Visible = false;
            }
            else
            {
                dangnhap_btn.Visible = true;
            }
        }

        protected void dangnhap_btn_Click(object sender, EventArgs e)
        {
            List<acc> listAcc = (List<acc>)Application["listAcc"];
            acc acc = new acc();
            var check = false;
            foreach (acc i in listAcc)
            {
                if (i.Email == Request.Form.Get("email") && i.Matkhau == Request.Form.Get("matkhau"))
                {
                    acc.Hoten = i.Hoten;
                    acc.Sdt = i.Sdt;
                    acc.Email = i.Email;
                    acc.Cart = (DataTable)Session["giohang"];
                    Session.Add("acc", acc);
                    Session.Remove("giohang");
                    check = true;
                    break;
                }
            }

            if (!check)
            {
                int solan = (int)Session["solan"];
                solan++;
                Session["solan"] = solan;
                errorDangNhap.Text = "Email hoặc mật khẩu không đúng";
            }
            else
            {
                Response.Redirect("trangchu.aspx");
            }
        }
    }
}