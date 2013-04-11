using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class Usuario
    {
        public bool Anunciante
        {
            get 
            {
                if (string.IsNullOrEmpty(this.TipoPerfil))
                    return false;

                return (this.TipoPerfil.ToUpper() == "ANUNCIANTE");
            }
            set 
            {
                this.TipoPerfil = (value ? "Anunciante" : "Credenciado");
            }
        }

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