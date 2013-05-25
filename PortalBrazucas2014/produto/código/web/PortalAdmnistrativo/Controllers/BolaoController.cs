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
            bolao.Pontuacao = 0;

            if ((jogo.GolsSelecaoA >= jogo.GolsSelecaoB && palpite.PalpiteGolsSelecaoA >= palpite.PalpiteGolsSelecaoB)
             || (jogo.GolsSelecaoA < jogo.GolsSelecaoB && palpite.PalpiteGolsSelecaoA < palpite.PalpiteGolsSelecaoB))
            {
                //Acertou vencedor;
                bolao.Pontuacao += 10;

                //Acertou placar seleção A;
                if (jogo.GolsSelecaoA == palpite.PalpiteGolsSelecaoA)
                    bolao.Pontuacao += 10;

                //Acertou placar seleção B;
                if (jogo.GolsSelecaoB == palpite.PalpiteGolsSelecaoB)
                    bolao.Pontuacao += 10;
            }

        }
    }
}
