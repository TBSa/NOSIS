using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LineaSupermercado.Model
{
    public class SupermarketCheckoutList
    {
        public int Id { get; set; }

        public string Description { get; set; }

        public int ClientsServed { get; set; }

        public int ClientsToAttend { get; set; }
    }
}
