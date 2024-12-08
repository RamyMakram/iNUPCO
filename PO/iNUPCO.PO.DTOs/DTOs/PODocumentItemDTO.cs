using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iNUPCO.PO.DTOs.DTOs
{
    public record PODocumentItemDTO(GoodDTO Good,int GoodCode,int SerialNumber,decimal PurchasedGoodPrice);
}
