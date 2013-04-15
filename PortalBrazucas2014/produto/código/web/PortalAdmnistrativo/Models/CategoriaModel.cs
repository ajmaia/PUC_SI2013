using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class Categoria
    {
        public IQueryable<Categoria> buscar(bool? tipo = null)
        {
            Entities entity = new Entities();

            var query = entity.Categoria.Where(item => item.TipoCategoria == tipo).AsQueryable<Categoria>();

            if (this.CodigoCategoria != 0)
                query = query.Where(item => item.CodigoCategoria == this.CodigoCategoria);

            if (!String.IsNullOrEmpty(this.DescricaoCategoria))
                query = query.Where(item => item.DescricaoCategoria == this.DescricaoCategoria);

            return query;
        }
    }
}