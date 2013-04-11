using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc.Html;

namespace PortalAdmnistrativo.Models
{
    public partial class Noticia
    {

        public HttpPostedFileBase Imagem;

        public string DataPublicacaoString
        {
            get
            {
                if(DataPublicacao >= DateTime.Parse("2013-01-01"))
                    return DataPublicacao.ToShortDateString();
                else
                    return string.Empty;
            }
            set
            {
                if (value != null)
                    DataPublicacao = DateTime.Parse(value);
            }
        }

        public IQueryable<Noticia> buscar()
        {
            Entities entity = new Entities();
            DateTime proxDia = this.DataPublicacao.AddDays(1);

            var query = entity.Noticia.AsQueryable<Noticia>();

            if (this.CodigoNoticia != 0)
                query = query.Where(item => item.CodigoNoticia == this.CodigoNoticia);

            if (!String.IsNullOrEmpty(this.Titulo))
                query = query.Where(item => item.Titulo == this.Titulo);

            if (this.CodigoCategoria != 0)
                query = query.Where(item => item.CodigoCategoria == this.CodigoCategoria);

            if (this.DataPublicacao >= DateTime.Parse("2013-01-01"))
                query = query.Where(item => item.DataPublicacao >= this.DataPublicacao & item.DataPublicacao < proxDia);

            return query;
        }
    }
}