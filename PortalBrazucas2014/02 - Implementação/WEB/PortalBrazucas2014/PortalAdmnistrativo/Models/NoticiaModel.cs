using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PortalAdmnistrativo.Models
{
    public partial class Noticia
    {
        public IQueryable<Noticia> buscar()
        {

            Entities entity = new Entities();
            var query = entity.Noticia.AsQueryable<Noticia>();

            if (this.CodigoNoticia != 0)
                query = query.Where(item => item.CodigoNoticia == this.CodigoNoticia);

            if (!String.IsNullOrEmpty(this.Titulo))
                query = query.Where(item => item.Titulo == this.Titulo);

            if (!String.IsNullOrEmpty(this.Categoria))
                query = query.Where(item => item.Categoria == this.Categoria);

            if (this.DataPublicacao != null)
                query = query.Where(item => item.DataPublicacao == this.DataPublicacao);

            return query;
        }
    }
}