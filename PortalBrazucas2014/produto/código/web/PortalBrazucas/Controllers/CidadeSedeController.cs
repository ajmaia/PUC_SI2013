using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PortalAdmnistrativo.Models;

namespace PortalBrazucas.Controllers
{ 
    public class CidadeSedeController : Controller
    {
        private Entities db = new Entities();

        public ViewResult Index()
        {
            return View(db.Cidade.OrderByDescending(item => item.CodigoCidade));
        }

        public ActionResult redirecionar(int codCidade)
        {
            return Redirect(String.Format("/CidadeSede/Cidade?CodCidade={0}", codCidade));
        }

        public ActionResult Cidade(int codCidade)
        {
            this.ViewBag.Cidade = db.Cidade.Single(n => n.CodigoCidade == codCidade);
            return View("Cidade");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}