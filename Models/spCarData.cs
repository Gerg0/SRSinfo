using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SRSinfo.Models
{
    public class spCarData
    {
        public int Id { get; set; }
        public string Manufacturer { get; set; }
        public string Type { get; set; }
        public string LicensePlateNum { get; set; }
        public DateTime? ProductionDate { get; set; }
    }
}
