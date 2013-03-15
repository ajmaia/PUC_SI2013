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
    
    public partial class Selecao
    {
        public Selecao()
        {
            this.Jogo = new HashSet<Jogo>();
            this.Jogo1 = new HashSet<Jogo>();
        }
    
        public int CodigoSelecao { get; set; }
        public string Nome { get; set; }
        public string Pais { get; set; }
        public string CaminhoImagem { get; set; }
        public int CodigoGrupo { get; set; }
        public string DescricaoGrupo { get; set; }
        public int RankingFIFA { get; set; }
        public Nullable<int> QuantidadeJogos { get; set; }
        public Nullable<int> Vitorias { get; set; }
        public Nullable<int> Empates { get; set; }
        public Nullable<int> Derrotas { get; set; }
        public Nullable<int> GolsRealizados { get; set; }
        public Nullable<int> GolsSofridos { get; set; }
        public int CodigoHistoria { get; set; }
    
        public virtual Grupo Grupo { get; set; }
        public virtual Historia Historia { get; set; }
        public virtual ICollection<Jogo> Jogo { get; set; }
        public virtual ICollection<Jogo> Jogo1 { get; set; }
    }
}
