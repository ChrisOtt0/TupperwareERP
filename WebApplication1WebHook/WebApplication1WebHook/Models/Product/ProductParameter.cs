using Newtonsoft.Json;
using System;

namespace WebApplication1WebHook
{
	class ProductParameter
	{
        public String name { get; set; }

        public String description { get; set; }

        public String price { get; set; }

        public String cost { get; set; }

        public String inventoryQuantity { get; set; }

        public String productCategory { get; set; }
    }
}