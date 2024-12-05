using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iNUPCO.PO.Service.PODocumentService.PONumberGenrationStrategy
{
    public class PONumberGenrationProcessor(IPONumberGenrationStrategy pONumberGenrationStrategy)
    {
        public int ProcessGenrateNumber()
        {
            return pONumberGenrationStrategy.GenrateNumber();
        }
    }
}
