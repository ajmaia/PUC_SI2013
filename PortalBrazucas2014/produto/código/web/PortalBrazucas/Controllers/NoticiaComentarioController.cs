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
            return View(db.Noticia.OrderByDescending(item => item.DataPublicacao));
        }

        public ActionResult redirecionar(int codNoticia)
        {
            return Redirect(String.Format("/NoticiaComentario/Noticia?CodNoticia={0}", codNoticia));
        }

        public ActionResult Noticia(int codNoticia)
        {
            Comentario novoComentario = new Comentario();
            novoComentario.CodigoNoticia = codNoticia;
            novoComentario.LoginCriacao = "ajmaia";
            novoComentario.NomeLoginCriacao = "Alexandre";
            novoComentario.DataCriacaoString = DateTime.Now.ToShortTimeString();

            this.ViewBag.Noticia = db.Noticia.Single(n => n.CodigoNoticia == codNoticia);
            this.ViewBag.Comentarios = db.Comentario.Where(c => c.CodigoNoticia == codNoticia && c.StatusAprovacao == "1").AsEnumerable<Comentario>();
            this.ViewBag.NovoComentario = novoComentario;
            return View("Noticia");
        }

        [HttpPost]
        public ActionResult NovoComentario(Comentario comentario)
        {
            comentario.DataCriacaoString = DateTime.Now.ToShortTimeString();

            if (ModelState.IsValid)
            {
                db.Comentario.AddObject(comentario);
                db.SaveChanges();

                Comentario novoComentario = new Comentario();
                novoComentario.CodigoNoticia = comentario.CodigoNoticia;
                novoComentario.LoginCriacao = "ajmaia";
                novoComentario.NomeLoginCriacao = "Alexandre";
                novoComentario.DataCriacaoString = DateTime.Now.ToShortTimeString();

                this.ViewBag.Noticia = db.Noticia.Single(n => n.CodigoNoticia == comentario.CodigoNoticia);
                this.ViewBag.Comentarios = db.Comentario.Where(c => c.CodigoNoticia == comentario.CodigoNoticia && c.StatusAprovacao == "1").AsEnumerable<Comentario>();

                return View("Noticia", comentario.CodigoNoticia);
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