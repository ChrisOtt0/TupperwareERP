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

            try { 
                String topic = context.Request.Headers.GetValues("X-WC-Webhook-Topic").First();
                String eventType = context.Request.Headers.GetValues("x-wc-webhook-event").First();

                // This is our data loader
                dynamic dData = data;

                switch(topic.ToLower())
                {
                    case "customer.created": // currently used for frank's example 

                        // Fetch variables
                        string name = "BABY";
                        string lastName = "YODA";
                        string email = dData.email;
                        string phone = "CONFIRMED";

                        CustomerService customerService = new CustomerService();
                        customerService.InsertCustomer(name, lastName, email, phone);

                        break;

                    case "order.created":

                        // Fetch variables
                        string customer = dData.billing.email;
                        string date = "08/02/2023";
                        string status = dData.status;
                        string note = dData.customer_note;
                        int product = ((dynamic)((JArray)dData.line_items)[0]).product_id;

                        OrderService orderService = new OrderService();
                        orderService.InsertOrder(customer, date, status, note, product);

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