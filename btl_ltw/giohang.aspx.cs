using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace btl_ltw
{
    public partial class giohang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            acc account = (acc)Session["acc"];
            if (account.Hoten != null)
            {
                Acc.Text = account.Hoten;
                dropdown_content.Visible = true;
            }
            else
            {
                dropdown_content.Visible = false;
            }
            if (Session["giohang"] != null || account.Cart != null)
            {
                DataTable cart = (account.Hoten == null) ? (DataTable)Session["giohang"] : account.Cart;
                string sl = cart.Rows.Count.ToString();
                soluong.Text = sl;
                sl_gio.InnerText = sl;
                string output = "";
                int tongtien = 0;
                foreach (DataRow row in cart.Rows)
                {
                    tongtien += int.Parse(row["soluong"].ToString()) * int.Parse(row["gia"].ToString());
                    output += @"<div class='product'>
                                    <div class='product-image'>
                                        <img src='" + row["anh"].ToString() + @"'>
                                    </div>
                                    <div class='product-details'>
                                        <div class='product-title'>" + row["ten"].ToString() + @"</div>
                                    </div>
                                    <div class='product-price'>" + row["gia"].ToString() + @"đ</div>
                                    <div class='product-quantity'>
                                        <input type = 'text' id='input" + row["id"].ToString() + @"' value='" + row["soluong"].ToString() + @"' min='1'><span id='error" + row["id"].ToString() + @"'></span>
                                    </div>
                                    <div class='product-removal'>
                                        <button type='button' onclick='xoa(" + row["id"].ToString() + @")' title='xoa' style='background: red; color: white;' class='remove-product'><i class='far fa-trash-alt'></i></button>
                                        <button type='button' onclick='capnhap(" + row["id"].ToString() + @")' title='cap nhap' style='background: green; color: white;' class='remove-product'><i class='far fa-check-square'></i></button>
                                      </div>
                                    <div class='product-line-price'>" + (int.Parse(row["soluong"].ToString()) * int.Parse(row["gia"].ToString())) + @"đ</div>
                              </div>";
                }
                tong.InnerText = tongtien.ToString() + 'đ';
                shopping_cart.InnerHtml = output;
            }
        }

        protected void dangxuat_Click(object sender, EventArgs e)
        {
            Session["acc"] = new acc();
            Response.Redirect(Request.RawUrl);
        }
    }
}