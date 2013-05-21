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
            if(jogo.GolsSelecaoA == palpite.PalpiteGolsSelecaoA && jogo.GolsSelecaoB == palpite.PalpiteGolsSelecaoB)
                bolao.Pontuacao = 30;
            else if ((jogo.GolsSelecaoA >= jogo.GolsSelecaoA && palpite.PalpiteGolsSelecaoA >= palpite.PalpiteGolsSelecaoB)
                  || (jogo.GolsSelecaoA < jogo.GolsSelecaoA && palpite.PalpiteGolsSelecaoA < palpite.PalpiteGolsSelecaoB))
                bolao.Pontuacao = 10;

        }
    }
}
