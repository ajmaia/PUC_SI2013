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
    public class BolaoController : Controller
    {
        public void ApuracaoPalpiteJogo(Bolao bolao, Jogo jogo, PalpiteJogo palpite)
        {
            bolao.Pontuacao = 30;
        }
    }
}
