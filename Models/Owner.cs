using System;
using System.Collections.Generic;

namespace SRSinfo.Models
{
    public partial class Owner
    {
        public Owner()
        {
            Relation = new HashSet<Relation>();
        }

        public int Id { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public DateTime? BirthDate { get; set; }

        public virtual ICollection<Relation> Relation { get; set; }
    }
}
