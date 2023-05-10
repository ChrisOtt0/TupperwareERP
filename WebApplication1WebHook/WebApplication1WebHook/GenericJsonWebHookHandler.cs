using Microsoft.AspNet.WebHooks;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using WebApplication1WebHook.Services;

namespace WebApplication1WebHook
{

    /**
     * This class is the bread and butter. 
     * It catches the the calls from dynamics and decides which webservice to call. 
     */
    public class GenericJsonWebHookHandler : WebHookHandler
    {
        public GenericJsonWebHookHandler()
        {
            this.Receiver = "genericjson";
        }

        public override Task ExecuteAsync( string receiver, WebHookHandlerContext context)
        {
            // Get JSON from WebHook
            JObject data = context.GetDataOrDefault<JObject>();
            System.Diagnostics.Debug.WriteLine(data);
            DebugService.Log(data);

            try { 
                String topic = context.Request.Headers.GetValues("X-WC-Webhook-Topic").First();
                String eventType = context.Request.Headers.GetValues("x-wc-webhook-event").First();

                // This is our data loader
                dynamic dData = data;

                switch(topic.ToLower())
                {
                    case "customer.created": // currently used for frank's example 

                        // Fetch variables
                        string name = dData.first_name;
                        string lastName = dData.last_name;
                        string email = dData.email;
                        string phone = dData.billing.phone;

                        CustomerService customerService = new CustomerService();
                        customerService.InsertCustomer(name, lastName, email, phone);

                        break;

                    case "product.created":

                        ProductService productService = new ProductService();
                        //productService.InsertProduct(name, email);

                        break;

                    case "order.created":

                        // Fetch variables
                        string customer = dData.billing.email;
                        string date = dData.date_created;
                        string status = dData.status;
                        string note = dData.customer_note;
                        int product = ((dynamic)((JArray)dData.line_items)[0]).id;

                        OrderService orderService = new OrderService();
                        orderService.InsertOrder(customer, date, status, note, product);

                        break;

                    case "stock.changed": // i've no idea if that's the real name 
                        break;

                }
            }
            catch (Exception ex) 
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex);
            }

            return Task.FromResult(HttpStatusCode.OK);
        }
    }
}