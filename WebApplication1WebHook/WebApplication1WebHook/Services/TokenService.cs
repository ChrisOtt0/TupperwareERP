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
                "ck_2fa6d8b5517c39e24ac1d3f5b1915f780d6ccebb:cs_16fb811c727f694583684f85cb0f0281bf0195bb"));

        public static string dynToken = System.Convert.ToBase64String(
            System.Text.Encoding.UTF8.GetBytes(
                "admin:Password"));
    }
}