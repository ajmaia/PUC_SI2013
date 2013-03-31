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
    public class NoticiaComentarioController : Controller
    {
        private Entities db = new Entities();

        public ViewResult Index()
        {
            return View();
        }

        public ViewResult Noticia(int codNoticia)
        {
            this.ViewBag.Noticia = db.Noticia.Single(n => n.CodigoNoticia == codNoticia);
            this.ViewBag.Comentarios = db.Comentario.Where(c => c.CodigoNoticia == codNoticia).AsEnumerable<Comentario>();

            return View();
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}