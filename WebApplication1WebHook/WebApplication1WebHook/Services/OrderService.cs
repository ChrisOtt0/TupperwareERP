using System;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using System.Threading.Tasks;
using WebApplication1WebHook.Services;

namespace WebApplication1WebHook
{
    public class OrderService
    {
        public async Task InsertOrder(
            String pcustomer, 
            String pdate,
            String pstatus,
            String pshipping,
            String pnote,
            String pproduct)

        {
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", TokenService.dynToken);

            var parameter = new Order { 
                customer = pcustomer,
                date = pdate,
                status = pstatus,
                shipping = pshipping,
                note = pnote,
                product = pproduct
            };

            String jsonData = JsonConvert.SerializeObject(parameter);

            var payload = new OrderPayload { order = jsonData };
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
    }
}
