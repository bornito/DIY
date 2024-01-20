using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Apartments.Controllers
{
    public class LoginController : Controller
    {
        private ModelContainer db = new ModelContainer();

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        // POST: Login
        public ActionResult Index(User log)
        {
            var user =
            db.Users.Where(
                x => x.Username == log.Username &&
                x.Password == log.Password).Count();

            if (user > 0)
            {
                FormsAuthentication.SetAuthCookie(log.Username, false);
                return RedirectToAction("Index","Project");
            }
            ModelState.AddModelError("", "Invalid Username/Password");
            return View();
        }

        // GET: Signup
        public ActionResult SignUp()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SignUp(User model)
        {
            using (var context = new ModelContainer())
            {
                context.Users.Add(model);
                context.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }

    }
}