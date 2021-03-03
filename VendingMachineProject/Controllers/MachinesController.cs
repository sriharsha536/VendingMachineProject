using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using VendingMachineProject.Services;
using VendingMachineProject.Services.Models;

namespace VendingMachineProject.Controllers
{
    /// <summary>
    /// This controller has actions related to Transactions
    /// </summary>
    [ApiController]
    public class MachinesController : ControllerBase
    {
        private IVendingMachineService service { get; set; }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="service">VendingMachineService</param>
        public MachinesController(IVendingMachineService service)
        {
            this.service = service;
        }

        /// <summary>
        /// Get Locations
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("locations")]
        [ProducesResponseType(typeof(List<LocationDto>), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult> GetLocations()
        {
            var locations = await service.GetLocations();
            return Ok(locations);
        }

        /// <summary>
        /// Get Machines by location
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("machines")]
        [ProducesResponseType(typeof(List<MachineDto>), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult> GetMachines(int locationId)
        {
            var items = await service.GetMachineDetailsByLocation(locationId);
            return Ok(items);
        }
    }
}