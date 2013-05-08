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
    public partial class CidadeMetadata
    {
        [Display(Name = "CodigoCidade", ResourceType = typeof(Resouces.Cidade))]
        public int CodigoCidade;

        [Display(Name = "Nome", ResourceType = typeof(Resouces.Cidade))]
        public string Nome { get; set; }

        [Display(Name = "UF", ResourceType = typeof(Resouces.Cidade))]
        public string UF { get; set; }

        [Display(Name = "NomeEstadio", ResourceType = typeof(Resouces.Cidade))]
        public string NomeEstadio { get; set; }

        [Display(Name = "CapacidadeEstadio", ResourceType = typeof(Resouces.Cidade))]
        public string CapacidadeEstadio { get; set; }
    }
}