using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_ltw
{
    public partial class dathang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            acc account = (acc)Session["acc"];
            DataTable cart;
            if (Session["giohang"] != null || account.Cart != null)
            {
                cart = (account.Hoten == null) ? (DataTable)Session["giohang"] : account.Cart;
                string sl = cart.Rows.Count.ToString();
                soluongArea.Text = sl;
            }
            else
            {
                Response.Redirect("trangsanpham.aspx");
            }
            if (account.Hoten != null)
            {
                Acc.Text = account.Hoten;
                dropdown_content.Visible = true;
            }
            else
            {
                Response.Redirect("trangsanpham.aspx");
                dropdown_content.Visible = false;
            }
            cart = account.Cart;
            int tongtien = 0;
            string output = "";
            foreach (DataRow row in cart.Rows)
            {
                tongtien += int.Parse(row["soluong"].ToString()) * int.Parse(row["gia"].ToString());
                output += @"<div class='col l-7'>" + row["ten"].ToString() + @"</div>
                            <div class='col l-2'>" + row["soluong"].ToString() + @"</div>
                            <div class='col l-3 text-right'>" + row["gia"].ToString() + @"đ</div>";
            }
            danhsachsp.InnerHtml = output;
            donhang.InnerText = tongtien.ToString() + 'đ';
            //hoten.Value = account.Hoten;
            //email.Value = account.Email;
            //sdt.Value = account.Sdt;
        }

        protected void dangxuat_Click(object sender, EventArgs e)
        {
            Session["acc"] = new acc();
            Response.Redirect(Request.RawUrl);
        }
    }
}