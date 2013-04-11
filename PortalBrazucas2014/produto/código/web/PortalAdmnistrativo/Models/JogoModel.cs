using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class Jogo
    {

        public IQueryable<Jogo> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Jogo.AsQueryable<Jogo>();

            if (this.CodigoJogo != 0)
                query = query.Where(item => item.CodigoJogo == this.CodigoJogo);

            return query;
        }
    }
}