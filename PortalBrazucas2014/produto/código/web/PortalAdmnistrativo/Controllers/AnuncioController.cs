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
    public class AnuncioController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /Anuncio/

        public ViewResult Index()
        {
            var anuncio = db.Anuncio.Include("Categoria").Include("Usuario");
            return View(anuncio.ToList());
        }

        //
        // GET: /Anuncio/Details/5

        public ViewResult Details(int id)
        {
            Anuncio anuncio = db.Anuncio.Single(a => a.CodigoAnuncio == id);
            return View(anuncio);
        }

        //
        // GET: /Anuncio/Create

        public ActionResult Create()
        {
            ViewBag.CodigoCategoria = new SelectList(db.Categoria, "CodigoCategoria", "DescricaoCategoria");
            ViewBag.LoginCriacao = new SelectList(db.Usuario, "LoginUsuario", "NomeRazaoSocial");
            return View();
        } 

        //
        // POST: /Anuncio/Create

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
        // GET: /Anuncio/Edit/5
 
        public ActionResult Edit(int id)
        {
            Anuncio anuncio = db.Anuncio.Single(a => a.CodigoAnuncio == id);
            ViewBag.CodigoCategoria = new SelectList(db.Categoria, "CodigoCategoria", "DescricaoCategoria", anuncio.CodigoCategoria);
            ViewBag.LoginCriacao = new SelectList(db.Usuario, "LoginUsuario", "NomeRazaoSocial", anuncio.LoginCriacao);
            return View(anuncio);
        }

        //
        // POST: /Anuncio/Edit/5

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
        // GET: /Anuncio/Delete/5
 
        public ActionResult Delete(int id)
        {
            Anuncio anuncio = db.Anuncio.Single(a => a.CodigoAnuncio == id);
            return View(anuncio);
        }

        //
        // POST: /Anuncio/Delete/5

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