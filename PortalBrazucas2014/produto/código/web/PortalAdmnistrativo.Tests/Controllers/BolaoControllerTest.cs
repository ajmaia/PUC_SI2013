using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PortalAdmnistrativo;
using PortalAdmnistrativo.Controllers;
using PortalAdmnistrativo.Models;

namespace PortalAdmnistrativo.Tests.Controllers
{
    [TestClass]
    public class BolaoControllerTest
    {
        [TestMethod]
        public void ApuracaoPalpiteJogoAcertaVencedorErraPlacar()
        {
            Jogo jogo = new Jogo { CodigoJogo = 1, CodigoSelecaoA = 1, GolsSelecaoA = 3, CodigoSelecaoB = 2, GolsSelecaoB = 1 };
            PalpiteJogo palpite = new PalpiteJogo { LoginUsuario = "ajmaia", codigoJogo = 1, PalpiteGolsSelecaoA = 5, PalpiteGolsSelecaoB = 0 };
            Bolao bolao = new Bolao { LoginUsuario = "ajmaia" };
            BolaoController controller = new BolaoController();

            controller.ApuracaoPalpiteJogo(bolao,jogo , palpite);

            // Assert
            Assert.AreEqual(bolao.Pontuacao, 10);
        }

        [TestMethod]
        public void ApuracaoPalpiteJogoAcertaPlacarEquipeA()
        {
            Jogo jogo = new Jogo { CodigoJogo = 1, CodigoSelecaoA = 1, GolsSelecaoA = 3, CodigoSelecaoB = 2, GolsSelecaoB = 1 };
            PalpiteJogo palpite = new PalpiteJogo { LoginUsuario = "ajmaia", codigoJogo = 1, PalpiteGolsSelecaoA = 3, PalpiteGolsSelecaoB = 0 };
            Bolao bolao = new Bolao { LoginUsuario = "ajmaia" };
            BolaoController controller = new BolaoController();

            controller.ApuracaoPalpiteJogo(bolao, jogo, palpite);

            // Assert
            Assert.AreEqual(bolao.Pontuacao, 20);
        }

        [TestMethod]
        public void ApuracaoPalpiteJogoAcertaPlacarEquipeB()
        {
            Jogo jogo = new Jogo { CodigoJogo = 1, CodigoSelecaoA = 1, GolsSelecaoA = 3, CodigoSelecaoB = 2, GolsSelecaoB = 1 };
            PalpiteJogo palpite = new PalpiteJogo { LoginUsuario = "ajmaia", codigoJogo = 1, PalpiteGolsSelecaoA = 4, PalpiteGolsSelecaoB = 1 };
            Bolao bolao = new Bolao { LoginUsuario = "ajmaia" };
            BolaoController controller = new BolaoController();

            controller.ApuracaoPalpiteJogo(bolao, jogo, palpite);

            // Assert
            Assert.AreEqual(bolao.Pontuacao, 20);
        }

        [TestMethod]
        public void ApuracaoPalpiteJogoAcertaPlacarExato()
        {
            Jogo jogo = new Jogo { CodigoJogo = 1, CodigoSelecaoA = 1, GolsSelecaoA = 3, CodigoSelecaoB = 2, GolsSelecaoB = 1 };
            PalpiteJogo palpite = new PalpiteJogo { LoginUsuario = "ajmaia", codigoJogo = 1, PalpiteGolsSelecaoA = 3, PalpiteGolsSelecaoB = 1 };
            Bolao bolao = new Bolao { LoginUsuario = "ajmaia" };
            BolaoController controller = new BolaoController();

            controller.ApuracaoPalpiteJogo(bolao, jogo, palpite);

            // Assert
            Assert.AreEqual(bolao.Pontuacao, 30);
        }

        [TestMethod]
        public void ApuracaoPalpiteJogoAcertaPlacarEquipeAErraVencedor()
        {
            Jogo jogo = new Jogo { CodigoJogo = 1, CodigoSelecaoA = 1, GolsSelecaoA = 3, CodigoSelecaoB = 2, GolsSelecaoB = 1 };
            PalpiteJogo palpite = new PalpiteJogo { LoginUsuario = "ajmaia", codigoJogo = 1, PalpiteGolsSelecaoA = 3, PalpiteGolsSelecaoB = 5 };
            Bolao bolao = new Bolao { LoginUsuario = "ajmaia" };
            BolaoController controller = new BolaoController();

            controller.ApuracaoPalpiteJogo(bolao, jogo, palpite);

            // Assert
            Assert.AreEqual(bolao.Pontuacao, 0);
        }

        [TestMethod]
        public void ApuracaoPalpiteJogoAcertaPlacarEquipeBErraVencedor()
        {
            Jogo jogo = new Jogo { CodigoJogo = 1, CodigoSelecaoA = 1, GolsSelecaoA = 3, CodigoSelecaoB = 2, GolsSelecaoB = 1 };
            PalpiteJogo palpite = new PalpiteJogo { LoginUsuario = "ajmaia", codigoJogo = 1, PalpiteGolsSelecaoA = 0, PalpiteGolsSelecaoB = 1 };
            Bolao bolao = new Bolao { LoginUsuario = "ajmaia" };
            BolaoController controller = new BolaoController();

            controller.ApuracaoPalpiteJogo(bolao, jogo, palpite);

            // Assert
            Assert.AreEqual(bolao.Pontuacao, 0);
        }
    }
}
