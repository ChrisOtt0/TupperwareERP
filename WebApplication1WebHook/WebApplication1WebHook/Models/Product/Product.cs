using Newtonsoft.Json;
using System;

namespace WebApplication1WebHook
{
    class Product
    {
        [JsonProperty("name")]
        public String name { get; set; }

        [JsonProperty("description")]
        public String description { get; set; }

        [JsonProperty("price")]
        public String price { get; set; }

        [JsonProperty("cost")]
        public String cost { get; set; }

        [JsonProperty("inventory quantity")]
        public String inventoryQuantity { get; set; }

        [JsonProperty("product category")]
        public String productCategory { get; set; }
    }
}