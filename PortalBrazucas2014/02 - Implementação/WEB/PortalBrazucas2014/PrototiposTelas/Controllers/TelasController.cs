using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PrototiposTelas.Controllers
{
    public class TelasController : Controller
    {
        //
        // GET: /Telas/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult NomeDaView()
        {
            return View();
        }

    }
}
