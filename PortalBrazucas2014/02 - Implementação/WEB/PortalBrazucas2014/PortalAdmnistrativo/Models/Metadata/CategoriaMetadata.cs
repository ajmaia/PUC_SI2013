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
    public partial class CategoriaMetadata
    {
        [Display(Name = "CodigoCategoria", ResourceType = typeof(Resouces.Categoria))]
        public int CodigoCategoria { get; set; }

        [Display(Name = "DescricaoCategoria", ResourceType = typeof(Resouces.Categoria))]
        public string DescricaoCategoria { get; set; }
    }
}