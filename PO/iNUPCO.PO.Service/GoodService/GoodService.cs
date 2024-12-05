using iNUPCO.PO.Data.Models;
using iNUPCO.PO.Repo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iNUPCO.PO.Service.GoodService
{
    public class GoodService
        (
            Repository<Good> goodRepository
        )
        : IGoodService
    {
        public IEnumerable<Good> GetGoods()
        {
            return goodRepository.GetAll();
        }
    }
}
