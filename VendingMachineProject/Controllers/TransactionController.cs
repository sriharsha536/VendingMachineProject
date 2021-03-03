using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using VendingMachineProject.Services;
using VendingMachineProject.Services.Models;

namespace VendingMachineProject.Controllers
{
    /// <summary>
    /// This controller has actions related to Transactions
    /// </summary>
    [ApiController]
    public class TransactionController : ControllerBase
    {
        private IVendingMachineService service { get; set; }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="service">VendingMachineService</param>
        public TransactionController(IVendingMachineService service)
        {
            this.service = service;
        }

        /// <summary>
        /// This method will let the user to complete a transaction.
        /// </summary>
        /// <param name="transactionDto"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("complete")]
        [ProducesResponseType(typeof(DispenseDto), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult> CompleteTransaction([FromBody] TransactionDto transactionDto)
        {
            var transaction = await service.CompleteTransaction(transactionDto);
            return Ok(transaction);
        }
    }
}