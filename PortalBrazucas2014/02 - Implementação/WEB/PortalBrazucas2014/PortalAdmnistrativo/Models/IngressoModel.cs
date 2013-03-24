using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class Ingresso
    {

        public IQueryable<Ingresso> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Ingresso.AsQueryable<Ingresso>();

            return query;
        }
    }
}