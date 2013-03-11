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
    public partial class PadraoMetadata
    {
        [Required()]
        [Display(Name = "CodigoPadrao", ResourceType = typeof(Resouces.Padrao))]
        public int CodigoPadrao;

        [Display(Name = "Titulo", ResourceType = typeof(Resouces.Padrao))]
        public string Titulo { get; set; }

        [Display(Name = "DataCriacao", ResourceType = typeof(Resouces.Padrao))]
        public DateTime DataCriacao { get; set; }

        [Display(Name = "Status", ResourceType = typeof(Resouces.Padrao))]
        public int Telefone { get; set; }
    }
}