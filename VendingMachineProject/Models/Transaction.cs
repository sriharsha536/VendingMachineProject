using System;
using System.Collections.Generic;

#nullable disable

namespace VendingMachineProject.Models
{
    public partial class Transaction
    {
        public long TransactionId { get; set; }
        public long? MachineId { get; set; }
        public long? ItemId { get; set; }
        public decimal? AmountDeposited { get; set; }
        public decimal? AmountCharged { get; set; }
        public string TransactionStatus { get; set; }
        public DateTimeOffset? TransactionDate { get; set; }

        public virtual Item Item { get; set; }
        public virtual Machine Machine { get; set; }
    }
}
