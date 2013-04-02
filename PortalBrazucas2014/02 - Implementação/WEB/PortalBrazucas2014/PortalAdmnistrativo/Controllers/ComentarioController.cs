using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PortalAdmnistrativo.Models;

namespace PortalAdmnistrativo.Controllers
{ 
    public class ComentarioController : Controller
    {
        private Entities db = new Entities();

        public ActionResult GerenciarComentarios(int id)
        {
            Comentario parametros = new Comentario();
            parametros.CodigoNoticia = id;

            this.ViewBag.Parametros = parametros;
            this.ViewBag.Resultado = parametros.buscar();

            return View("_painelComentariosNoticia", this.ViewBag.Resultado);
        }

        public ActionResult AprovarComentario(int id)
        {
            Comentario comentario = db.Comentario.Single(c => c.CodigoComentario == id);
            comentario.StatusAprovacao = "1";
            comentario.UsuarioAprovacao = "ajmaia";
            db.ObjectStateManager.ChangeObjectState(comentario, EntityState.Modified);
            db.SaveChanges();

            Comentario parametros = new Comentario();
            parametros.CodigoNoticia = comentario.CodigoNoticia;

            this.ViewBag.Parametros = parametros;
            this.ViewBag.Resultado = parametros.buscar();

            return PartialView("_painelComentariosNoticia", this.ViewBag.Resultado);
        }

        public ActionResult ReprovarComentario(int id)
        {
            Comentario comentario = db.Comentario.Single(c => c.CodigoComentario == id);
            comentario.StatusAprovacao = "0";
            comentario.UsuarioAprovacao = "ajmaia";
            db.ObjectStateManager.ChangeObjectState(comentario, EntityState.Modified);
            db.SaveChanges();

            return View("_painelComentariosNoticia", this.ViewBag.Resultado);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}