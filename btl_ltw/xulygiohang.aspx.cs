using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace btl_ltw
{
    public partial class xulygiohang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            acc account = (acc)Session["acc"];
            string image = "";
            string ten = "";
            string gia = "";
            var xuly = Request.QueryString.Get("action").ToString();
            var id = Request.QueryString.Get("idsanpham").ToString();
            DataTable cart = new DataTable();
            if (xuly == "them")
            {
                XDocument doc = XDocument.Load(Server.MapPath("Product.xml"));
                var nodeList = from product in doc.Descendants("Product")
                               where (string)product.Element("id") == id
                               select product;
                foreach (var pro in nodeList)
                {
                    image = pro.Element("image").Value;
                    ten = pro.Element("ten").Value;
                    gia = pro.Element("gia").Value;
                }
                if (Session["giohang"] == null && account.Cart == null)
                {
                    //chưa có giỏ hàng, tạo giỏ hàng 
                    cart.Columns.Add("id");
                    cart.Columns.Add("ten");
                    cart.Columns.Add("gia");
                    cart.Columns.Add("soluong");
                    cart.Columns.Add("anh");
                    cart.Rows.Add(id, ten, gia, 1, image);
                    if (account.Hoten == null) Session["giohang"] = cart;
                    else account.Cart = cart;
                }
                else
                {
                    //Lấy thông tin giỏ hàng từ Session["giohang"]
                    cart = (account.Hoten == null) ? (DataTable)Session["giohang"] : (DataTable)account.Cart;
                    // kiem tra ton tai san pham
                    int check = 0;
                    foreach (DataRow dr in cart.Rows)
                    {
                        if (dr["id"].ToString() == id)
                        {
                            dr["soluong"] = int.Parse(dr["soluong"].ToString()) + 1;
                            check = 1;
                            break;
                        }
                    }
                    if (check == 0)
                    {
                        cart.Rows.Add(id, ten, gia, 1, image);
                    }
                    if (account.Hoten == null) Session["giohang"] = cart;
                    else account.Cart = cart;
                }
                Response.Redirect("giohang.aspx");
                return;
            }
            else if (xuly == "xoa")
            {
                cart = (account.Hoten == null) ? (DataTable)Session["giohang"] : (DataTable)account.Cart;
                foreach (DataRow dr in cart.Rows)
                {
                    if (dr["id"].ToString() == id)
                    {
                        dr.Delete();
                        break;
                    }
                }
                if (account.Hoten == null) Session["giohang"] = cart;
                else account.Cart = cart;
                Response.Redirect("giohang.aspx");
                return;
            }
            else if (xuly == "capnhap")
            {
                int sl = int.Parse(Request.QueryString.Get("sl").ToString());
                cart = (account.Hoten == null) ? (DataTable)Session["giohang"] : (DataTable)account.Cart;
                foreach (DataRow dr in cart.Rows)
                {
                    if (dr["id"].ToString() == id)
                    {
                        dr["soluong"] = sl;
                        break;
                    }
                }
                if (account.Hoten == null) Session["giohang"] = cart;
                else account.Cart = cart;
                Response.Redirect("giohang.aspx");
                return;
            }
        }
    }
}