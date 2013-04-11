using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class Historia
    {

        public IQueryable<Historia> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Historia.AsQueryable<Historia>();

            if (this.CodigoHistoria != 0)
                query = query.Where(item => item.CodigoHistoria == this.CodigoHistoria);

            return query;
        }
    }
}