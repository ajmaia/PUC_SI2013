using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PortalAdmnistrativo.Models.Metadata;

namespace PortalAdmnistrativo.Models
{
    public partial class Bolao
    {

        public IQueryable<Bolao> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Bolao.AsQueryable<Bolao>();

            return query;
        }
    }
}