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
    
    public partial class Historia
    {
        public Historia()
        {
            this.Selecao = new HashSet<Selecao>();
        }
    
        public int CodigoHistoria { get; set; }
        public string HistoriaSelecao { get; set; }
        public string Pais { get; set; }
        public string HistoriaPais { get; set; }
        public string CaminhoImagem { get; set; }
        public int RankingFIFA { get; set; }
        public string TitulosConquistados { get; set; }
    
        public virtual ICollection<Selecao> Selecao { get; set; }
    }
}
