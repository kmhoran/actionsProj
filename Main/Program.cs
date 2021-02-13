using Hello.Service;
using System;

namespace Main
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(HelloService.GetJSON());
        }
    }
}
