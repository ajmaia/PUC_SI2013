using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PortalAdmnistrativo.Models.Metadata;

namespace PortalAdmnistrativo.Models
{
    public partial class Comentario
    {

        public IQueryable<Comentario> buscar()
        {
            Entities entity = new Entities();

            var query = entity.Comentario.AsQueryable<Comentario>();

            if (this.CodigoComentario != 0)
                query = query.Where(item => item.CodigoComentario == this.CodigoComentario);

            if (!String.IsNullOrEmpty(this.LoginCriacao))
                query = query.Where(item => item.LoginCriacao == this.LoginCriacao);

            if (this.CodigoNoticia != 0)
                query = query.Where(item => item.CodigoNoticia == this.CodigoNoticia);

            if (this.DataCriacao != null)
                query = query.Where(item => item.DataCriacao == this.DataCriacao);

            return query;
        }
    }
}