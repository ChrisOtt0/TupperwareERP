using Newtonsoft.Json;
using System;

namespace WebApplication1WebHook
{
	class OrderPayload
	{
        [JsonProperty("order")]
        public String order { get; set; }
    }
}