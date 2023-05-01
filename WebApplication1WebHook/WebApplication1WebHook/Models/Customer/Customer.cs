using Newtonsoft.Json;
using System;

namespace WebApplication1WebHook
{
    class Customer
    {
        [JsonProperty("name")]
        public String name { get; set; }

        [JsonProperty("last Name")]
        public String lastName { get; set; }

        [JsonProperty("mail")]
        public String mail { get; set; }

        [JsonProperty("phone")]
        public String phone { get; set; }
    }
}