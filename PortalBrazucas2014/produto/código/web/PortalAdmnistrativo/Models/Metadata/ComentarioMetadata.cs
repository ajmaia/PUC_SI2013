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
    public partial class ComentarioMetadata
    {
        [Display(Name = "CodigoComentario", ResourceType = typeof(Resouces.Comentario))]
        public int CodigoComentario;

        [Display(Name = "Conteudo", ResourceType = typeof(Resouces.Comentario))]
        public string Conteudo { get; set; }

        [Display(Name = "LoginCriacao", ResourceType = typeof(Resouces.Comentario))]
        public string LoginCriacao { get; set; }

        [Display(Name = "NomeLoginCriacao", ResourceType = typeof(Resouces.Comentario))]
        public string NomeLoginCriacao { get; set; }

        [Display(Name = "DataCriacao", ResourceType = typeof(Resouces.Comentario))]
        public DateTime DataCriacao { get; set; }

        [Display(Name = "StatusAprovacao", ResourceType = typeof(Resouces.Comentario))]
        public bool StatusAprovacao { get; set; }

        [Display(Name = "UsuarioAprovacao", ResourceType = typeof(Resouces.Comentario))]
        public string UsuarioAprovacao { get; set; }

        [Display(Name = "CodigoNoticia", ResourceType = typeof(Resouces.Comentario))]
        public int CodigoNoticia { get; set; }
    }
}