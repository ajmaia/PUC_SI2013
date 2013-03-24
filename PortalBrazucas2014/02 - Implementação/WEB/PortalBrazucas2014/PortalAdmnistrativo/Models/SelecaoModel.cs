using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
<<<<<<< HEAD
using System.ComponentModel.DataAnnotations;
using PortalAdmnistrativo.Models.Metadata;

namespace PortalAdmnistrativo.Models
{
    public partial class Selecao
    {

=======

namespace PortalAdmnistrativo.Models
{
    public partial class SelecaoModel
    {
>>>>>>> origin/master
        public IQueryable<Selecao> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Selecao.AsQueryable<Selecao>();

<<<<<<< HEAD
            if (this.CodigoSelecao != 0)
                query = query.Where(item => item.CodigoSelecao == this.CodigoSelecao);

=======
>>>>>>> origin/master
            return query;
        }
    }
}