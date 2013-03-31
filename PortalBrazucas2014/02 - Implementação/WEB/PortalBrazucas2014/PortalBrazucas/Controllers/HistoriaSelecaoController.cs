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
    public class HistoriaSelecaoController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /HistoriaSelecao/

        public ViewResult Index()
        {
            var selecao = db.Selecao.Include("Grupo").Include("Historia");
            return View(selecao.ToList());
        }

        //
        // GET: /HistoriaSelecao/Details/5

        public ViewResult Details(int id)
        {
            Selecao selecao = db.Selecao.Single(s => s.CodigoSelecao == id);
            return View(selecao);
        }

        //
        // GET: /HistoriaSelecao/Create

        public ActionResult Create()
        {
            ViewBag.CodigoSelecao = new SelectList(db.Grupo, "CodigoGrupo", "DescricaoGrupo");
            ViewBag.CodigoHistoria = new SelectList(db.Historia, "CodigoHistoria", "HistoriaSelecao");
            return View();
        } 

        //
        // POST: /HistoriaSelecao/Create

        [HttpPost]
        public ActionResult Create(Selecao selecao)
        {
            if (ModelState.IsValid)
            {
                db.Selecao.AddObject(selecao);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.CodigoSelecao = new SelectList(db.Grupo, "CodigoGrupo", "DescricaoGrupo", selecao.CodigoSelecao);
            ViewBag.CodigoHistoria = new SelectList(db.Historia, "CodigoHistoria", "HistoriaSelecao", selecao.CodigoHistoria);
            return View(selecao);
        }
        
        //
        // GET: /HistoriaSelecao/Edit/5
 
        public ActionResult Edit(int id)
        {
            Selecao selecao = db.Selecao.Single(s => s.CodigoSelecao == id);
            ViewBag.CodigoSelecao = new SelectList(db.Grupo, "CodigoGrupo", "DescricaoGrupo", selecao.CodigoSelecao);
            ViewBag.CodigoHistoria = new SelectList(db.Historia, "CodigoHistoria", "HistoriaSelecao", selecao.CodigoHistoria);
            return View(selecao);
        }

        //
        // POST: /HistoriaSelecao/Edit/5

        [HttpPost]
        public ActionResult Edit(Selecao selecao)
        {
            if (ModelState.IsValid)
            {
                db.Selecao.Attach(selecao);
                db.ObjectStateManager.ChangeObjectState(selecao, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CodigoSelecao = new SelectList(db.Grupo, "CodigoGrupo", "DescricaoGrupo", selecao.CodigoSelecao);
            ViewBag.CodigoHistoria = new SelectList(db.Historia, "CodigoHistoria", "HistoriaSelecao", selecao.CodigoHistoria);
            return View(selecao);
        }

        //
        // GET: /HistoriaSelecao/Delete/5
 
        public ActionResult Delete(int id)
        {
            Selecao selecao = db.Selecao.Single(s => s.CodigoSelecao == id);
            return View(selecao);
        }

        //
        // POST: /HistoriaSelecao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Selecao selecao = db.Selecao.Single(s => s.CodigoSelecao == id);
            db.Selecao.DeleteObject(selecao);
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