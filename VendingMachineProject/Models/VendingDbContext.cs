using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace VendingMachineProject.Models
{
    public partial class VendingDbContext : DbContext
    {
        public VendingDbContext()
        {
        }

        public VendingDbContext(DbContextOptions<VendingDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Item> Items { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<Machine> Machines { get; set; }
        public virtual DbSet<MachineItemDetail> MachineItemDetails { get; set; }
        public virtual DbSet<Transaction> Transactions { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=vendingserver.database.windows.net;Database=VendingDb;User Id=sriharsha536;Password=Avatar@3d;Trusted_Connection=false;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Item>(entity =>
            {
                entity.Property(e => e.ItemName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Url).IsRequired();
            });

            modelBuilder.Entity<Location>(entity =>
            {
                entity.ToTable("Location");

                entity.Property(e => e.LocationAddressZip)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.LocationName).HasMaxLength(50);
            });

            modelBuilder.Entity<Machine>(entity =>
            {
                entity.ToTable("Machine");

                entity.Property(e => e.Capacity).HasDefaultValueSql("((100))");

                entity.Property(e => e.MachineName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.Location)
                    .WithMany(p => p.Machines)
                    .HasForeignKey(d => d.LocationId)
                    .HasConstraintName("FK_Machine_Location");
            });

            modelBuilder.Entity<MachineItemDetail>(entity =>
            {
                entity.HasKey(e => new { e.MachineId, e.ItemId })
                    .HasName("PK__MachineI__E3C9B300FBAA0465");

                entity.HasOne(d => d.Item)
                    .WithMany(p => p.MachineItemDetails)
                    .HasForeignKey(d => d.ItemId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MachineItemDetails_ItemsTable");

                entity.HasOne(d => d.Machine)
                    .WithMany(p => p.MachineItemDetails)
                    .HasForeignKey(d => d.MachineId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MachineItemDetails_MachineTable");
            });

            modelBuilder.Entity<Transaction>(entity =>
            {
                entity.Property(e => e.AmountCharged)
                    .HasColumnType("decimal(18, 2)")
                    .HasDefaultValueSql("((0.00))");

                entity.Property(e => e.AmountDeposited)
                    .HasColumnType("decimal(18, 2)")
                    .HasDefaultValueSql("((0.00))");

                entity.Property(e => e.TransactionStatus)
                    .HasMaxLength(50)
                    .HasDefaultValueSql("('INCOMPLETE')");

                entity.HasOne(d => d.Item)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.ItemId)
                    .HasConstraintName("FK_Transactions_Items");

                entity.HasOne(d => d.Machine)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.MachineId)
                    .HasConstraintName("FK_Transactions_Machine");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
