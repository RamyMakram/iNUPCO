﻿using iNUPCO.PO.DTOs.Global;
using iNUPCO.PO.Service.GoodService;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace iNUPCO.PO.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GoodsController(IGoodService goodService) : ControllerBase
    {
        /// <summary>
        /// Return All Goods to Create PO
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> GetGoods()
        {
            var Goods = goodService.GetGoods();
            return Ok(new ResponseSchema(IsSuccess: true, Data: Goods, StatusCode: 200));
        }
    }
}
