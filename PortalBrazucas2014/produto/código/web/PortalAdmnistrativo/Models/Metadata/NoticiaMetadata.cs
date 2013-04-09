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
    public partial class NoticiaMetadata
    {
        [Display(Name = "CodigoNoticia", ResourceType = typeof(Resouces.Noticia))]
        public int CodigoNoticia;

        [Display(Name = "Titulo", ResourceType = typeof(Resouces.Noticia))]
        public string Titulo { get; set; }

        [Display(Name = "CaminhoImagem", ResourceType = typeof(Resouces.Noticia))]
        public string CaminhoImagem { get; set; }

        [Display(Name = "Conteudo", ResourceType = typeof(Resouces.Noticia))]
        public string Conteudo { get; set; }

        [Display(Name = "DataPublicacao", ResourceType = typeof(Resouces.Noticia))]
        public DateTime DataPublicacao { get; set; }

        [Display(Name = "Autor", ResourceType = typeof(Resouces.Noticia))]
        public string Autor { get; set; }

        [Display(Name = "CodigoCategoria", ResourceType = typeof(Resouces.Categoria))]
        public int CodigoCategoria { get; set; }

        [Display(Name = "DescricaoCategoria", ResourceType = typeof(Resouces.Categoria))]
        public string DescricaoCategoria { get; set; }
    }
}