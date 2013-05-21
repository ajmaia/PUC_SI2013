﻿using System;
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
        public void ApuracaoPalpiteJogo()
        {
            Jogo jogo = new Jogo { CodigoJogo = 1, CodigoSelecaoA = 1, GolsSelecaoA = 3, CodigoSelecaoB = 2, GolsSelecaoB = 1 };
            PalpiteJogo palpite = new PalpiteJogo { LoginUsuario = "ajmaia", codigoJogo = 1, PalpiteGolsSelecaoA = 3, PalpiteGolsSelecaoB = 2 };
            Bolao bolao = new Bolao { LoginUsuario = "ajmaia" };
            BolaoController controller = new BolaoController();

            controller.ApuracaoPalpiteJogo(bolao,jogo , palpite);

            // Assert
            Assert.AreEqual(bolao.Pontuacao, 30);
        }
    }
}
