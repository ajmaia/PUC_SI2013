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
    public class PadraoController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /Padrao/

        public ViewResult Index()
        {
            var parametros = new Padrao();
            this.ViewBag.Parametros = parametros;
            this.ViewBag.Resultados = parametros.buscar();

            return View();
        }

        public ActionResult Buscar(Padrao parametros)
        {
            this.ViewBag.Resultado = parametros.buscar();

            return View("Index");
        }

        //
        // GET: /Padrao/Details/5

        public ViewResult Details(int id)
        {
            Padrao padrao = db.Padrao.Find(id);
            return View(padrao);
        }

        //
        // GET: /Padrao/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Padrao/Create

        [HttpPost]
        public ActionResult Create(Padrao padrao)
        {
            if (ModelState.IsValid)
            {
                db.Padrao.Add(padrao);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(padrao);
        }
        
        //
        // GET: /Padrao/Edit/5
 
        public ActionResult Edit(int id)
        {
            Padrao padrao = db.Padrao.Find(id);
            return View(padrao);
        }

        //
        // POST: /Padrao/Edit/5

        [HttpPost]
        public ActionResult Edit(Padrao padrao)
        {
            if (ModelState.IsValid)
            {
                db.Entry(padrao).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(padrao);
        }

        //
        // GET: /Padrao/Delete/5
 
        public ActionResult Delete(int id)
        {
            Padrao padrao = db.Padrao.Find(id);
            return View(padrao);
        }

        //
        // POST: /Padrao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Padrao padrao = db.Padrao.Find(id);
            db.Padrao.Remove(padrao);
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