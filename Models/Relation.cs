using System;
using System.Collections.Generic;

namespace SRSinfo.Models
{
    public partial class Relation
    {
        public int Id { get; set; }
        public int OwnerId { get; set; }
        public int CarId { get; set; }

        public virtual Car Car { get; set; }
        public virtual Owner Owner { get; set; }
    }
}
