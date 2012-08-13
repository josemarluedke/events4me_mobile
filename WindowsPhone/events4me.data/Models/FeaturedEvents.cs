using System;

namespace events4me.data.Models
{
    public class FeaturedEvents
    {
        public int event_id { get; set; }
        public DateTime initial_date { get; set; }
        public DateTime end_date { get; set; }
        public int priority { get; set; }
    }
}
