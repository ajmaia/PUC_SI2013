using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PortalAdmnistrativo.Models.Metadata;

namespace PortalAdmnistrativo.Models
{
    public partial class Usuario
    {

        public IQueryable<Usuario> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Usuario.AsQueryable<Usuario>();

            if(!String.IsNullOrEmpty(this.LoginUsuario))
                query = query.Where(item => item.LoginUsuario == this.LoginUsuario);

            return query;
        }
    }
}