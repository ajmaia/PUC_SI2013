//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PortalAdmnistrativo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Categoria
    {
        public Categoria()
        {
            this.Anuncios = new HashSet<Anuncio>();
            this.Noticias = new HashSet<Noticia>();
        }
    
        public int CodigoCategoria { get; set; }
        public string DescricaoCategoria { get; set; }
    
        public virtual ICollection<Anuncio> Anuncios { get; set; }
        public virtual ICollection<Noticia> Noticias { get; set; }
    }
}
