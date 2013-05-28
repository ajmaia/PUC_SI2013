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

        [TestMethod]
        public void ApuracaoFinal()
        {
            Jogo jogo1 = new Jogo { CodigoJogo = 1, CodigoSelecaoA = 1, GolsSelecaoA = 3, CodigoSelecaoB = 2, GolsSelecaoB = 1 };
            Jogo jogo2 = new Jogo { CodigoJogo = 2, CodigoSelecaoA = 3, GolsSelecaoA = 0, CodigoSelecaoB = 4, GolsSelecaoB = 2 };
            Jogo jogo3 = new Jogo { CodigoJogo = 3, CodigoSelecaoA = 1, GolsSelecaoA = 1, CodigoSelecaoB = 3, GolsSelecaoB = 3 };
            Jogo jogo4 = new Jogo { CodigoJogo = 4, CodigoSelecaoA = 2, GolsSelecaoA = 1, CodigoSelecaoB = 4, GolsSelecaoB = 1 };

            PontuacaoBolao bolaoAlexandre = new PontuacaoBolao { LoginUsuario = "ajmaia" };
            PontuacaoBolao bolaoLorena = new PontuacaoBolao { LoginUsuario = "lorena" };
            PontuacaoBolao bolaoRafael = new PontuacaoBolao { LoginUsuario = "rafael" };
            PontuacaoBolao bolaoDiogo = new PontuacaoBolao { LoginUsuario = "diogo" };

            PalpiteJogo palpiteA1 = new PalpiteJogo { LoginUsuario = "ajmaia", codigoJogo = 1, PalpiteGolsSelecaoA = 3, PalpiteGolsSelecaoB = 1 };
            PalpiteJogo palpiteA2 = new PalpiteJogo { LoginUsuario = "ajmaia", codigoJogo = 2, PalpiteGolsSelecaoA = 0, PalpiteGolsSelecaoB = 2 };
            PalpiteJogo palpiteA3 = new PalpiteJogo { LoginUsuario = "ajmaia", codigoJogo = 3, PalpiteGolsSelecaoA = 1, PalpiteGolsSelecaoB = 3 };
            PalpiteJogo palpiteA4 = new PalpiteJogo { LoginUsuario = "ajmaia", codigoJogo = 4, PalpiteGolsSelecaoA = 1, PalpiteGolsSelecaoB = 1 };

            PalpiteJogo palpiteL1 = new PalpiteJogo { LoginUsuario = "lorena", codigoJogo = 1, PalpiteGolsSelecaoA = 3, PalpiteGolsSelecaoB = 1 };
            PalpiteJogo palpiteL2 = new PalpiteJogo { LoginUsuario = "lorena", codigoJogo = 2, PalpiteGolsSelecaoA = 0, PalpiteGolsSelecaoB = 1 };
            PalpiteJogo palpiteL3 = new PalpiteJogo { LoginUsuario = "lorena", codigoJogo = 3, PalpiteGolsSelecaoA = 1, PalpiteGolsSelecaoB = 1 };
            PalpiteJogo palpiteL4 = new PalpiteJogo { LoginUsuario = "lorena", codigoJogo = 4, PalpiteGolsSelecaoA = 1, PalpiteGolsSelecaoB = 1 };

            PalpiteJogo palpiteR1 = new PalpiteJogo { LoginUsuario = "rafael", codigoJogo = 1, PalpiteGolsSelecaoA = 0, PalpiteGolsSelecaoB = 1 };
            PalpiteJogo palpiteR2 = new PalpiteJogo { LoginUsuario = "rafael", codigoJogo = 2, PalpiteGolsSelecaoA = 0, PalpiteGolsSelecaoB = 2 };
            PalpiteJogo palpiteR3 = new PalpiteJogo { LoginUsuario = "rafael", codigoJogo = 3, PalpiteGolsSelecaoA = 0, PalpiteGolsSelecaoB = 3 };
            PalpiteJogo palpiteR4 = new PalpiteJogo { LoginUsuario = "rafael", codigoJogo = 4, PalpiteGolsSelecaoA = 0, PalpiteGolsSelecaoB = 1 };

            PalpiteJogo palpiteD1 = new PalpiteJogo { LoginUsuario = "diogo", codigoJogo = 1, PalpiteGolsSelecaoA = 3, PalpiteGolsSelecaoB = 3 };
            PalpiteJogo palpiteD2 = new PalpiteJogo { LoginUsuario = "diogo", codigoJogo = 2, PalpiteGolsSelecaoA = 0, PalpiteGolsSelecaoB = 1 };
            PalpiteJogo palpiteD3 = new PalpiteJogo { LoginUsuario = "diogo", codigoJogo = 3, PalpiteGolsSelecaoA = 3, PalpiteGolsSelecaoB = 2 };
            PalpiteJogo palpiteD4 = new PalpiteJogo { LoginUsuario = "diogo", codigoJogo = 4, PalpiteGolsSelecaoA = 1, PalpiteGolsSelecaoB = 0 };

            BolaoController controller = new BolaoController();

            controller.ApuracaoPalpiteJogo(bolaoAlexandre, jogo1, palpiteA1);
            controller.ApuracaoPalpiteJogo(bolaoAlexandre, jogo2, palpiteA2);
            controller.ApuracaoPalpiteJogo(bolaoAlexandre, jogo3, palpiteA3);
            controller.ApuracaoPalpiteJogo(bolaoAlexandre, jogo4, palpiteA4);

            controller.ApuracaoPalpiteJogo(bolaoLorena, jogo1, palpiteL1);
            controller.ApuracaoPalpiteJogo(bolaoLorena, jogo2, palpiteL2);
            controller.ApuracaoPalpiteJogo(bolaoLorena, jogo3, palpiteL3);
            controller.ApuracaoPalpiteJogo(bolaoLorena, jogo4, palpiteL4);

            controller.ApuracaoPalpiteJogo(bolaoRafael, jogo1, palpiteR1);
            controller.ApuracaoPalpiteJogo(bolaoRafael, jogo2, palpiteR2);
            controller.ApuracaoPalpiteJogo(bolaoRafael, jogo3, palpiteR3);
            controller.ApuracaoPalpiteJogo(bolaoRafael, jogo4, palpiteR4);

            controller.ApuracaoPalpiteJogo(bolaoDiogo, jogo1, palpiteD1);
            controller.ApuracaoPalpiteJogo(bolaoDiogo, jogo2, palpiteD2);
            controller.ApuracaoPalpiteJogo(bolaoDiogo, jogo3, palpiteD3);
            controller.ApuracaoPalpiteJogo(bolaoDiogo, jogo4, palpiteD4);

            List<PontuacaoBolao> lista = new List<PontuacaoBolao>();
            lista.Add(bolaoAlexandre);
            lista.Add(bolaoDiogo);
            lista.Add(bolaoLorena);
            lista.Add(bolaoRafael);

            IEnumerable<Bolao> ResultadoBolao = controller.ApuracaoFinal(lista);

            // Assert
            Assert.AreEqual(ResultadoBolao.SingleOrDefault(bolao => bolao.RankingBolao == 1).LoginUsuario , "ajmaia");
        }
    }
}
