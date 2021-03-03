using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace VendingMachineProject.Services.Models
{
    public class LocationDto
    {
        public int LocationId { get; set; }
        public string LocationName { get; set; }
        public string Zip { get; set; }
    }
}
