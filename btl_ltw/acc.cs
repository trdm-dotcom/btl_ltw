using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace btl_ltw
{
    public class acc
    {
        string hoten;
        string sdt;
        string email;
        string matkhau;
        DataTable cart;
        public string Hoten
        {
            get { return hoten; }
            set { hoten = value; }
        }
        public string Sdt
        {
            get { return sdt; }
            set { sdt = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Matkhau
        {
            get { return matkhau; }
            set { matkhau = value; }
        }
        public DataTable Cart
        {
            get { return cart; }
            set { cart = value; }
        }
    }
}