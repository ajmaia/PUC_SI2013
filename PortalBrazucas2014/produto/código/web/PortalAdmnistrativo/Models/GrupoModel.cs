using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PortalAdmnistrativo.Models.Metadata;

namespace PortalAdmnistrativo.Models
{
    public partial class Grupo
    {

        public IQueryable<Grupo> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Grupo.AsQueryable<Grupo>();

            if (this.CodigoGrupo != 0)
                query = query.Where(item => item.CodigoGrupo == this.CodigoGrupo);

            return query;
        }
    }
}