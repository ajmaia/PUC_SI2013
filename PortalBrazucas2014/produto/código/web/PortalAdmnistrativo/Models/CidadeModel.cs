using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class Cidade
    {
        public string imagemUpload { get; set; }

        public IQueryable<Cidade> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Cidade.AsQueryable<Cidade>();

            if (this.CodigoCidade != 0)
                query = query.Where(item => item.CodigoCidade == this.CodigoCidade);

            if (!String.IsNullOrEmpty(this.UF))
                query = query.Where(item => item.UF == this.UF);

            if (!String.IsNullOrEmpty(this.NomeEstadio))
                query = query.Where(item => item.NomeEstadio == this.NomeEstadio);

            return query;
        }
    }
}