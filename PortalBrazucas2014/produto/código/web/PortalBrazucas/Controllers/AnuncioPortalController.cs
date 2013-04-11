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
    public class AnuncioPortalController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /AnuncioPortal/

        public ViewResult Index()
        {
            var anuncio = db.Anuncio.Include("Categoria").Include("Usuario");
            return View(anuncio.ToList());
        }

        //
        // GET: /AnuncioPortal/Details/5

        public ViewResult Details(int id)
        {
            Anuncio anuncio = db.Anuncio.Single(a => a.CodigoAnuncio == id);
            return View(anuncio);
        }

        //
        // GET: /AnuncioPortal/Create

        public ActionResult Create()
        {
            ViewBag.CodigoCategoria = new SelectList(db.Categoria, "CodigoCategoria", "DescricaoCategoria");
            ViewBag.LoginCriacao = new SelectList(db.Usuario, "LoginUsuario", "NomeRazaoSocial");
            return View();
        } 

        //
        // POST: /AnuncioPortal/Create

        [HttpPost]
        public ActionResult Create(Anuncio anuncio)
        {
            if (ModelState.IsValid)
            {
                db.Anuncio.AddObject(anuncio);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.CodigoCategoria = new SelectList(db.Categoria, "CodigoCategoria", "DescricaoCategoria", anuncio.CodigoCategoria);
            ViewBag.LoginCriacao = new SelectList(db.Usuario, "LoginUsuario", "NomeRazaoSocial", anuncio.LoginCriacao);
            return View(anuncio);
        }
        
        //
        // GET: /AnuncioPortal/Edit/5
 
        public ActionResult Edit(int id)
        {
            Anuncio anuncio = db.Anuncio.Single(a => a.CodigoAnuncio == id);
            ViewBag.CodigoCategoria = new SelectList(db.Categoria, "CodigoCategoria", "DescricaoCategoria", anuncio.CodigoCategoria);
            ViewBag.LoginCriacao = new SelectList(db.Usuario, "LoginUsuario", "NomeRazaoSocial", anuncio.LoginCriacao);
            return View(anuncio);
        }

        //
        // POST: /AnuncioPortal/Edit/5

        [HttpPost]
        public ActionResult Edit(Anuncio anuncio)
        {
            if (ModelState.IsValid)
            {
                db.Anuncio.Attach(anuncio);
                db.ObjectStateManager.ChangeObjectState(anuncio, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CodigoCategoria = new SelectList(db.Categoria, "CodigoCategoria", "DescricaoCategoria", anuncio.CodigoCategoria);
            ViewBag.LoginCriacao = new SelectList(db.Usuario, "LoginUsuario", "NomeRazaoSocial", anuncio.LoginCriacao);
            return View(anuncio);
        }

        //
        // GET: /AnuncioPortal/Delete/5
 
        public ActionResult Delete(int id)
        {
            Anuncio anuncio = db.Anuncio.Single(a => a.CodigoAnuncio == id);
            return View(anuncio);
        }

        //
        // POST: /AnuncioPortal/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Anuncio anuncio = db.Anuncio.Single(a => a.CodigoAnuncio == id);
            db.Anuncio.DeleteObject(anuncio);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}