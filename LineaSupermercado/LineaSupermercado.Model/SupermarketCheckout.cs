using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LineaSupermercado.Model
{
    public class SupermarketCheckout
    {        
        public int Id { get; set; }

        [Required]
        [ForeignKey("SupermarketCheckoutStatus")]
        public int SupermarketCheckoutStatuId { get; set; }

        public virtual SupermarketCheckoutStatus SupermarketCheckoutStatus { get; set; }
    }
}
