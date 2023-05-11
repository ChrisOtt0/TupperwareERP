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
            String psurname,
            String pemail,
            String pphone)

        {
            var _token = $"admin:Password";
            var _tokenBase64 = System.Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(_token));

            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", _tokenBase64);

            var parameter = new Customer
            {
                name = pname,
                surname = psurname,
                email = pemail,
                phone = pphone
            };

            String jsonData = JsonConvert.SerializeObject(parameter);

            var inputData = new StringContent(jsonData, Encoding.Unicode, "application/json");

            System.Diagnostics.Debug.WriteLine("json: " + await inputData.ReadAsStringAsync());

            HttpResponseMessage response = await client.PostAsync("http://172.21.62.1:7048/BC/ODataV4/CustomerManagement_InsertCustomer?company=CRONUS%20Danmark%20A%2FS", inputData);

            string data = "";

            if (response.IsSuccessStatusCode)
            {
                data = await response.Content.ReadAsStringAsync();

                System.Diagnostics.Debug.WriteLine("Result: " + data);
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("Error: " + response.ReasonPhrase);
            }
        }
    }
}