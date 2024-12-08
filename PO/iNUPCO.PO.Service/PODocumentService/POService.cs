using iNUPCO.PO.Data.Models;
using iNUPCO.PO.DTOs.DTOs;
using iNUPCO.PO.DTOs.Global;
using iNUPCO.PO.Repo;
using Mapster;
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
        public IEnumerable<PODocumentDTO> GetPOs(PagginationDTO pagginationDTO)
        {
            return poRepository.GetAll_Pagging(q => true, pagginationDTO, out int _, new string[] { "PodocumentItems.GoodCodeNavigation" }).Adapt<List<PODocumentDTO>>();
        }

        public PODocumentDTO GetPO(long PoNumber)
        {
            return poRepository.Get(q => q.PoNumber == PoNumber, new string[] { "PodocumentItems.GoodCodeNavigation" }).Adapt<PODocumentDTO>();
        }

        public void InsertPO(PODocumentDTO _PODTO)
        {
            //PO.PoTotalAmount = PO.PodocumentItems;
            var PO = _PODTO.Adapt<Podocument>();

            if (PO == null)
                throw new ArgumentNullException("PO Is Null");

            if (PO.PodocumentItems.Count == 0)
                throw new ArgumentNullException("PO Items Is Null");
            if (PO.PodocumentItems.GroupBy(q => q.GoodCode).Any(q => q.Count() > 1))
                throw new InvalidOperationException("Good Cannot Duplicated");

            PO.PoDate = DateTime.Now;

            PO.PoNumber = new PONumberGenrationStrategy.PONumberGenrationProcessor(
                                    new PONumberGenrationStrategy.PONumberGenrationV1()
                                )
                                .ProcessGenrateNumber();

            poRepository.Insert(PO);
            poRepository.SaveChanges();
        }
        public void ChangeState(int PoNumber)
        {
            var poDoc = poRepository.Get(q => q.PoNumber == PoNumber, new string[] { "PodocumentItems.GoodCodeNavigation" });
            
            if (poDoc == null)
                throw new ArgumentNullException();
            
            poDoc.PoState = 1;
            poRepository.Update(poDoc);
            poRepository.SaveChanges();

        }

    }
}
