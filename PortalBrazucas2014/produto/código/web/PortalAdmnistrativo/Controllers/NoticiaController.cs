using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PortalAdmnistrativo.Models;

namespace PortalAdmnistrativo.Controllers
{ 
    public class NoticiaController : Controller
    {
        private Entities db = new Entities();

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
            var parametros = new Noticia();
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
        public ActionResult Buscar(Noticia parametros)
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
        public ActionResult Create(Noticia noticia)
        {
            noticia.DataPublicacaoString = DateTime.Now.ToShortTimeString();
            noticia.DescricaoCategoria = retornaCategorias(noticia.CodigoCategoria);

            noticia.Imagem.SaveAs("../../Content/Uploads/img(5).jpg");


            if (ModelState.IsValid)
            {
                db.Noticia.AddObject(noticia);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return PartialView("_painelInclusao", noticia);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Editar(int id)
        {
            this.ViewBag.ListaCategorias = listaCategorias();
            Noticia noticia = db.Noticia.Single(n => n.CodigoNoticia == id);
            return PartialView("_painelEdicao", noticia);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="noticia"></param>
        /// <returns></returns>
        [HttpPost, ActionName("Editar")]
        public ActionResult EditConfirmed(Noticia noticia)
        {

            if (ModelState.IsValid)
            {
                noticia.DescricaoCategoria = retornaCategorias(noticia.CodigoCategoria);

                db.Noticia.Attach(noticia);
                db.ObjectStateManager.ChangeObjectState(noticia, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
            return RedirectToAction("Erro");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="listaCodigos"></param>
        /// <returns></returns>
        public ActionResult ExcluirSelecionados(string listaCodigos)
        {
            List<Noticia> listaNoticia = new List<Noticia>();

            int codigoNoticia;

            foreach (var item in listaCodigos.TrimEnd(';').Split(';'))
            {
                codigoNoticia = Convert.ToInt32(item);
                listaNoticia.Add(db.Noticia.Single(h => h.CodigoNoticia == codigoNoticia));
            }

            var lista = listaNoticia.AsEnumerable<Noticia>();

            return PartialView("_excluir", lista);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Excluir(int id)
        {
            IEnumerable<Noticia> noticia = db.Noticia.Where(h => h.CodigoNoticia == id);
            return PartialView("_painelExclusao", noticia);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost, ActionName("Excluir")]
        public ActionResult DeleteConfirmed(int id)
        {
            Noticia noticia = db.Noticia.Single(n => n.CodigoNoticia == id);
            db.Noticia.DeleteObject(noticia);
            db.SaveChanges();

            return RedirectToAction("Erro");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="listaCnpj"></param>
        /// <returns></returns>
        [HttpPost, ActionName("ExcluirSelecionados")]
        public ActionResult DeleteConfirmed(string listaCodigos)
        {
            int codigoNoticia;

            foreach (var item in listaCodigos.TrimEnd(';').Split(';'))
            {
                codigoNoticia = Convert.ToInt32(item);
                db.Noticia.DeleteObject(db.Noticia.Single(h => h.CodigoNoticia == codigoNoticia));
            }

            db.SaveChanges();

            return RedirectToAction("Index");
        }

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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="disposing"></param>
        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}