using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_ltw
{
    public partial class dangky : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            acc account = (acc)Session["acc"];
            if (Session["giohang"] != null || account.Cart != null)
            {
                DataTable cart = (account.Hoten == null) ? (DataTable)Session["giohang"] : account.Cart;
                string sl = cart.Rows.Count.ToString();
                soluong.Text = sl;
            }
            if (account.Hoten != null)
            {
                Response.Redirect("trangchu.aspx");
            }
        }

        protected void dangky_btn_Click(object sender, EventArgs e)
        {
            List<acc> listAcc = (List<acc>)Application["listAcc"];
            acc acc = new acc();
            int check = 0;

            foreach (acc i in listAcc)
            {
                if (i.Email == Request.Form.Get("email"))
                {
                    check = 1;
                    break;
                }
            }
            if (check == 0)
            {
                acc.Hoten = Request.Form.Get("hoten");
                acc.Sdt = Request.Form.Get("sdt");
                acc.Email = Request.Form.Get("email");
                acc.Matkhau = Request.Form.Get("matkhau");
                listAcc.Add(acc);
                Application["listAcc"] = listAcc;
                acc.Cart = (DataTable)Session["giohang"];
                Session.Add("acc", acc);
                Response.Redirect("trangchu.aspx");
            }
            else
            {
                hoten.Value = Request.Form.Get("hoten");
                sdt.Value = Request.Form.Get("sdt");
                email.Value = Request.Form.Get("email");
                errorDangKy.Text = "Email đã tồn tại";
            }
        }
    }
}