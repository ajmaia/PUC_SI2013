using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class Selecao
    {
        public IQueryable<Selecao> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Selecao.AsQueryable<Selecao>();

            if (this.CodigoSelecao != 0)
                query = query.Where(item => item.CodigoSelecao == this.CodigoSelecao);

            return query;
        }
    }
}