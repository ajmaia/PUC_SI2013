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
            Comentario novoComentario = new Comentario();
            novoComentario.CodigoNoticia = codNoticia;
            novoComentario.LoginCriacao = "ajmaia";
            novoComentario.NomeLoginCriacao = "Alexandre";

            this.ViewBag.Noticia = db.Noticia.Single(n => n.CodigoNoticia == codNoticia);
            this.ViewBag.Comentarios = db.Comentario.Where(c => c.CodigoNoticia == codNoticia && c.StatusAprovacao == "1").AsEnumerable<Comentario>();
            this.ViewBag.NovoComentario = novoComentario;
            return View();
        }

        [HttpPost]
        public ActionResult NovoComentario(Comentario comentario)
        {
            comentario.DataCriacaoString = DateTime.Now.ToShortTimeString();

            if (ModelState.IsValid)
            {
                db.Comentario.AddObject(comentario);
                db.SaveChanges();
                return RedirectToAction("Noticia", comentario.CodigoNoticia);
            }

            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}