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
    public class HomePortalController : Controller
    {
        private Entities db = new Entities();

        private void geraOrdemNoticia()
        {
            try
            {
                var listaNoticia = (from item in db.Noticia
                                    select item.CodigoNoticia).AsEnumerable<int>();

                Random aleatorio = new Random(DateTime.Now.Millisecond);
                int posNoticiaPrincipal, posNoticiaSecundaria, posNoticiaTerciaria;
                int codNoticiaPrincipal, codNoticiaSecundaria, codNoticiaTerciaria;

                posNoticiaPrincipal = posNoticiaSecundaria = posNoticiaTerciaria = aleatorio.Next(0, listaNoticia.Count());

                codNoticiaPrincipal = listaNoticia.ElementAt(posNoticiaPrincipal);
                this.ViewBag.NoticiaPrincipal = db.Noticia.Single(noticia => noticia.CodigoNoticia == codNoticiaPrincipal);

                if (listaNoticia.Count() > 1)
                {
                    while (posNoticiaPrincipal == posNoticiaSecundaria)
                        posNoticiaSecundaria = aleatorio.Next(0, listaNoticia.Count());

                    codNoticiaSecundaria = listaNoticia.ElementAt(posNoticiaSecundaria);
                    this.ViewBag.NoticiaSecundaria = db.Noticia.Single(noticia => noticia.CodigoNoticia == codNoticiaSecundaria);
                }

                if (listaNoticia.Count() > 2)
                {
                    while (posNoticiaPrincipal == posNoticiaTerciaria || posNoticiaSecundaria == posNoticiaTerciaria)
                        posNoticiaTerciaria = aleatorio.Next(0, listaNoticia.Count());

                    codNoticiaTerciaria = listaNoticia.ElementAt(posNoticiaTerciaria);
                    this.ViewBag.NoticiaTerciaria = db.Noticia.Single(noticia => noticia.CodigoNoticia == codNoticiaTerciaria);
                }
            }
            catch (Exception)
            {

            }

        }

        public ActionResult Index()
        {
            geraOrdemNoticia();
            return View();
        }
    }
}
