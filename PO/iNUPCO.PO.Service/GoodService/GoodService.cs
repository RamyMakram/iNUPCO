using iNUPCO.PO.Data.Models;
using iNUPCO.PO.DTOs.DTOs;
using iNUPCO.PO.Repo;
using Mapster;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iNUPCO.PO.Service.GoodService
{
    public class GoodService
        (
            IRepository<Good> goodRepository
        )
        : IGoodService
    {
        public IEnumerable<GoodDTO> GetGoods()
        {
            return goodRepository.GetAll().Adapt<List<GoodDTO>>();
        }
    }
}
