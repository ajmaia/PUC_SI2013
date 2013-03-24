using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class PontuacaoBolao
    {

        public IQueryable<PontuacaoBolao> buscar()
        {
            Entities entity = new Entities();

            var query = entity.PontuacaoBolao.AsQueryable<PontuacaoBolao>();

            if (this.CodigoPontuacaoBolao != 0)
                query = query.Where(item => item.CodigoPontuacaoBolao == this.CodigoPontuacaoBolao);

            return query;
        }
    }
}