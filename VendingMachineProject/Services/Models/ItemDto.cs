namespace VendingMachineProject.Services.Models
{
    public class ItemDto
    {
        public long ItemId { get; set; }
        public long MachineId { get; set; }
        public string ItemName { get; set; }

        public int? Count { get; set; }

        public string ItemUrl { get; set; }

        public decimal Amount { get; set; }
    }
}
