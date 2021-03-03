using System.Collections.Generic;
using System.Threading.Tasks;
using VendingMachineProject.Services.Models;

namespace VendingMachineProject.Services
{
    /// <summary>
    /// This is a vending machine service that has all functionalities to manage a vendor machine
    /// </summary>
    public interface IVendingMachineService
    {
        /// <summary>
        /// This method will display list of items, their price and the quantity in-stock
        /// </summary>
        /// <returns>List of Items</returns>
        Task<List<ItemDto>> DisplayItems(int machineId);

        // /// <summary>
        // /// This method cancels an incomplete transaction
        // /// </summary>
        // /// <returns></returns>
        // Task<bool> CancelTransaction(int transactionId);

        // /// <summary>
        // /// This method allows the user to deposit denominations of US curreny: nickel, dime, quarter and dollar bill
        // /// </summary>
        // /// <param name="transactionDto"></param>
        // /// <returns></returns>
        // Task<TransactionDto> DepositCurrency(TransactionDto transactionDto);

        /// <summary>
        /// This method will let the user to purchase an item
        /// </summary>
        /// <returns>true or false</returns>
        Task<DispenseDto> CompleteTransaction(TransactionDto transactionDto);

        /// <summary>
        /// Gets all locations
        /// </summary>
        /// <returns>List of locations</returns>
        Task<List<LocationDto>> GetLocations();

        /// <summary>
        /// Machine Details based on location id
        /// </summary>
        /// <param name="locationId"></param>
        /// <returns>list of machines</returns>
        Task<List<MachineDto>> GetMachineDetailsByLocation(int locationId);
    }
}