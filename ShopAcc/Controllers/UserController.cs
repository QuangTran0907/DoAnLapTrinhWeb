using ShopAcc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopAcc.Controllers
{
    public class UserController : Controller
    {
        MyDataDataContext data = new MyDataDataContext();
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(FormCollection collection, User us)
        {
            var tendn = collection["tendn"];
            var matkhau = collection["matkhau"];
            var email = collection["email"];
            var MatKhauXacNhan = collection["MatKhauXacNhan"];
            var sdt = collection["sdt"];
            var tenhienthi = collection["tenhienthi"];
            var anhdaidien = collection["anhdaidien"];
            var trangthai = Convert.ToBoolean(collection["trangthai"]);
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập!";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu!";
            }
            if (String.IsNullOrEmpty(MatKhauXacNhan))
            {
                ViewData["NhapMKXN"] = "Phải nhập mật khẩu xác nhận!";
            }
            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi3"] = "Phải nhập email!";
            }
            if (String.IsNullOrEmpty(sdt))
            {
                ViewData["Loi4"] = "Phải nhập số điện thoại!";
            }
            if (String.IsNullOrEmpty(tenhienthi))
            {
                ViewData["Loi5"] = "Phải nhập tên hiển thị!";
            }
            if (String.IsNullOrEmpty(anhdaidien))
            {
                ViewData["Loi6"] = "Phải nhập ảnh đại diện!";
            }
            else
            {
                if (!matkhau.Equals(MatKhauXacNhan))
                {
                    ViewData["MatKhauGiongNhau"] = "Mật khẩu và mật khẩu xác nhận phải giống nhau";
                }
                else
                {
                    us.tendn = tendn;
                    us.matkhau = matkhau;
                    us.email = email;
                    us.sdt = sdt;
                    us.tenhienthi = tenhienthi;
                    us.anhdaidien = anhdaidien.ToString();
                    us.trangthai = true;

                    data.Users.InsertOnSubmit(us);
                    data.SubmitChanges();
                    return RedirectToAction("DangNhap");
                }
            }

            return this.DangKy();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            var tendn = collection["tendn"];
            var matkhau = collection["matkhau"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập!";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu!";
            }
            User us = data.Users.SingleOrDefault(n => n.tendn == tendn && n.matkhau == matkhau);
            if (us != null)
            {
                ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                Session["TaiKhoan"] = us;
                return RedirectToAction("HomePage", "Account");
            }
            else
            {
                ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }
        [HttpGet]
        public ActionResult DangXuat()
        {
            Session.Clear();
            return RedirectToAction("DangNhap");
        }
    }
}