using iNUPCO.PO.DTOs.DTOs;
using iNUPCO.PO.DTOs.Global;
using iNUPCO.PO.Service.GoodService;
using iNUPCO.PO.Service.PODocumentService;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace iNUPCO.PO.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class PODocumentsController(IPOService poService) : ControllerBase
    {
        /// <summary>
        /// Return All PODocuments
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> Get(PagginationDTO pagginationDTO)
        {
            var podocuments = poService.GetPOs(pagginationDTO);
            return Ok(new ResponseSchema(IsSuccess: true, Data: podocuments, StatusCode: 200));
        }

        /// <summary>
        /// Return All PODocuments
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> AddPo(PODocumentDTO poDocument)
        {
            poService.InsertPO(poDocument);
            return Ok(new ResponseSchema(IsSuccess: true,StatusCode: 200));
        }
    }
}
