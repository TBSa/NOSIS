using System.Data.Entity;
using LineaSupermercado.Model;


namespace LineaSupermercado.DataAccess
{
    public class LineaSupermercadoDbContext : DbContext
    {
        public LineaSupermercadoDbContext() :base("LineaSupermercadoDb")
        {

        }

        public DbSet<SupermarketCheckout> SupermarketCheckout { get; set; }
        public DbSet<Clients> Clients { get; set; }
        public DbSet<ClientStatus> ClientStatus { get; set; }
        public DbSet<SupermarketCheckoutStatus> SupermarketCheckoutStatuses { get; set; }
    }
}
