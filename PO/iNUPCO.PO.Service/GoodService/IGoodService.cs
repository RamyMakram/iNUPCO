using iNUPCO.PO.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iNUPCO.PO.Service.GoodService
{
    public interface IGoodService
    {
        IEnumerable<Good> GetGoods();
    }
}
