using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Apartments.Controllers
{
    public class FileController : Controller
    {
        private readonly ModelContainer db = new ModelContainer();

        ~FileController()
        {
            db.Dispose();
        }

        // GET: File
        public ActionResult Index(int id)
        {
            var uploadedFile = db.UploadedProjects.Find(id);

            return File(uploadedFile.Content, uploadedFile.ContentType);
        }

        // Delete: File
        public ActionResult Delete(int id)
        {
            var uploadedFile = db.UploadedProjects.Find(id);
            db.UploadedProjects.Remove(uploadedFile);
            db.SaveChanges();

            //return File(uploadedFile.Content, uploadedFile.ContentType);
            return Redirect(Request.UrlReferrer.AbsolutePath);
        }
    }
}