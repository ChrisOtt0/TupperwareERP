using System;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using System.Threading.Tasks;

namespace WebApplication1WebHook
{
    public class ProductService
    {
        public async Task InsertProduct(
            String pname,
            String pdescription,
            String pprice,
            String pcost,
            String pinventoryQuantity,
            String pproductCateogry)
        {
            //l/p
            var _token = $"admin:Password";
            var _tokenBase64 = System.Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(_token));

            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", _tokenBase64);

            var parameter = new Product
            {
                name = pname,
                description = pdescription,
                price = pprice,
                cost = pcost,
                inventoryQuantity = pinventoryQuantity,
                productCategory = pproductCateogry
            };

            String jsonData = JsonConvert.SerializeObject(parameter);

            var payload = new ProductPayload { product = jsonData };
            var payloadJSON = JsonConvert.SerializeObject(payload);

            var inputData = new StringContent(payloadJSON, Encoding.Unicode, "application/json");

            System.Diagnostics.Debug.WriteLine("json: " + await inputData.ReadAsStringAsync());

            // UPDATE THIS
            HttpResponseMessage response = await client.PostAsync("http://test:7048/BC/ODataV4/WooService_AddNewConsultant?company=CRONUS%20Danmark%20A%2FS", inputData);

            string data = "";

            if (response.IsSuccessStatusCode)
            {
                data = await response.Content.ReadAsStringAsync();
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("Error: " + response.ReasonPhrase);
            }
        }

        public async Task UpdateStock()
        {
            // TO DO 
        }
    }
}
