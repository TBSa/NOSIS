﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LineaSupermercado.Model
{
    public class ClientStatus
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Description { get; set; }

        public virtual ICollection<Clients> Clients { get; set; }
    }
}
