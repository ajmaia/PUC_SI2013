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
    using System.ComponentModel.DataAnnotations;

    [MetadataType(typeof(JogoMetadata))]
    public partial class Jogo
    {
        public Jogo()
        {
            this.PalpiteJogo = new HashSet<PalpiteJogo>();
        }
    
        public int CodigoJogo { get; set; }
        public int CodigoCidade { get; set; }
        public string NomeCidade { get; set; }
        public string LocalVendaIngresso { get; set; }
        public int Rodada { get; set; }
        public int CodigoSelecaoA { get; set; }
        public string NomeSelecaoA { get; set; }
        public Nullable<int> GolsSelecaoA { get; set; }
        public int CodigoSelecaoB { get; set; }
        public string NomeSelecaoB { get; set; }
        public Nullable<int> GolsSelecaoB { get; set; }
        public System.DateTime DataHora { get; set; }
        public string CaminhoImagem { get; set; }
    
        public virtual Cidade Cidade { get; set; }
        public virtual Selecao Selecao { get; set; }
        public virtual Selecao Selecao1 { get; set; }
        public virtual ICollection<PalpiteJogo> PalpiteJogo { get; set; }
    }
}
