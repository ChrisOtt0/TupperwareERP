using Newtonsoft.Json;
using System;

namespace WebApplication1WebHook
{
    class Order
    {
        [JsonProperty("customer")]
        public String customer { get; set; }

        [JsonProperty("orderDate")]
        public String orderDate { get; set; }

        [JsonProperty("orderStatus")]
        public String orderStatus { get; set; }

        [JsonProperty("orderNotes")]
        public String orderNotes { get; set; }

        [JsonProperty("product")]
        public int product { get; set; }
    }
}