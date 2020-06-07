using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace LineaSupermercado.Model
{
    public class SupermarketCheckoutStatus
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Description { get; set; }

        public virtual ICollection<SupermarketCheckout> SupermarketCheckouts { get; set; }
    }
}
