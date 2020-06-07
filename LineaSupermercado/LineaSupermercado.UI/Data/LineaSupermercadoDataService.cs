using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using LineaSupermercado.DataAccess;
using LineaSupermercado.Model;

namespace LineaSupermercado.UI.Data
{
    public class LineaSupermercadoDataService : ILineaSupermercadoDataService
    {
        private Func<LineaSupermercadoDbContext> _context;

        public LineaSupermercadoDataService(Func<LineaSupermercadoDbContext> contextCreator)
        {
            _context = contextCreator;
        }

        public IEnumerable<SupermarketCheckoutList> GetAll()
        {
            using (var ctx = _context())
            {
                var lects = ctx.Database.SqlQuery<SupermarketCheckoutList>("GetAllSupermarketCheckouts").ToList();

                return lects;
            }
        }

        public void AddSupermarketChekout()
        {
            using (var ctx = _context())
            {
                ctx.SupermarketCheckout.Add(new SupermarketCheckout { SupermarketCheckoutStatuId = 1 });
                ctx.SaveChanges();
            }
        }

        public void CloseSupermarketCheckout(int id)
        {
            using (var ctx = _context())
            {
                ctx.Database.ExecuteSqlCommand("CloseSupermarketCheckout @Id", new SqlParameter("@Id", id));
            }
        }

        public void AddClient()
        {
            using (var ctx = _context())
            {
                ctx.Database.ExecuteSqlCommand("AddClient");
            }
        }

        public void ServeClient(int id)
        {
            using (var ctx = _context())
            {
                ctx.Database.ExecuteSqlCommand("ServeClient @Id", new SqlParameter("@Id", id));
            }
        }
    }
}
