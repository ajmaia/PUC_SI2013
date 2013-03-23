using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PortalAdmnistrativo.Models.Metadata;

namespace PortalAdmnistrativo.Models
{
    [MetadataType(typeof(CategoriaMetadata))]
    public partial class Categoria_
    {

        public IQueryable<Categoria> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Categoria.AsQueryable<Categoria>();

            if (this.CodigoCategoria != 0)
                query = query.Where(item => item.CodigoCategoria == this.CodigoCategoria);

            if (!String.IsNullOrEmpty(this.DescricaoCategoria))
                query = query.Where(item => item.DescricaoCategoria == this.DescricaoCategoria);

            return query;
        }
    }
}