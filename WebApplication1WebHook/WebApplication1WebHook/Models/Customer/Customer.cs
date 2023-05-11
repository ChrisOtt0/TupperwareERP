using Newtonsoft.Json;
using System;

namespace WebApplication1WebHook
{
    class Customer
    {
        [JsonProperty("name")]
        public String name { get; set; }

        [JsonProperty("surname")]
        public String surname { get; set; }

        [JsonProperty("email")]
        public String email { get; set; }

        [JsonProperty("phone")]
        public String phone { get; set; }
    }
}