using iNUPCO.PO.DTOs.Global;
using iNUPCO.PO.Service.GoodService;
using iNUPCO.PO.Service.PODocumentService;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace iNUPCO.PO.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PODocumentsController(IPOService poService) : ControllerBase
    {
        /// <summary>
        /// Return All PODocuments
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Get(PagginationDTO pagginationDTO)
        {
            var podocuments = poService.GetPOs(pagginationDTO);
            return Ok(new ResponseSchema(IsSuccess: true, Data: podocuments, StatusCode: 200));
        }
    }
}
