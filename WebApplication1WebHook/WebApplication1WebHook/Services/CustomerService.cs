using System;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using System.Threading.Tasks;
using WebApplication1WebHook.Services;

namespace WebApplication1WebHook
{
    public class CustomerService
    {
        public async Task InsertCustomer(
            String pname, 
            String plastName, 
            String pemail, 
            String pphone)

        {
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", TokenService.dynToken);

            var parameter = new Customer { 
                name = pname, 
                lastName = plastName, 
                mail = pemail, 
                phone = pphone 
            };
            String jsonData = JsonConvert.SerializeObject(parameter);

            var payload = new CustomerPayload { customer = jsonData };
            var payloadJSON = JsonConvert.SerializeObject(payload);

            var inputData = new StringContent(jsonData, Encoding.Unicode, "application/json");

            System.Diagnostics.Debug.WriteLine("json: " + await inputData.ReadAsStringAsync());

            // UPDATE THIS
            HttpResponseMessage response = await client.PostAsync("http://test:7048/BC/ODataV4/CustomerManagement_InsertCustomer?company=CRONUS%20Danmark%20A%2FS", inputData);

            string data = "";

            if (response.IsSuccessStatusCode)
            {
                data = await response.Content.ReadAsStringAsync();
                System.Diagnostics.Debug.WriteLine("Success: " + data);
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("Error: " + response.ReasonPhrase);
            }
        }
    }
}
