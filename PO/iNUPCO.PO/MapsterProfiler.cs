using iNUPCO.PO.Data.Models;
using iNUPCO.PO.DTOs.DTOs;
using Mapster;

namespace iNUPCO.PO
{
    public class MapsterProfiler
    {
        public MapsterProfiler()
        {
            TypeAdapterConfig<Good, GoodDTO>
                .NewConfig()
                .Map(dest => dest.Name, src => src.GoodName)
                .Map(dest => dest.Code, src => src.GoodCode)
                .TwoWays();

            TypeAdapterConfig<PodocumentItem, PODocumentItemDTO>
                .NewConfig()
                .Map(dest => dest.Good, src => src.GoodCodeNavigation)
                .Map(dest => dest.PurchasedGoodPrice, src => src.PurchasedGoodPrice)
                .Map(dest => dest.SerialNumber, src => src.SerialNumber)
                .TwoWays();

            TypeAdapterConfig<Podocument, PODocumentDTO>
                .NewConfig()
                .Map(dest => dest.Amount, src => src.PoTotalAmount)
                .Map(dest => dest.Date, src => src.PoDate)
                .Map(dest => dest.IsHolded, src => src.PoIsHolded)
                .Map(dest => dest.Number, src => src.PoNumber)
                .Map(dest => dest.POItems, src => src.PodocumentItems)
                .Map(dest => dest.State, src => src.PoState)
                .TwoWays();

        }

    }
}
