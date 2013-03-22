using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using PortalAdmnistrativo.Models.Metadata;

namespace PortalAdmnistrativo.Models
{
    [MetadataType(typeof(NoticiaMetadata))]
    public partial class Noticia
    {
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

        public bool criar()
        {
            try
            {
                Entities entity = new Entities();

                entity.PR_INSERIR_NOTICIA(this.Titulo, this.CaminhoImagem, this.Conteudo,
                    this.DataPublicacao, this.Autor, this.CodigoCategoria, this.DescricaoCategoria);

                entity.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                // TODO: adicionar tratamentos
                return false;
            }
        }

        public bool atualizar()
        {
            try
            {
                Entities entity = new Entities();

                entity.PR_EDITAR_NOTICIA(this.CodigoNoticia, this.Titulo, this.CaminhoImagem, this.Conteudo,
                    this.DataPublicacao, this.Autor, this.CodigoCategoria, this.DescricaoCategoria);

                entity.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                // TODO: adicionar tratamentos
                return false;
            }
        }

        public bool apagar()
        {
            try
            {
                Entities entity = new Entities();

                entity.PR_EXCLUIR_NOTICIA(this.CodigoNoticia);

                entity.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                // TODO: adicionar tratamentos
                return false;
            }
        }

    }
}