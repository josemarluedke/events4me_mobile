using System;

namespace events4me.data.Models
{
    public class User
    {
        public int _id { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public string token { get; set; }
        public bool push_enabled { get; set; }
        public DateTime birthdate { get; set; }
        public string image { get; set; }
    }
}
