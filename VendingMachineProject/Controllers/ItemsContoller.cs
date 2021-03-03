using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using VendingMachineProject.Services;
using VendingMachineProject.Services.Models;

namespace VendingMachineProject.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [ApiController]
    public class ItemsController : ControllerBase
    {
        private IVendingMachineService service { get; set; }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="service"></param>
        public ItemsController(IVendingMachineService service)
        {
            this.service = service;
        }

        /// <summary>
        /// Get items by Machine id
        /// </summary>
        /// <param name="machineId"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("items")]
        [ProducesResponseType(typeof(List<ItemDto>), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult> GetItemsByMachine(int machineId)
        {
            if (machineId == default)
                throw new Exception("Please enter a valid machineId");

            var items = await service.DisplayItems(machineId);
            return Ok(items);
        }
    }
}