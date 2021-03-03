using System;
using System.Collections.Generic;

#nullable disable

namespace VendingMachineProject.Models
{
    public partial class Machine
    {
        public Machine()
        {
            MachineItemDetails = new HashSet<MachineItemDetail>();
            Transactions = new HashSet<Transaction>();
        }

        public long MachineId { get; set; }
        public int? LocationId { get; set; }
        public string MachineName { get; set; }
        public long? Capacity { get; set; }

        public virtual Location Location { get; set; }
        public virtual ICollection<MachineItemDetail> MachineItemDetails { get; set; }
        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}
