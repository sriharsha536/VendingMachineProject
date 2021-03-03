using System;
using System.Collections.Generic;

#nullable disable

namespace VendingMachineProject.Models
{
    public partial class MachineItemDetail
    {
        public long MachineId { get; set; }
        public long ItemId { get; set; }
        public int? ItemCount { get; set; }

        public virtual Item Item { get; set; }
        public virtual Machine Machine { get; set; }
    }
}
