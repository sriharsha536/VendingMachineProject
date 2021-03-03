using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace VendingMachineProject.Services.Models
{
    public class TransactionDto
    {
        public long TransactionId { get; set; }

        public long MachineId { get; set; }

        public long ItemId { get; set; }

        public decimal TotalAmount { get; set; }

        public  TransactionStatus TransactionStatus { get; set; }
    }

    public enum TransactionStatus
    {
        Incomplete,
        Canceled,
        Complete
    }
}
