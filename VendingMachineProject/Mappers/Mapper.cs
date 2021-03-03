namespace VendingMachineProject.Mappers
{
    using System;
    using AutoMapper;
    using VendingMachineProject.Models;
    using VendingMachineProject.Services.Models;

    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<Item, ItemDto>()
                .ForMember(dest => dest.Amount, src => src.MapFrom(s => s.Price))
                .ForMember(dest => dest.ItemUrl, src => src.MapFrom(s => s.Url))
                .ForMember(dest => dest.ItemId, src => src.MapFrom(s => s.ItemId))
                .ForMember(dest => dest.ItemName, src => src.MapFrom(s => s.ItemName));

            CreateMap<Location, LocationDto>()
                .ForMember(dest => dest.Zip, src => src.MapFrom(s => s.LocationAddressZip));

            CreateMap<Machine, MachineDto>()
                .ForMember(dest => dest.MachineId, src => src.MapFrom(s=>s.MachineId))
                .ForMember(dest => dest.MachineName, src => src.MapFrom(s=>s.MachineName));

            CreateMap<Transaction, TransactionDto>()
                .ForMember(dest=> dest.TransactionId, src => src.MapFrom(s=>s.TransactionId))
                .ForMember(dest=> dest.TotalAmount, src => src.MapFrom(s=>s.AmountDeposited))
                .ForMember(dest=> dest.TransactionStatus, src => src.MapFrom(s => s.TransactionStatus));

            CreateMap<Transaction, DispenseDto>()
                .ForMember(dest => dest.TransactionId, src => src.MapFrom(s => s.TransactionId))
                .ForMember(dest => dest.DispensedAmount, src => src.MapFrom(s => (s.AmountDeposited - s.AmountCharged)))
                .ForMember(dest => dest.TransactionStatus, src => src.MapFrom(s => s.TransactionStatus));
        }
    }
}