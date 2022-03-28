using System;
using ShopAcc.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace ShopAcc.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        MyDataDataContext data = new MyDataDataContext();
        
        public ActionResult Index()
        {
            var all_account = from tt in data.Accounts select tt;
            return View(all_account);
        }
        public ActionResult Detail(int id)
        {
            var D_Acc = data.Accounts.Where(m => m.id == id).First(); return View(D_Acc);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(FormCollection collection, Account s)
        {
            var E_idGame  = collection["idGame"];
            var E_taikhoan = collection["taikhoan"];
            var E_matkhau = collection["matkhau"];
            var E_trangthai = Convert.ToBoolean(collection["trangthai"]);
            var E_giaban = Convert.ToDecimal(collection["giaban"]);
            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["NgayCapNhat"]);
            var E_ngaycapnhat = DateTime.Parse(ngaygiao);
            var E_rank = collection["rank"];
            var E_tuong = Convert.ToInt32(collection["tuong"]);
            var E_trangphuc = Convert.ToInt32(collection["trangphuc"]);
            var E_hinh = collection["hinh"];



            if (string.IsNullOrEmpty(E_idGame))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                s.taikhoan = E_taikhoan.ToString();
                s.matkhau = E_matkhau.ToString();
                s.giaban = E_giaban;
                s.ngaycapnhat = Convert.ToDateTime(E_ngaycapnhat);
                s.trangthai = true;
                s.rank = E_rank.ToString();
                s.trangphuc = E_trangphuc;
                s.tuong = E_tuong;
                s.hinh = E_hinh.ToString();

                data.Accounts.InsertOnSubmit(s);
                data.SubmitChanges();
                return RedirectToAction("Index");
            }
            return this.Create();
        }
        public ActionResult Edit(int id)
        {
            var E_Acc = data.Accounts.First(m => m.id == id); return View(E_Acc);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var s = data.Accounts.First(m => m.id == id);

            var E_idGame = collection["idGame"];
            var E_taikhoan = collection["taikhoan"];
            var E_matkhau = collection["matkhau"];
            var E_trangthai = Convert.ToBoolean(collection["trangthai"]);
            var E_giaban = Convert.ToDecimal(collection["giaban"]);
            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["NgayCapNhat"]);
            var E_ngaycapnhat = DateTime.Parse(ngaygiao);
            var E_rank = collection["rank"];
            var E_tuong = Convert.ToInt32(collection["tuong"]);
            var E_trangphuc = Convert.ToInt32(collection["trangphuc"]);
            var E_hinh = collection["hinh"];
            if (string.IsNullOrEmpty(E_idGame))
            {
                ViewData["Error"] = "Don't empty!";
            }
            else
            {
                s.taikhoan = E_taikhoan.ToString();
                s.matkhau = E_matkhau.ToString();
                s.giaban = E_giaban;
                s.ngaycapnhat = Convert.ToDateTime(E_ngaycapnhat);
                s.trangthai = true;
                s.rank = E_rank.ToString();
                s.trangphuc = E_trangphuc;
                s.tuong = E_tuong;
                s.hinh = E_hinh.ToString();
                UpdateModel(s);
                data.SubmitChanges();
                return RedirectToAction("Index");
            }
            return this.Edit(id);
        }
        public ActionResult HomePage(int? page)
        {
            if(Session["TaiKhoan"]==null)
            {
                return View("HomePage");
            }    
            ViewBag.id = "Trần Hữu Quang";
            int pageSize = 8;
            int pageNum = (page ?? 1);

            var all_account = from tt in data.Accounts select tt;
            return View(all_account.ToPagedList(pageNum,pageSize));
        }
        public ActionResult ChiTiet()
        {

            var all_account = data.Accounts.Where(m => m.id == 1).First();
            return View(all_account);

        }



    }
}