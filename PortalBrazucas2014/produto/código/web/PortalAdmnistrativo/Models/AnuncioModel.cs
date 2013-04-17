using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace PortalAdmnistrativo.Models
{
    
    public partial class Anuncio
    {
        public string imagemUpload { get; set; }

        public string DataPublicacaoString
        {
            get
            {
                if (DataPublicacao >= DateTime.Parse("2013-01-01"))
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

        public IQueryable<Anuncio> buscar(bool admin = false)
        {
            Entities entity = new Entities();
            DateTime proxDia = this.DataPublicacao.AddDays(1);
            var query = entity.Anuncio.AsQueryable<Anuncio>();

            if (!admin)
                query = query.Where(item => item.LoginCriacao == this.LoginCriacao);

            if (this.CodigoAnuncio != 0)
                query = query.Where(item => item.CodigoAnuncio == this.CodigoAnuncio);

            if (!String.IsNullOrEmpty(this.Titulo))
                query = query.Where(item => item.Titulo == this.Titulo);

            if (this.DataPublicacao >= DateTime.Parse("2013-01-01"))
                query = query.Where(item => item.DataPublicacao >= this.DataPublicacao & item.DataPublicacao < proxDia);

            return query;
        }
    }
}