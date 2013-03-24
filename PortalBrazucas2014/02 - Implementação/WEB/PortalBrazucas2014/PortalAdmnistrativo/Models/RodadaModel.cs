using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class Rodada
    {

        public IQueryable<Rodada> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Rodada.AsQueryable<Rodada>();

            return query;
        }
    }
}