using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalAdmnistrativo.Models
{
    public partial class Comentario
    {
        public string DataCriacaoString
        {
            get
            {
                if (DataCriacao >= DateTime.Parse("2013-01-01"))
                    return DataCriacao.ToLongDateString();
                else
                    return string.Empty;
            }
            set
            {
                if (value != null)
                    DataCriacao = DateTime.Parse(value);
            }
        }

        public IQueryable<Comentario> buscar(bool somenteAprovados = false)
        {
            Entities entity = new Entities();

            var query = entity.Comentario.AsQueryable<Comentario>();

            if (this.CodigoComentario != 0)
                query = query.Where(item => item.CodigoComentario == this.CodigoComentario);

            if (!String.IsNullOrEmpty(this.LoginCriacao))
                query = query.Where(item => item.LoginCriacao == this.LoginCriacao);

            if (this.CodigoNoticia != 0)
                query = query.Where(item => item.CodigoNoticia == this.CodigoNoticia);

            if (somenteAprovados)
                query = query.Where(item => item.StatusAprovacao == "1");
            return query;
        }
    }
}