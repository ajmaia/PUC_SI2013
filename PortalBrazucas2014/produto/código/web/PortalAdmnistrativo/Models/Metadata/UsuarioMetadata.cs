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
    public partial class UsuarioMetadata
    {
        [Required]
        public string LoginUsuario { get; set; }

        [Required]
        public decimal CpfCnpj { get; set; }

        [Required]
        public string NomeRazaoSocial { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string SenhaDescriptografada { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [System.Web.Mvc.Compare("SenhaDescriptografada", ErrorMessage = "A verificação não corresponde a senha informada.")]
        public string ConfirmaSenha { get; set; }
    }
}