using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class PalpiteJogo
    {

        public IQueryable<PalpiteJogo> buscar()
        {
            Entities entity = new Entities();

            var query = entity.PalpiteJogo.AsQueryable<PalpiteJogo>();

            if (this.CodigoPalpite != 0)
                query = query.Where(item => item.CodigoPalpite == this.CodigoPalpite);

            return query;
        }
    }
}