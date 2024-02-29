using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.SqlServer;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DichVuThueXe.Models;
using PagedList;

namespace DichVuThueXe.Controllers
{
    public class HomeController : Controller
    {
        QL_DVThueXeEntities db = new QL_DVThueXeEntities();
        public ActionResult Index(int page=1, int pagesize=4)
        {
            var model = db.DichVus.OrderByDescending(x => x.Ten).ToPagedList(page, pagesize);

            return View(model);
        }

        [HttpGet]
        public ActionResult ListService(string ten, string giatri, int page = 1, int pagesize = 6)
        {
            var model = arrangeService(ten, giatri, page, pagesize);
            return View(model);
        }

        public Tuple<PagedList.IPagedList<DichVu>, string, string> arrangeService(string ten, string giatri, int page = 1, int pagesize = 6)
        {
            var model = searchService(ten);
            if (giatri == null)
            {
                giatri = "macdinh";
            }
            if(ten == null)
            {
                model = from s in db.DichVus select s;
            }
            if (giatri.Equals("macdinh"))
            {
                model = model.OrderByDescending(x => x.Ten).ToPagedList(page, pagesize);
            }
            else if (giatri.Equals("tangdan"))
            {
                model = model.OrderBy(x => x.Gia).ToPagedList(page, pagesize);
            }
            else if (giatri.Equals("giamdan"))
            {
                model = model.OrderByDescending(x => x.Gia).ToPagedList(page, pagesize);
            }
            else if (giatri.Equals("gannhat"))
            {
                model = model.OrderBy(x => x.DiaDiem.KhoangCach).ToPagedList(page, pagesize);
            }
            else if (giatri.Equals("batdau"))
            {
                model = model.OrderBy(x => x.NgayBD).ToPagedList(page, pagesize);
            }
            var tupleModel = new Tuple<PagedList.IPagedList<DichVu>, string, string>((IPagedList<DichVu>)model, ten, giatri);
            return tupleModel;
        }

        public IEnumerable<DichVu> searchService(string ten)
        {
            var model = from s in db.DichVus where s.Ten.Contains(ten) select s;
            return model;
        }


        public ActionResult Detail(int? id)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            var viewModel = db.DichVus.SingleOrDefault(s => s.id == id);
            if (viewModel == null)
            {
                return HttpNotFound();
            }
            return View(viewModel);
        }

        //Tiến trình thêm sản phẩm vào giỏ hàng


        [HttpPost]
        public JsonResult AddToCart(int id)
        {
            //Process Add To Cart
            List<CartItem> listCartItem;
            if (Session["ShoppingCart"] == null)
            {
                //Create New Shopping Cart Session 
                listCartItem = new List<CartItem>();
                listCartItem.Add(new CartItem { Quantity = 1, productOrder = db.DichVus.Find(id) });
                Session["ShoppingCart"] = listCartItem;
            }
            else
            {
                bool flag = false;
                listCartItem = (List<CartItem>)Session["ShoppingCart"];
                foreach (CartItem item in listCartItem)
                {
                    if (item.productOrder.id == id)
                    {
                        item.Quantity++; flag = true;
                        break;
                    }
                }

                if (!flag)
                    listCartItem.Add(new CartItem { Quantity = 1, productOrder = db.DichVus.Find(id) });

                Session["ShoppingCart"] = listCartItem;
            }
            //Count item in shopping cart 
            int cartcount = 0;
            double total = 0;
            int quantity = 0;
            double cost = 0;
            List<CartItem> ls = (List<CartItem>)Session["ShoppingCart"];
            foreach (CartItem item in ls)
            {
                cartcount += item.Quantity;
                total += item.Quantity*(double)item.productOrder.Gia;
            }
            foreach (CartItem item in ls)
            {
                if (item.productOrder.id == id)
                {
                    quantity = item.Quantity;
                    cost = (double)item.productOrder.Gia;
                    break;
                }
            }
            return Json(new { ItemAmount = cartcount,  Total = total, ServiceCount =  quantity, Cost = cost});
        }

        public JsonResult ReduceFromCart(int id)
        {
            //Process Add To Cart
            List<CartItem> listCartItem;
            if (Session["ShoppingCart"] != null)
            {
                listCartItem = (List<CartItem>)Session["ShoppingCart"];
                foreach (CartItem item in listCartItem)
                {
                    if (item.productOrder.id == id && item.Quantity > 1)
                    {
                        item.Quantity--;
                        break;
                    }
                }
            }
            //Count item in shopping cart 
            double total = 0;
            int quantity = 0;
            double cost = 0;
            List<CartItem> ls = (List<CartItem>)Session["ShoppingCart"];
            foreach (CartItem item in ls)
            {
                total += item.Quantity* (double)item.productOrder.Gia;
            }
            foreach (CartItem item in ls)
            {
                if (item.productOrder.id == id)
                {
                    quantity = item.Quantity;

                    cost = (double)item.productOrder.Gia;
                    break;
                }
            }
            return Json(new { Total = total, ServiceCount = quantity,  Cost = cost });
        }

        [HttpPost]
        public JsonResult RemoveFromCart(int id)
        {
            List<CartItem> listCartItem = (List<CartItem>)Session["ShoppingCart"];
            var itemToRemove = listCartItem.SingleOrDefault(r => r.productOrder.id == id);
            if (itemToRemove != null)
            {
                listCartItem.Remove(itemToRemove);
            }
            //Count item in shopping cart
            int cartcount = 0;
            double total = 0;
            int quantity = 0;
            double cost = 0;
            List<CartItem> ls = (List<CartItem>)Session["ShoppingCart"];
            foreach (CartItem item in ls)
            {
                cartcount += item.Quantity;
                total += item.Quantity * (double)item.productOrder.Gia;
            }
            return Json(new { ItemAmount = cartcount, Total = total, ServiceCount = quantity, Cost = cost });
        }

        public ActionResult ShoppingCart()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string taikhoan, string matkhau)
        {
            if (ModelState.IsValid)
            {
                var data = db.KhachHangs.Where(s => s.TaiKhoan.Equals(taikhoan) && s.MatKhau.Equals(matkhau)).ToList();
                if (data.Count() > 0)
                {
                    Session["TenKH"] = data.FirstOrDefault().TenKH;
                    Session["MaKH"] = data.FirstOrDefault().MaKH;
                    Session["TaiKhoan"] = data.FirstOrDefault().TaiKhoan;
                    Session["CMND"] = data.FirstOrDefault().CMND;
                    Session["DiaChi"] = data.FirstOrDefault().DiaChi;
                    Session["SDT"] = data.FirstOrDefault().SDT;
                    Session["MaKH"] = data.FirstOrDefault().MaKH;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.ThongBao = "Đăng nhập không thành công";
                }
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }
        // GET: Register
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(KhachHang user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (db.KhachHangs.FirstOrDefault(s => s.TaiKhoan == user.TaiKhoan) != null)
                    {
                        ViewBag.ThongBao = "Tài khoản đã tồn tại!";
                    }
                    else
                    {
                        db.KhachHangs.Add(user);
                        db.SaveChanges();
                        ViewBag.ThongBao = "Đăng ký thành công";
                    }
                }
            }
            catch (RetryLimitExceededException)
            {
                ModelState.AddModelError("", "Error Save Data");
            }
            return View();
        }
        public ActionResult DanhGia()
        {
            return View();
        }

        public ActionResult ThongTinDonDat()
        {
            return View();
        }
        public ActionResult PayNow()
        {
            DonDat dd = new DonDat();
            // Lấy mã khách hàng từ Session
            foreach (var item in (List<CartItem>)Session["ShoppingCart"])
            {
                dd.TongTien = (double)item.productOrder.Gia * item.Quantity;
                dd.MaXe = item.productOrder.MaXe;
                dd.NgayDat = DateTime.Now;
                dd.TrangThaiThanhToan = true;
                dd.MaNV = "NV01";
                dd.MaKH = (int)Session["MaKH"];

                db.DonDats.Add(dd);
                db.SaveChanges();
            }           
            var lastid = db.DonDats.OrderByDescending(p => p.id).FirstOrDefault();
            ViewBag.Lastid = lastid;
            return View();
        }
        public ActionResult PayLast()
        {
            DonDat dd = new DonDat();
            // Lấy mã khách hàng từ Session
            foreach (var item in (List<CartItem>)Session["ShoppingCart"])
            {
                dd.TongTien = (double)item.productOrder.Gia * item.Quantity;
                dd.MaXe = item.productOrder.MaXe;
                dd.NgayDat = DateTime.Now;
                dd.TrangThaiThanhToan = false;
                dd.MaNV = "NV01";
                dd.MaKH = (int)Session["MaKH"];

                db.DonDats.Add(dd);
                db.SaveChanges();
            }        
            var lastid = db.DonDats.OrderByDescending(p => p.id).FirstOrDefault();
            ViewBag.Lastid = lastid;

            return View();
        }
        public ActionResult Introduce()
        {
            return View();
        }

        public ActionResult LichSuDatHang()
        {         
            if (Session["MaKH"] != null)
            {
                int user = (int)Session["MaKH"];
                var model = db.DonDats.Where(s => s.MaKH == user);
                return View(model);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        [HttpPost]
        public void clearCart()
        {
            List<CartItem> listCartItem = (List<CartItem>)Session["ShoppingCart"];
            listCartItem.Clear();
        }

    }

}