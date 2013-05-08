using System;
using System.Collections.Generic;
using System.Configuration;
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

        private void geraOrdemAnuncio()
        {
            try
            {
                DateTime hoje = DateTime.Now;
                var listaAnuncio = (from item in db.Anuncio
                                    where item.StatusAprovacao == "1" && item.DataPublicacao <= hoje
                                    select item.CodigoAnuncio).AsEnumerable<int>();

                Random aleatorio = new Random(DateTime.Now.Millisecond);
                int posPrimeiroAnuncio, posSegundoAnuncio, posTerceiroAnuncio, porQuartoAnuncio;
                int codPrimeiroAnuncio, codSegundoAnuncio, codTerceiroAnuncio, codQuartoAnuncio;

                posPrimeiroAnuncio = posSegundoAnuncio = posTerceiroAnuncio = porQuartoAnuncio = aleatorio.Next(0, listaAnuncio.Count());

                codPrimeiroAnuncio = listaAnuncio.ElementAt(posPrimeiroAnuncio);
                this.ViewBag.PrimeiroAnuncio = db.Anuncio.Single(anuncio => anuncio.CodigoAnuncio == codPrimeiroAnuncio);

                if (listaAnuncio.Count() > 1)
                {
                    while (posPrimeiroAnuncio == posSegundoAnuncio)
                        posSegundoAnuncio = aleatorio.Next(0, listaAnuncio.Count());

                    codSegundoAnuncio = listaAnuncio.ElementAt(posSegundoAnuncio);
                    this.ViewBag.SegundoAnuncio = db.Anuncio.Single(anuncio => anuncio.CodigoAnuncio == codSegundoAnuncio);
                }

                if (listaAnuncio.Count() > 1)
                {
                    while (posPrimeiroAnuncio == posTerceiroAnuncio || posSegundoAnuncio == posTerceiroAnuncio)
                        posTerceiroAnuncio = aleatorio.Next(0, listaAnuncio.Count());

                    codTerceiroAnuncio = listaAnuncio.ElementAt(posTerceiroAnuncio);
                    this.ViewBag.TerceiroAnuncio = db.Anuncio.Single(anuncio => anuncio.CodigoAnuncio == codTerceiroAnuncio);
                }

                if (listaAnuncio.Count() > 3)
                {
                    while (posPrimeiroAnuncio == porQuartoAnuncio || posSegundoAnuncio == porQuartoAnuncio || posTerceiroAnuncio == porQuartoAnuncio)
                        porQuartoAnuncio = aleatorio.Next(0, listaAnuncio.Count());

                    codQuartoAnuncio = listaAnuncio.ElementAt(porQuartoAnuncio);
                    this.ViewBag.QuartoAnuncio = db.Anuncio.Single(anuncio => anuncio.CodigoAnuncio == codQuartoAnuncio);
                }
            }
            catch (Exception)
            {

            }

        }

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
            string caminho = ConfigurationSettings.AppSettings["caminhoUpload"];
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

        public ActionResult ListarAnuncios()
        {
            geraOrdemAnuncio();
            return PartialView("_painelAnuncio");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}