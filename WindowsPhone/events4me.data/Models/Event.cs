using System.Collections.Generic;
using System;

namespace events4me.data.Models
{
    public class Event
    {
        public int _id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public int min_age { get; set; }
        public string image { get; set; }
        public int place_id { get; set; }
        public TimeSpan duration { get; set; }
        public bool visible { get; set; }

        public Place place { get; set; }
        public List<Session> sessions { get; set; }
    }
}
