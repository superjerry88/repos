using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            FilesEntities entities = new FilesEntities();
            return View(entities.tblFiles.Where(p => p.ContentType == "video/mp4").ToList());
        }

        [HttpPost]
        public ActionResult Index(HttpPostedFileBase postedFile)
        {
            byte[] bytes;
            using (BinaryReader br = new BinaryReader(postedFile.InputStream))
            {
                bytes = br.ReadBytes(postedFile.ContentLength);
            }
            FilesEntities entities = new FilesEntities();
            entities.tblFiles.Add(new tblFile
            {
                Name = Path.GetFileName(postedFile.FileName),
                ContentType = postedFile.ContentType,
                Data = bytes
            });
            entities.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public FileResult DownloadFile(int? fileId)
        {
            FilesEntities entities = new FilesEntities();
            tblFile file = entities.tblFiles.ToList().Find(p => p.id == fileId.Value);
            return File(file.Data, file.ContentType, file.Name);
        }
    }
}