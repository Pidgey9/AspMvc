using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjetAspnet.Models;

namespace ProjetAspnet.Controllers
{
    public class ClientController : Controller
    {
        // GET: Client
        public ActionResult Accueil()
        {
            return View();
        }

        public ActionResult NotreCarte()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(int? login, string password)
        {
            try
            {
                int id = (int)login;
                Client c = new DaoClient().SelectById(id);
                if (password == c.Password)
                {
                    Session["client"] = c.Id;
                    return View(c);
                }
                else
                {
                    return View("ErrorLog");
                }

            }
            catch
            {
                return View("ErrorLog");
            }


        }
        [HttpGet]
        public ActionResult Inscription()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Inscription(Client c)
        {
            try
            {
                new DaoClient().Insert(c);
                Session["client"] = c.Id;
                return View();
            }
            catch
            {
                return View("ErrorLog");
            }
        }
        public ActionResult Commander()
        {
            List<Article> liste = new List<Article>();
            liste = new DaoArticle().SelectAll();
            return View(liste);
        }
        public ActionResult Recap(double? prixTotal)
        {
            if (prixTotal != null)
                return View((double)prixTotal);
            else
                return RedirectToAction("Commander");
        }
        public ActionResult Merci(Commande c)
        {
            if(c.IdClient != 0)
            {
                new DaoCommande().Insert(c);
                return View(c);
            }
            else
                return RedirectToAction("Inscription");
        }
    }
}