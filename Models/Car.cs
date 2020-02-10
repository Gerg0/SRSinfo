using System;
using System.Collections.Generic;

namespace SRSinfo.Models
{
    public partial class Car
    {
        public Car()
        {
            Relation = new HashSet<Relation>();
        }

        public int Id { get; set; }
        public string Manufacturer { get; set; }
        public string Type { get; set; }
        public string LicensePlateNum { get; set; }
        public DateTime? ProductionDate { get; set; }

        public virtual ICollection<Relation> Relation { get; set; }
    }
}
