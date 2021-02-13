using Newtonsoft.Json;
using System;

namespace Hello.Service
{
    public static class HelloService
    {
        public static string GetJSON()
        {
            var greeting = new HelloModel {
                Greeting = "Hello",
                Addressee = "World"
            };
            return JsonConvert.SerializeObject(greeting);
        }

    }
}
