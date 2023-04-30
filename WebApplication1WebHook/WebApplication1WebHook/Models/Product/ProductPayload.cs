using Newtonsoft.Json;
using System;

namespace WebApplication1WebHook
{
	class ProductPayload
	{
        [JsonProperty("product")]
        public String product { get; set; }
    }
}