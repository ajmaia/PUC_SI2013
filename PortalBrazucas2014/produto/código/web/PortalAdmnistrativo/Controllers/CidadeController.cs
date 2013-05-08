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
    public class CidadeController : Controller
    {
        private Entities db = new Entities();

        protected int proximaCidade()
        {
            try
            {
                var context = new Entities();

                Cidade cidade = db.Cidade.OrderByDescending(n => n.CodigoCidade).Take(1).SingleOrDefault();

                return cidade.CodigoCidade + 1;
            }
            catch (Exception)
            {
                return 1;
            }
        }

        protected IQueryable listaEstados()
        {
            var context = new Entities();

            var resultado = (from item in context.Cidade
                             orderby item.UF
                             select new { Text = item.UF, Value = item.UF });

            return resultado;
        }

        public ViewResult Index()
        {
            var parametros = new Cidade();
            this.ViewBag.Parametros = parametros;
            this.ViewBag.Resultados = parametros.buscar();
            this.ViewBag.ListaEstados = listaEstados();

            return View();
        }

        public ActionResult Buscar(Cidade parametros)
        {
            this.ViewBag.ListaEstados = listaEstados();
            this.ViewBag.Parametros = parametros;
            this.ViewBag.Resultado = parametros.buscar();

            return View("Index", this.ViewBag.Resultado);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}