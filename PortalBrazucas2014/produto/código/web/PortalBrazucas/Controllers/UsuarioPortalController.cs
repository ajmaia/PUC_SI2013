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
    public class UsuarioPortalController : Controller
    {
        private Entities db = new Entities();

        public ActionResult EfetuaLogin(string user, string password)
        {
            UsuarioLogar usuario = new UsuarioLogar();
            usuario.Login = user;
            usuario.Senha = password;

            

            return RedirectToAction("Index", "HomePortal"); 
        }

        protected IQueryable listaSexo()
        {
            List<SelectListItem> lista = new List<SelectListItem>();
            lista.Add(new SelectListItem() { Text = "Masculino", Value = "M" });
            lista.Add(new SelectListItem() { Text = "Feminino", Value = "F" });

            return lista.AsQueryable();
        }

        public ActionResult Create()
        {
            this.ViewBag.ListaSexo = listaSexo();
            return View();
        } 

        [HttpPost]
        public ActionResult Create(Usuario usuario)
        {
            usuario.CriptografarSenha();

            if (ModelState.IsValid)
            {
                db.Usuario.AddObject(usuario);
                db.SaveChanges();
                return RedirectToAction("Index", "HomePortal");
            }

            return View("Edit", usuario);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}