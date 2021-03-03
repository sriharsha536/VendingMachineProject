using System.Collections.Generic;
using System.Threading.Tasks;
using VendingMachineProject.Models;
using VendingMachineProject.Services.Models;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using AutoMapper;
using System;

namespace VendingMachineProject.Services
{
    /// <inheritdoc/>
    public class VendingMachineService : IVendingMachineService
    {
        private VendingDbContext dbContext { get; set; }
        private IMapper mapper { get; set; }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        /// <param name="autoMapper"></param>
        public VendingMachineService(VendingDbContext context, IMapper autoMapper)
        {
            dbContext = context;
            mapper = autoMapper;
        }

        /// <inheritdoc/>
        public async Task<List<LocationDto>> GetLocations()
        {
            var locations = await dbContext.Locations.ToListAsync();
            return mapper.Map<List<LocationDto>>(locations);
        }

        /// <inheritdoc/>
        public async Task<List<MachineDto>> GetMachineDetailsByLocation(int locationId)
        {
            var machineDetails = await dbContext.Machines
                                        .Where(m => m.LocationId == locationId)
                                        .ToListAsync();
            return mapper.Map<List<MachineDto>>(machineDetails);
        }

        /// <inheritdoc/>
        public async Task<List<ItemDto>> DisplayItems(int machineId)
        {
            var items = await (from i in dbContext.Items
                               join m in dbContext.MachineItemDetails
                               on i.ItemId equals m.ItemId
                               where m.MachineId == machineId
                               select new ItemDto
                               {
                                   ItemId = i.ItemId,
                                   MachineId = m.MachineId,
                                   ItemName = i.ItemName,
                                   Count = m.ItemCount,
                                   ItemUrl = i.Url,
                                   Amount = i.Price
                               }).ToListAsync();
            return mapper.Map<List<ItemDto>>(items);
        }

        // /// <inheritdoc/>
        // public async Task<TransactionDto> DepositCurrency(TransactionDto transactionDto)
        // {
        //     Transaction transaction = null;
        //     if (transactionDto.TransactionId == default)
        //     {
        //         transaction = new Transaction()
        //         {
        //             TransactionDate = DateTime.Today,
        //             AmountDeposited = transactionDto.TotalAmount
        //         };
        //         dbContext.Transactions.Add(transaction);
        //         dbContext.SaveChanges();
        //     }
        //     else
        //     {
        //         transaction = await dbContext.Transactions.FindAsync(transactionDto.TransactionId);
        //         if (transaction == null)
        //         {
        //             throw new Exception($"Invalid Transaction Id {transactionDto.TransactionId}");
        //         }
        //         transaction.AmountDeposited = transaction.AmountDeposited + transactionDto.TotalAmount;
        //         dbContext.SaveChanges();
        //     }

        //     return mapper.Map<TransactionDto>(transaction);
        // }

        // /// <inheritdoc/>
        // public async Task<bool> CancelTransaction(int transactionId)
        // {
        //     var transaction = await dbContext.Transactions.FindAsync(Convert.ToInt64(transactionId));

        //     if (transaction == null)
        //     {
        //         throw new Exception($"Invalid Transaction Id {transactionId}");
        //     }

        //     if (transaction.TransactionStatus.ToLower() != TransactionStatus.Incomplete.ToString().ToLower())
        //     {
        //         throw new Exception($"Invalid Transaction Id {transactionId}. Transaction already {transaction.TransactionStatus}");
        //     }

        //     dbContext.Remove(transaction);

        //     return dbContext.SaveChanges() > 0;
        // }

        /// <inheritdoc/>
        public async Task<DispenseDto> CompleteTransaction(TransactionDto transactionDto)
        {
            //Get item Price and calculate dispensed Amount
            var item = await dbContext.Items.FindAsync(transactionDto.ItemId);

            //Validate item
            if (item == null)
            {
                return new DispenseDto
                {
                    MachineId = transactionDto.MachineId,
                    TransactionStatus = TransactionStatus.Canceled.ToString()
                };
            }

            //Update transaction with all details needed
            var transaction = new Transaction
            {
                MachineId = transactionDto.MachineId,
                ItemId = transactionDto.ItemId,
                AmountDeposited = transactionDto.TotalAmount,
                AmountCharged = item.Price,
                TransactionDate = DateTime.Today,
                TransactionStatus = TransactionStatus.Complete.ToString()
            };

            //Get Machine Item Detail & Update the item count
            var machineItemDetail = await dbContext.MachineItemDetails.FirstAsync(i => i.MachineId == transactionDto.MachineId && i.ItemId == transactionDto.ItemId);
            machineItemDetail.ItemCount--;

            //Add the new transaction
            dbContext.Add(transaction);

            //Update the MachineItemDetail
            dbContext.Update(machineItemDetail);

            dbContext.SaveChanges();

            return mapper.Map<DispenseDto>(transaction);
        }
    }
}