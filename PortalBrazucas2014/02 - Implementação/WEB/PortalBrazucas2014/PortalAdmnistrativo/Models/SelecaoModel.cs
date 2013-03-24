using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class SelecaoModel
    {
        public IQueryable<Selecao> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Selecao.AsQueryable<Selecao>();

            return query;
        }
    }
}