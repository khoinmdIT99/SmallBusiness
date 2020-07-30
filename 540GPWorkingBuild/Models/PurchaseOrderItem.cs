//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel.DataAnnotations.Schema;

namespace _540GPWorkingBuild.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PurchaseOrderItem
    {
        public int POItemID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public int Received { get; set; }
        public int PurchaseOrderID { get; set; }
        [NotMapped]
        public double totalPrice { get; set; }
        [NotMapped]
        public int qtyReturned { get { return Quantity - Received; } }


        public virtual Inventory Inventory { get; set; }
        public virtual PurchaseOrder PurchaseOrder { get; set; }
    }
}
