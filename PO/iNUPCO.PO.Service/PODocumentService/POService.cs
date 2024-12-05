using iNUPCO.PO.Data.Models;
using iNUPCO.PO.DTOs.Global;
using iNUPCO.PO.Repo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iNUPCO.PO.Service.PODocumentService
{
    public class POService
        (
            IRepository<Podocument> poRepository

        )
        : IPOService
    {
        public IEnumerable<Podocument> GetPOs(PagginationDTO pagginationDTO)
        {
            return poRepository.GetAll_Pagging(q => true, pagginationDTO, out int _, new string[] { "PodocumentItems.GoodCodeNavigation" });
        }

        public Podocument GetPO(long PoNumber)
        {
            return poRepository.Get(q => q.PoNumber == PoNumber, new string[] { "PodocumentItems.GoodCodeNavigation" });
        }

        public void InsertPO(Podocument PO)
        {
            //PO.PoTotalAmount = PO.PodocumentItems;
            if (PO == null)
                throw new ArgumentNullException("PO Is Null");

            if (PO.PodocumentItems.Count == 0)
                throw new ArgumentNullException("PO Items Is Null");

            PO.PoDate = DateTime.Now;

            PO.PoNumber = new PONumberGenrationStrategy.PONumberGenrationProcessor(
                                    new PONumberGenrationStrategy.PONumberGenrationV1()
                                )
                                .ProcessGenrateNumber();

            poRepository.Insert(PO);
            poRepository.SaveChanges();
        }
    }
}
