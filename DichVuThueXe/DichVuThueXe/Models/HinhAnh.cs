//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DichVuThueXe.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class HinhAnh
    {
        public int id { get; set; }
        public string URL { get; set; }
        public string MaXe { get; set; }
    
        public virtual Xe Xe { get; set; }
    }
}