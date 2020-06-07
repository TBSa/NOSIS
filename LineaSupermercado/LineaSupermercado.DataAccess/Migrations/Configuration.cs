using LineaSupermercado.Model;

namespace LineaSupermercado.DataAccess.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<LineaSupermercado.DataAccess.LineaSupermercadoDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(LineaSupermercado.DataAccess.LineaSupermercadoDbContext context)
        {
            context.ClientStatus.AddOrUpdate(
                new ClientStatus { Description = "Atendido" },
                new ClientStatus { Description = "Por atender" });

            context.SupermarketCheckoutStatuses.AddOrUpdate(
                new SupermarketCheckoutStatus { Description = "Abierta" },
                new SupermarketCheckoutStatus { Description = "Cerrada" });
        }
    }
}
