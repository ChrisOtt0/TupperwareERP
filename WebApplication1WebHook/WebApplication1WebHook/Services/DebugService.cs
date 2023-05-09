using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace WebApplication1WebHook.Services
{
    public static class DebugService
    {
        private static string filepath = "C:\\Users\\sophu\\hooktest.txt";
        public static void Log(JObject data)
        {
            if (File.Exists(filepath))
            {
                File.Delete(filepath);
            }

            using (var fs = File.Create(filepath))
            {
                AddText(fs, data.ToString());
            }
        }

        private static void AddText(FileStream fs, string text)
        {
            byte[] info = Encoding.UTF8.GetBytes(text);
            fs.Write(info, 0, info.Length);
        }
    }
}