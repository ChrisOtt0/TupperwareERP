using Newtonsoft.Json;
using System;

namespace WebApplication1WebHook
{
    class Order
    {
        [JsonProperty("name")]
        public String name { get; set; }

        [JsonProperty("mail")]
        public String mail { get; set; }
    }
}