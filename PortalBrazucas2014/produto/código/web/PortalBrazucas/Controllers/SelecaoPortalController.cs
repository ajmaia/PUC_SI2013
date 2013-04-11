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
    public class SelecaoPortalController : Controller
    {
        private Entities db = new Entities();

        public ViewResult Index()
        {
            var selecao = db.Selecao.Include("Grupo").Include("Historia");
            return View(selecao.ToList());
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}