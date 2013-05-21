using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class Cidade
    {

        public IQueryable<Cidade> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Cidade.AsQueryable<Cidade>();

            if (this.CodigoCidade != 0)
                query = query.Where(item => item.CodigoCidade == this.CodigoCidade);

            return query;
        }
    }
}