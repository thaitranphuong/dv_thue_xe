using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DichVuThueXe.Models
{
    public class CartItem
    {
        public DichVu productOrder { get; set; }
        public int Quantity { get; set; }

        
    }
}