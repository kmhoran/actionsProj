using Hello.Service;
using System;
using Xunit;

namespace Hello.Test
{
    public class UnitTest1
    {
        [Fact]
        public void JSON_Matches_Hard_Code()
        {
            string greetingJSON = HelloService.GetJSON();
            Assert.Equal("{\"Greeting\":\"Hello\",\"Addressee\":\"World\"}", greetingJSON);
        }
    }
}
