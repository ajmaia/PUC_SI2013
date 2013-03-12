using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PortalAdmnistrativo.Models
{
    public partial class Padrao
    {
        public IQueryable<Padrao> buscar()
        {
            
            Entities entity = new Entities();
            var query = entity.Padrao.AsQueryable<Padrao>();

            if (this.CodigoPadrao != 0)
                query = query.Where(item => item.CodigoPadrao == this.CodigoPadrao);

            if (!String.IsNullOrEmpty(this.Titulo))
                query = query.Where(item => item.Titulo == this.Titulo);

            if (this.DataCadastro != null)
                query = query.Where(item => item.DataCadastro == this.DataCadastro);

            return query;
        }
    }
}