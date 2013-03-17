using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PortalAdmnistrativo.Models.Metadata;

namespace PortalAdmnistrativo.Models
{
    [MetadataType(typeof(AnuncioMetadata))]
    public partial class Anuncio
    {

        public IQueryable<Anuncio> buscar()
        {

            Entities entity = new Entities();
            var query = entity.Anuncio.AsQueryable<Anuncio>();

            if (this.CodigoAnuncio != 0)
                query = query.Where(item => item.CodigoAnuncio == this.CodigoAnuncio);

            if (!String.IsNullOrEmpty(this.Titulo))
                query = query.Where(item => item.Titulo == this.Titulo);

            if (this.DataPublicacao != null)
                query = query.Where(item => item.DataPublicacao == this.DataPublicacao);

            return query;
        }
    }
}