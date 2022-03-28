using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopAcc.Models;

namespace ShopAcc.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        MyDataDataContext data = new MyDataDataContext();
        public List<GioHang> Laygiohang()
        {

            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<GioHang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }
        public ActionResult ThemGioHang(int id, string strURL)
        {
            User user = (User)Session["TaiKhoan"];
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.Find(n => n.idacc == id);
            var truycap = data.TruyCaps.Where(p => p.iduser == user.iduser);

            if (sanpham == null && truycap==null)
            {
               
                sanpham = new GioHang(id);
                lstGiohang.Add(sanpham);
                TruyCap truyCap = new TruyCap();
                truyCap.id = id;
                truyCap.iduser = user.iduser;
                truyCap.trangthai = true;
                data.TruyCaps.InsertOnSubmit(truyCap);
                data.SubmitChanges();
                return Redirect(strURL);
            }
            else
            {
                
                return Redirect(strURL);
            }
        }
        public int TongSoLuong()
        {
            int tsl = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tsl = lstGiohang.Count;
            }
            return tsl;
        }
        public decimal TongTien()
        {
            decimal tt = 0;
            List<GioHang> lstGiohang = Session["GioHang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                tt = lstGiohang.Sum(n => n.giaban);
            }
            return tt;
        }
        public ActionResult GioHang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            User user = (User)Session["TaiKhoan"];
            var truycap = data.TruyCaps.Where(p => p.iduser == user.iduser);
            foreach (var item in truycap)
            {
                GioHang sanpham = new GioHang(item.id);
                lstGiohang.Add(sanpham);
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }
        public ActionResult GioHangPartial()
        {

            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return PartialView();
        }
        public ActionResult XoaGioHang(int id)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.SingleOrDefault(n => n.idacc == id);
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.idacc == id);
                return RedirectToAction("Cart");
            }
            return RedirectToAction("Cart");
        }
        public ActionResult CapnhatGioHang(int id, FormCollection collection)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.SingleOrDefault(n => n.idacc == id);
           
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaTatCaGioHang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("GioHang");
        }
        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "User");
            }
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("HomePage", "Account");

            }
            List<GioHang> lstGioHang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGioHang);
        }
       
        public ActionResult Index()
        {
            return View();
        }

    }
}