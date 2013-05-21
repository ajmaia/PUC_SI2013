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
    public class JogoController : Controller
    {
        private Entities db = new Entities();
        static string mensagem = "";

        /// <summary>
        /// View Principal do caso de uso Admnistrar Tabela de Jogos
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            ViewBag.Etapa2 = Convert.ToString(VerificaOrdemGrupo());
            return View();
        }

        /// <summary>
        /// PartialView para exibir os combox para cadastro dos países no grupo
        /// </summary>
        /// <returns></returns>
        public ActionResult GrupoEscolhido()
        {

            if (ModelState.IsValid)
            {
                try
                {
                    var selecoesGrupo = db.Selecao.ToList().OrderBy(s => s.Nome);
                    ViewBag.Selecoes = new SelectList(selecoesGrupo, "CodigoSelecao", "Nome");
                    return PartialView("CadastroSelecaoGrupo");
                }
                catch (Exception e)
                {
                    ViewBag.Mensagem = e.Message;
                    return RedirectToAction("Index");
                }
            }
            else
                return new EmptyResult();
        }

        /// <summary>
        /// View para cadastro de grupo na copa
        /// </summary>
        /// <returns></returns>
        public ActionResult CadastrarGrupo()
        {
            ViewBag.PaisSemCadastro = db.Selecao.Where(s => s.OrdemGrupo == null).ToList();
            ViewBag.GrupoSemCadastro = (from g in db.Selecao
                                        where g.OrdemGrupo == null
                                        select g.DescricaoGrupo).Distinct();
            ViewBag.Mensagem = mensagem;
            ViewBag.Grupos = new SelectList(db.Grupo.ToList().OrderBy(g => g.DescricaoGrupo), "CodigoGrupo", "DescricaoGrupo");
            return View();
        }

        //
        // POST: /CadastroGrupo
        [HttpPost]
        public ActionResult CadastrarGrupo(Jogo jogo)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    if (VerificaPaises())
                    {
                        int codigoGrupo = Convert.ToInt32(Request.Form["Grupo"]);
                        int posicao = 1;
                        while (posicao < 5)
                        {
                            string textoForm = "Pos" + posicao;
                            int selecao = Convert.ToInt32(Request.Form[textoForm]);
                            Selecao resultado = db.Selecao.Where(s => s.CodigoSelecao == selecao).FirstOrDefault();
                            resultado.CodigoGrupo = codigoGrupo;
                            resultado.OrdemGrupo = posicao;
                            db.ObjectStateManager.ChangeObjectState(resultado, EntityState.Modified);
                            db.SaveChanges();
                            posicao++;
                        }
                    }
                    else
                    {

                        return RedirectToAction("CadastrarGrupo");
                    }
                }
                catch (Exception e)
                {
                    mensagem = e.Message;
                    return RedirectToAction("CadastrarGrupo");
                }
                mensagem = "Posição dos países cadastrada com sucesso!";
                return RedirectToAction("CadastrarGrupo");
            }
            mensagem = "ERRO:Estado do modelo inválido! ";
            return RedirectToAction("CadastrarGrupo");
        }

        /*
            ViewBag.CodigoCidade = new SelectList(db.Cidade, "CodigoCidade", "Nome", jogo.CodigoCidade);
            ViewBag.CodigoSelecaoA = new SelectList(db.Selecao, "CodigoSelecao", "Nome", jogo.CodigoSelecaoA);
            ViewBag.CodigoSelecaoB = new SelectList(db.Selecao, "CodigoSelecao", "Nome", jogo.CodigoSelecaoB);
        */

        /// <summary>
        /// Cadastrar Jogos na fase de grupos da Copa
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ViewResult CadastrarJogo()
        {
            ViewBag.Jogos = db.Jogo.Where(jo => jo.Rodada < 4).OrderBy(jg => jg.DataHora).ToList();
            return View();
        }

        /// <summary>
        /// PartialView para exibir os combox para cadastro dos países no grupo
        /// </summary>
        /// <returns></returns>
        public ActionResult GrupoEscolhidoParaJogo()
        {

            if (ModelState.IsValid)
            {
                try
                {
                    int codigoGrupo = Convert.ToInt32(Request.Form["Grupo"]);
                    List<Jogo> jogos = new List<Jogo>();
                    foreach (var selecao in db.Selecao.Where(s => s.CodigoGrupo == codigoGrupo))
                    {
                        var resultado = (from j in db.Jogo
                             where j.CodigoSelecaoA == selecao.CodigoSelecao
                             select j).First();
                        jogos.Add(resultado);
                    }
                    return PartialView("CadastroSelecaoGrupo");
                }
                catch (Exception e)
                {
                    ViewBag.Mensagem = e.Message;
                    return RedirectToAction("Index");
                }
            }
            else
                return new EmptyResult();
        }


        public ActionResult EditarJogo(int id)
        {
            Jogo jogo = db.Jogo.Single(j => j.CodigoJogo == id);
            ViewBag.CodigoCidade = new SelectList(db.Cidade, "CodigoCidade", "Nome", jogo.CodigoCidade);
            ViewBag.CodigoSelecaoA = new SelectList(db.Selecao, "CodigoSelecao", "Nome", jogo.CodigoSelecaoA);
            ViewBag.CodigoSelecaoB = new SelectList(db.Selecao, "CodigoSelecao", "Nome", jogo.CodigoSelecaoB);
            return View(jogo);
        }

        //
        // POST: /Jogo/Edit/5

        [HttpPost]
        public ActionResult EditarJogo(Jogo jogo)
        {
            jogo.NomeCidade = (from c in db.Cidade
                               where c.CodigoCidade == jogo.CodigoCidade
                               select c.Nome).First();
            if (ModelState.IsValid)            
            {
                //db.Jogo.Attach(jogo);
                //db.ObjectStateManager.ChangeObjectState(jogo, EntityState.Modified);
                //db.SaveChanges();
                return RedirectToAction("Index");
            }
            else return View(jogo);
        }

        //
        // GET: /Jogo/Delete/5

        public ActionResult Delete(int id)
        {
            Jogo jogo = db.Jogo.Single(j => j.CodigoJogo == id);
            return View(jogo);
        }

        //
        // POST: /Jogo/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Jogo jogo = db.Jogo.Single(j => j.CodigoJogo == id);
            db.Jogo.DeleteObject(jogo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        /// <summary>
        /// Verifica se os quatro países selecionados são diferentes entre si e se não possuem cadastro de grupo em banco.
        /// </summary>
        /// <returns></returns>
        private bool VerificaPaises()
        {
            if (Request.Form["Pos1"] != "" ||
                Request.Form["Pos2"] != "" ||
                Request.Form["Pos3"] != "" ||
                Request.Form["Pos4"] != "")
            {
                if (Request.Form["Pos1"] != Request.Form["Pos2"] &&
                    Request.Form["Pos1"] != Request.Form["Pos3"] &&
                    Request.Form["Pos1"] != Request.Form["Pos4"] &&
                    Request.Form["Pos2"] != Request.Form["Pos3"] &&
                    Request.Form["Pos3"] != Request.Form["Pos4"])
                {
                    return true;
                }
                else
                {
                    mensagem = "ERRO: selecione apenas uma seleção por posição do grupo";
                    return false;
                }
            }
            else
            {
                mensagem = "ERRO: você precisa selecionar países em cada uma das posições estipuladas para o grupo!";
                return false;
            }
        }
        #region Métodos Privados

        /// <summary>
        /// Verifica se todas as seleções foram cadastradas em seus grupos
        /// </summary>
        /// <returns>True se todos os grupos já foram formados</returns>
        private bool VerificaOrdemGrupo()
        {
            foreach (var item in db.Selecao)
            {
                if (item.OrdemGrupo == null)
                {
                    return false;
                }
            }
            return true;
        }

        #endregion

    }
}