using System;
using System.Collections.Generic;

#nullable disable

namespace VendingMachineProject.Models
{
    public partial class Location
    {
        public Location()
        {
            Machines = new HashSet<Machine>();
        }

        public int LocationId { get; set; }
        public string LocationName { get; set; }
        public string LocationAddressZip { get; set; }

        public virtual ICollection<Machine> Machines { get; set; }
    }
}
