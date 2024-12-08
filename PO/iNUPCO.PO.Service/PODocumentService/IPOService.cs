using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using iNUPCO.PO.Data.Models;
using iNUPCO.PO.DTOs.DTOs;
using iNUPCO.PO.DTOs.Global;

namespace iNUPCO.PO.Service.PODocumentService
{
    public interface IPOService
    {
        IEnumerable<PODocumentDTO> GetPOs(PagginationDTO pagginationDTO);
        PODocumentDTO GetPO(long id);
        void InsertPO(PODocumentDTO PO);
    }
}
