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
    public class JogoPortalController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /JogoPortal/

        public ViewResult Index()
        {
            var jogo = db.Jogo.Include("Cidade");
            return View(jogo.ToList());
        }

        //
        // GET: /JogoPortal/Details/5

        public ViewResult Details(int id)
        {
            Jogo jogo = db.Jogo.Single(j => j.CodigoJogo == id);
            return View(jogo);
        }

        //
        // GET: /JogoPortal/Create

        public ActionResult Create()
        {
            ViewBag.CodigoCidade = new SelectList(db.Cidade, "CodigoCidade", "Nome");
            return View();
        } 

        //
        // POST: /JogoPortal/Create

        [HttpPost]
        public ActionResult Create(Jogo jogo)
        {
            if (ModelState.IsValid)
            {
                db.Jogo.AddObject(jogo);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.CodigoCidade = new SelectList(db.Cidade, "CodigoCidade", "Nome", jogo.CodigoCidade);
            return View(jogo);
        }
        
        //
        // GET: /JogoPortal/Edit/5
 
        public ActionResult Edit(int id)
        {
            Jogo jogo = db.Jogo.Single(j => j.CodigoJogo == id);
            ViewBag.CodigoCidade = new SelectList(db.Cidade, "CodigoCidade", "Nome", jogo.CodigoCidade);
            return View(jogo);
        }

        //
        // POST: /JogoPortal/Edit/5

        [HttpPost]
        public ActionResult Edit(Jogo jogo)
        {
            if (ModelState.IsValid)
            {
                db.Jogo.Attach(jogo);
                db.ObjectStateManager.ChangeObjectState(jogo, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CodigoCidade = new SelectList(db.Cidade, "CodigoCidade", "Nome", jogo.CodigoCidade);
            return View(jogo);
        }

        //
        // GET: /JogoPortal/Delete/5
 
        public ActionResult Delete(int id)
        {
            Jogo jogo = db.Jogo.Single(j => j.CodigoJogo == id);
            return View(jogo);
        }

        //
        // POST: /JogoPortal/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Jogo jogo = db.Jogo.Single(j => j.CodigoJogo == id);
            db.Jogo.DeleteObject(jogo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        public ActionResult ListarUltimoJogo()
        {
            Jogo ultimoJogo = db.Jogo.Where(j => j.GolsSelecaoA != null && j.GolsSelecaoB != null).OrderByDescending(j => j.CodigoJogo).FirstOrDefault();
            return PartialView("_painelUltimoJogo", ultimoJogo);
        }
    }
}