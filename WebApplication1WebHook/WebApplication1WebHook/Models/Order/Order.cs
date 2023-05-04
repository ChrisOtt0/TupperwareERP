using Newtonsoft.Json;
using System;

namespace WebApplication1WebHook
{
    class Order
    {
        [JsonProperty("customer")]
        public String customer { get; set; }

        [JsonProperty("date")]
        public String date { get; set; }

        [JsonProperty("status")]
        public String status { get; set; }

        [JsonProperty("shipping")]
        public String shipping { get; set; }

        [JsonProperty("note")]
        public String note { get; set; }

        [JsonProperty("product")]
        public String product { get; set; }
    }
}