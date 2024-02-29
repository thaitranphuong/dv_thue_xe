using DichVuThueXe.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace DichVuThueXe.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        QL_DVThueXeEntities db = new QL_DVThueXeEntities();
        // GET: Admin/Admin
        public ActionResult Index()
        {
            if (Session["MaNV"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        [HttpGet]
        public ActionResult DSNhanVien(string ten, int page = 1, int pagesize = 5)
        {
            if (Session["MaNV"] != null)
            {
                var model = arrangeNhanVien(ten, page, pagesize);
                return View(model);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        public Tuple<PagedList.IPagedList<NhanVien>, string> arrangeNhanVien(string ten, int page = 1, int pagesize = 5)
        {
            var model = searchNhanVien(ten);
            if (ten == null)
            {
                model = from s in db.NhanViens select s;
            }
            model = model.OrderBy(x => x.TenNV).ToPagedList(page, pagesize);
            var tupleModel = new Tuple<PagedList.IPagedList<NhanVien>, string>((IPagedList<NhanVien>)model, ten);
            return tupleModel;
        }

        public IEnumerable<NhanVien> searchNhanVien(string ten)
        {
            var model = from s in db.NhanViens where s.TenNV.Contains(ten) select s;
            return model;
        }


        // thêm nhân viên 
        public ActionResult CreateNhanVien()
        {
            if (Session["MaNV"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }

        }
        [HttpPost, ActionName("CreateNhanVien")]
        [ValidateInput(false)]
        public ActionResult CreateNhanVien(NhanVien nhanvien)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var check = db.NhanViens.FirstOrDefault(s => s.MaNV == nhanvien.MaNV);
                    if (check == null)
                    {
                        db.NhanViens.Add(nhanvien);
                        db.SaveChanges();
                        return RedirectToAction("DSNhanvien");
                    }
                    else
                    {
                        ViewBag.ThongBao = "Mã Nhân Viên đã tồn tại";
                    }
                }

            }
            catch (RetryLimitExceededException)
            {
                ModelState.AddModelError("", "Error Save Data");
            }
            return View();
        }

        // xóa nhân viên 
        [HttpGet]
        public ActionResult DeleteNhanVien(string id)
        {
            NhanVien NV = db.NhanViens.SingleOrDefault(n => n.MaNV == id);
            if (NV == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(NV);
        }
        [HttpPost, ActionName("DeleteNhanVien")]
        public ActionResult DeleteConfirmed(string id)
        {
            NhanVien NV = db.NhanViens.SingleOrDefault(n => n.MaNV == id);
            if (NV == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.NhanViens.Remove(NV);
            db.SaveChanges();
            return RedirectToAction("DSNhanVien");
        }

        // sửa nhân viên 

        [HttpGet]
        public ActionResult EditNhanVien(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien NV = db.NhanViens.SingleOrDefault(s => s.MaNV == id);
            return View(NV);
        }

        [HttpPost, ActionName("EditNhanVien")]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult suanhanvien(string id)
        {
            var nhanvienUpdate = db.NhanViens.Find(id);
            if (TryUpdateModel(nhanvienUpdate, "", new string[] { "MaNV", "TenNV", "MatKhau", "QuyenSD", }))
            {
                try
                {
                    db.Entry(nhanvienUpdate).State = EntityState.Modified;
                    db.SaveChanges();
                }
                catch (RetryLimitExceededException)
                {
                    ModelState.AddModelError("", "Error Save Data");
                }
            }

            return RedirectToAction("DSNhanVien");
        }

        [HttpGet]
        public ActionResult getListService(string ten, string giatri, int page = 1, int pagesize = 5)
        { 
            if (Session["MaNV"] != null)
            {
                var model = arrangeService(ten, giatri, page, pagesize);
                return View(model);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        public Tuple<PagedList.IPagedList<DichVu>, string, string> arrangeService(string ten, string giatri, int page = 1, int pagesize = 5)
        {
            var model = searchService(ten);
            if (giatri == null)
            {
                giatri = "macdinh";
            }
            if (ten == null)
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
        public ActionResult CreateService()
        {
            if (Session["MaNV"] != null)
            {
                ViewBag.MaTinh = new SelectList(db.DiaDiems, "MaTinh", "TenTinh");
                ViewBag.MaXe = new SelectList(db.Xes, "MaXe", "TenXe");
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }

        }

        [HttpPost, ActionName("CreateService")]
        [ValidateInput(false)]
        public ActionResult CreateService(DichVu dv)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.DichVus.Add(dv);
                    db.SaveChanges();
                }
            }
            catch (RetryLimitExceededException)
            {
                ModelState.AddModelError("", "Error Save Data");
            }
            return RedirectToAction("getListService");
        }

        [HttpGet]
        public ActionResult EditListService(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DichVu dv = db.DichVus.SingleOrDefault(s => s.id == id);
            ViewBag.MaTinh = new SelectList(db.DiaDiems, "MaTinh", "TenTinh");
            ViewBag.MaXe = new SelectList(db.Xes, "MaXe", "TenXe");
            return View(dv);
        }
        [HttpPost, ActionName("EditListService")]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult EditListService(int id)
        {
            var ServiceUpdate = db.DichVus.Find(id);
            if (TryUpdateModel(ServiceUpdate, "", new string[] { "Ten", "Gia", "NgayBD", "NgayKT", "MaTinh", "MaXe" }))
            {
                try
                {
                    db.Entry(ServiceUpdate).State = EntityState.Modified;
                    db.SaveChanges();
                }
                catch (RetryLimitExceededException)
                {
                    ModelState.AddModelError("", "Error Save Data");
                }
            }
            return RedirectToAction("getListService");
        }

        [HttpGet]
        public ActionResult DeleteListService(int id)
        {
            DichVu dv = db.DichVus.SingleOrDefault(n => n.id == id);
            if (dv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(dv);
        }
        //Xác nhận xoá
        [HttpPost, ActionName("DeleteListService")]
        public ActionResult DeleteConform(int id)
        {
            DichVu dv = db.DichVus.SingleOrDefault(n => n.id == id);
            if (dv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.DichVus.Remove(dv);
            db.SaveChanges();
            return RedirectToAction("getListService");
        }


        [HttpGet]
        public ActionResult getListCar(string ten, int page = 1, int pagesize = 5)
        {
            if (Session["MaNV"] != null)
            {
                var model = arrangeCar(ten, page, pagesize);
                return View(model);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        public Tuple<PagedList.IPagedList<Xe>, string> arrangeCar(string ten, int page = 1, int pagesize = 5)
        {
            var model = searchCar(ten);
            if (ten == null)
            {
                model = from s in db.Xes select s;
            }
            model = model.OrderBy(x => x.TenXe).ToPagedList(page, pagesize);
            var tupleModel = new Tuple<PagedList.IPagedList<Xe>, string>((IPagedList<Xe>)model, ten);
            return tupleModel;
        }

        public IEnumerable<Xe> searchCar(string ten)
        {
            var model = from s in db.Xes where s.TenXe.Contains(ten) select s;
            return model;
        }

        [HttpGet]
        public ActionResult getListLocation(string ten, int page = 1, int pagesize = 5)
        {
            if (Session["MaNV"] != null)
            {
                var model = arrangeLocation(ten, page, pagesize);
                return View(model);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        public Tuple<PagedList.IPagedList<DiaDiem>, string> arrangeLocation(string ten, int page = 1, int pagesize = 5)
        {
            var model = searchLocation(ten);
            if (ten == null)
            {
                model = from s in db.DiaDiems select s;
            }
            model = model.OrderBy(x => x.TenTinh).ToPagedList(page, pagesize);
            var tupleModel = new Tuple<PagedList.IPagedList<DiaDiem>, string>((IPagedList<DiaDiem>)model, ten);
            return tupleModel;
        }

        public IEnumerable<DiaDiem> searchLocation(string ten)
        {
            var model = from s in db.DiaDiems where s.TenTinh.Contains(ten) select s;
            return model;
        }

        [HttpGet]
        public ActionResult getListCustomer(string ten, int page = 1, int pagesize = 5)
        {
            if (Session["MaNV"] != null)
            {
                var model = arrangeCustomer(ten, page, pagesize);
                return View(model);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        public Tuple<PagedList.IPagedList<KhachHang>, string> arrangeCustomer(string ten, int page = 1, int pagesize = 5)
        {
            var model = searchCustomer(ten);
            if (ten == null)
            {
                model = from s in db.KhachHangs select s;
            }
            model = model.OrderBy(x => x.TenKH).ToPagedList(page, pagesize);
            var tupleModel = new Tuple<PagedList.IPagedList<KhachHang>, string>((IPagedList<KhachHang>)model, ten);
            return tupleModel;
        }

        public IEnumerable<KhachHang> searchCustomer(string ten)
        {
            var model = from s in db.KhachHangs where s.TenKH.Contains(ten) select s;
            return model;
        }

        public ActionResult DonHangDaDuyet()
        {
            if (Session["MaNV"] != null)
            {
                var model = db.DonDats.Where(s => s.TrangThaiThanhToan == true);
                return View(model);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        [HttpGet]
        public ActionResult DonHangDaDuyet(string id, int page = 1, int pagesize = 3)
        {
            var model = arrangeDonHangDaDuyet(id, page, pagesize);
            return View(model);
        }

        public Tuple<PagedList.IPagedList<DonDat>, string> arrangeDonHangDaDuyet(string id, int page = 1, int pagesize = 3)
        {
            var model = searchDonHangDaDuyet(id);
            if (id == "" || id == null)
            {
                model = from s in db.DonDats where s.TrangThaiThanhToan == true select s;
            }
            model = model.OrderBy(x => x.id).ToPagedList(page, pagesize);
            var tupleModel = new Tuple<PagedList.IPagedList<DonDat>, string>((IPagedList<DonDat>)model, id);
            return tupleModel;
        }

        public IEnumerable<DonDat> searchDonHangDaDuyet(string id)
        {
            var model = from s in db.DonDats
                        where s.id.ToString().Equals(id) && s.TrangThaiThanhToan == true
                        select s;
            return model;
        }

        [HttpGet]
        public ActionResult DonHangChuaDuyet(string id, int page = 1, int pagesize = 3)
        {
            if (Session["MaNV"] != null)
            {
                var model = arrangeDonHangChuaDuyet(id, page, pagesize);
                return View(model);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        public Tuple<PagedList.IPagedList<DonDat>, string> arrangeDonHangChuaDuyet(string id, int page = 1, int pagesize = 3)
        {
            var model = searchDonHangChuaDuyet(id);
            if (id == "" || id == null)
            {
                model = from s in db.DonDats where s.TrangThaiThanhToan == false select s;
            }
            model = model.OrderBy(x => x.id).ToPagedList(page, pagesize);
            var tupleModel = new Tuple<PagedList.IPagedList<DonDat>, string>((IPagedList<DonDat>)model, id);
            return tupleModel;
        }

        public IEnumerable<DonDat> searchDonHangChuaDuyet(string id)
        {
            var model = from s in db.DonDats
                        where s.id.ToString().Equals(id) && s.TrangThaiThanhToan == false
                        select s;
            return model;
        }

        public void duyet(int id)
        {
            DonDat dondat = db.DonDats.SingleOrDefault(n => n.id == id);
            dondat.TrangThaiThanhToan = true;
            db.SaveChanges();
        }

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string manv, string matkhau)
        {
            if (ModelState.IsValid)
            {
                var data = db.NhanViens.Where(s => s.MaNV.Equals(manv) && s.MatKhau.Equals(matkhau)).ToList();
                if (data.Count() > 0)
                {
                    Session["TenNV"] = data.FirstOrDefault().TenNV;
                    Session["MaNV"] = data.FirstOrDefault().MaNV;
                    Session["QuyenSD"] = data.FirstOrDefault().QuyenSD;
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    ViewBag.ThongBao = "Đăng nhập không thành công!";
                }
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login", "Admin");
        }
    }
}