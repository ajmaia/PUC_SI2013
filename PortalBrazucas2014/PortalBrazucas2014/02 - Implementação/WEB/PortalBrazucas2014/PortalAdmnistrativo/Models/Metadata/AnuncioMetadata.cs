using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using System.Data.Objects;
using System.Web.Mvc;
using PortalAdmnistrativo.Resouces;

namespace PortalAdmnistrativo.Models.Metadata
{
    public partial class AnuncioMetadata
    {
        [Display(Name = "CodigoAnuncio", ResourceType = typeof(Resouces.Anuncio))]
        public int CodigoAnuncio;

        [Display(Name = "Titulo", ResourceType = typeof(Resouces.Anuncio))]
        public string Titulo { get; set; }

        [Display(Name = "CaminhoImagem", ResourceType = typeof(Resouces.Anuncio))]
        public string CaminhoImagem { get; set; }

        [Display(Name = "Conteudo", ResourceType = typeof(Resouces.Anuncio))]
        public string Conteudo { get; set; }

        [Display(Name = "DataPublicacao", ResourceType = typeof(Resouces.Anuncio))]
        public DateTime DataPublicacao { get; set; }

        [Display(Name = "LoginCriacao", ResourceType = typeof(Resouces.Anuncio))]
        public string LoginCriacao { get; set; }

        [Display(Name = "StatusAprovacao", ResourceType = typeof(Resouces.Anuncio))]
        public bool StatusAprovacao { get; set; }

        [Display(Name = "UsuarioAprovacao", ResourceType = typeof(Resouces.Anuncio))]
        public string UsuarioAprovacao { get; set; }

        [Display(Name = "CodigoCategoria", ResourceType = typeof(Resouces.Categoria))]
        public int CodigoCategoria { get; set; }

        [Display(Name = "DescricaoCategoria", ResourceType = typeof(Resouces.Categoria))]
        public string DescricaoCategoria { get; set; }
    }
}