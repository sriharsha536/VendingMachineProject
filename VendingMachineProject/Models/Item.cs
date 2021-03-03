using System;
using System.Collections.Generic;

#nullable disable

namespace VendingMachineProject.Models
{
    public partial class Item
    {
        public Item()
        {
            MachineItemDetails = new HashSet<MachineItemDetail>();
            Transactions = new HashSet<Transaction>();
        }

        public long ItemId { get; set; }
        public string ItemName { get; set; }
        public decimal Price { get; set; }
        public string Url { get; set; }

        public virtual ICollection<MachineItemDetail> MachineItemDetails { get; set; }
        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
