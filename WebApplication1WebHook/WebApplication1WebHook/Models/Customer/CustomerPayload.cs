using Newtonsoft.Json;
using System;

namespace WebApplication1WebHook
{
	class CustomerPayload
	{
        [JsonProperty("customer")]
        public String customer { get; set; }
    }
}