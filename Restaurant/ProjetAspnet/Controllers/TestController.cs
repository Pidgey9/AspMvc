using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjetAspnet.Models;

namespace ProjetAspnet.Controllers
{
    public class TestController : Controller
    {
        // GET: Test
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SelectAllClients()
        {
            return View(new DaoClient().SelectAll());
        }
        public ActionResult SelectAllArticles()
        {
            return View(new DaoArticle().SelectAll());
        }
        public ActionResult SelectAllCommandes()
        {
            return View(new DaoCommande().SelectAll());
        }
    }
}