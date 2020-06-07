using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LineaSupermercado.Model
{
    public class Clients
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [Required]
        [ForeignKey("ClientStatus")]
        public int ClientStatusId { get; set; }

        [Required]
        [ForeignKey("SupermarketCheckouts")]
        public int SupermarketCheckoutId { get; set; }

        public virtual ClientStatus ClientStatus { get; set; }

        [Required]
        public virtual SupermarketCheckout SupermarketCheckouts { get; set; }
    }
}
