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
    
    public partial class DesempenhoSelecao
    {
        public int RankingFIFA { get; set; }
        public string Nome { get; set; }
        public string Pais { get; set; }
        public string CaminhoImagem { get; set; }
        public Nullable<int> QuantidadeJogosHistorico { get; set; }
        public Nullable<int> VitoriasHistorico { get; set; }
        public Nullable<int> EmpatesHistorico { get; set; }
        public Nullable<int> DerrotasHistorico { get; set; }
        public Nullable<int> GolsRealizadosHistorico { get; set; }
        public Nullable<int> GolsSofridosHistorico { get; set; }
    }
}
