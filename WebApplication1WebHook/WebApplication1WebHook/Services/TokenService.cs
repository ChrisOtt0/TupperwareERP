using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace WebApplication1WebHook.Services
{
    public static class TokenService
    {
        // Comment or uncomment as necessary
        public static string wootToken = System.Convert.ToBase64String(
            System.Text.Encoding.UTF8.GetBytes(
                "ck_b7e5d613bbc0177f5ae40bbe79e536d0a965dc78:cs_517e7163762fd8063ecc8efaedda6b0c84ddbba8"));

        public static string dynToken = System.Convert.ToBase64String(
            System.Text.Encoding.UTF8.GetBytes(
                "admin:admin"));
    }
}