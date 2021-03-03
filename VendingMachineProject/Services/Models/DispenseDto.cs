using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace VendingMachineProject.Services.Models
{
    /// <summary>
    /// This is the response returned on completing a transaction
    /// </summary>
    public class DispenseDto
    {
        public long TransactionId { get; set; }
        public long MachineId {get;set;}
        public decimal DispensedAmount { get; set; }
        public string TransactionStatus { get; set; }
    }
}
