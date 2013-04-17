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

        protected int proximoAnuncio()
        {
            try
            {
                var context = new Entities();

                Anuncio anuncio = db.Anuncio.OrderByDescending(n => n.CodigoAnuncio).Take(1).SingleOrDefault();

                return anuncio.CodigoAnuncio + 1;
            }
            catch (Exception)
            {
                return 1;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="codCategoria"></param>
        /// <returns></returns>
        protected string retornaCategorias(int codCategoria)
        {
            var context = new Entities();

            var resultado = (from item in context.Categoria
                             where item.CodigoCategoria == codCategoria
                             select item.DescricaoCategoria);

            return resultado.Single();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        protected IQueryable listaCategorias()
        {
            var context = new Entities();

            var resultado = (from item in context.Categoria
                             where item.TipoCategoria != true
                             orderby item.DescricaoCategoria
                             select new { Text = item.DescricaoCategoria, Value = item.CodigoCategoria });

            return resultado;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ViewResult Index()
        {
            var parametros = new Anuncio();
            parametros.LoginCriacao = "ajmaia";
            this.ViewBag.Parametros = parametros;
            this.ViewBag.Resultados = parametros.buscar();
            this.ViewBag.ListaCategorias = listaCategorias();

            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="parametros"></param>
        /// <returns></returns>
        public ActionResult Buscar(Anuncio parametros)
        {
            this.ViewBag.ListaCategorias = listaCategorias();
            this.ViewBag.Parametros = parametros;
            this.ViewBag.Resultado = parametros.buscar();

            return View("Index", this.ViewBag.Resultado);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            this.ViewBag.ListaCategorias = listaCategorias();
            return PartialView("_painelInclusao");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="noticia"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Anuncio anuncio)
        {
            string caminho = "C:\\Users\\Alexandre\\PUC_SI2013\\PortalBrazucas2014\\produto\\código\\web\\PortalBrazucas\\Content\\uploads\\";
            int idAtual = proximoAnuncio();
            anuncio.CaminhoImagem = String.Format("../../Content/uploads/noticia_{0}.jpg", idAtual);
            anuncio.DescricaoCategoria = retornaCategorias(anuncio.CodigoCategoria);

            HttpPostedFileBase file = Request.Files[0];
            byte[] imageSize = new byte[file.ContentLength];
            file.InputStream.Read(imageSize, 0, (int)file.ContentLength);
            file.SaveAs(String.Format("{0}anuncio_{1}.jpg", caminho, idAtual));

            if (ModelState.IsValid)
            {
                db.Anuncio.AddObject(anuncio);
                db.SaveChanges();

                return RedirectToAction("Index");
            }

            return PartialView("_painelInclusao", anuncio);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}