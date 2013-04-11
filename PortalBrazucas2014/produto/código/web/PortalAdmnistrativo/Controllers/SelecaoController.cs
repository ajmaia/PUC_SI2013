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
    public class SelecaoController : Controller
    {
        private Entities db = new Entities();

        //
        // GET: /Selecao/

        public ViewResult Index()
        {
            var selecao = db.Selecao.Include("Grupo").Include("Historia");
            return View(selecao.ToList());
        }

        //
        // GET: /Selecao/Details/5

        public ViewResult Details(int id)
        {
            Selecao selecao = db.Selecao.Single(s => s.CodigoSelecao == id);
            return View(selecao);
        }

        //
        // GET: /Selecao/Create

        public ActionResult Create()
        {
            ViewBag.CodigoSelecao = new SelectList(db.Grupo, "CodigoGrupo", "DescricaoGrupo");
            ViewBag.CodigoHistoria = new SelectList(db.Historia, "CodigoHistoria", "HistoriaSelecao");
            return View();
        }

        //
        // POST: /Selecao/Create

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
        // GET: /Selecao/Edit/5

        public ActionResult Edit(int id)
        {
            Selecao selecao = db.Selecao.Single(s => s.CodigoSelecao == id);
            ViewBag.CodigoSelecao = new SelectList(db.Grupo, "CodigoGrupo", "DescricaoGrupo", selecao.CodigoSelecao);
            ViewBag.CodigoHistoria = new SelectList(db.Historia, "CodigoHistoria", "HistoriaSelecao", selecao.CodigoHistoria);
            return View(selecao);
        }

        //
        // POST: /Selecao/Edit/5

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
        // GET: /Selecao/Delete/5

        public ActionResult Delete(int id)
        {
            Selecao selecao = db.Selecao.Single(s => s.CodigoSelecao == id);
            return View(selecao);
        }

        //
        // POST: /Selecao/Delete/5

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

        public ViewResult FaseGrupo()
        {
            return View(db.Selecao.ToList());
        }

        [HttpPost, ActionName("FaseGrupo")]
        public ActionResult FaseGrupo(List<Selecao> lista)
        {
            foreach (var item in lista)
            {
                var original = (from selecao in db.Selecao
                                where item.CodigoSelecao == selecao.CodigoSelecao
                                select selecao).First();
                db.ApplyCurrentValues(original.EntityKey.EntitySetName, item);
                db.SaveChanges();
            }
            return RedirectToAction("FaseGrupo");
        }

    }
}