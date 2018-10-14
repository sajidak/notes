# ASP.Net Core 2.0 - Restart Site Programatically

## See also
- https://blog.todotnet.com/2017/07/publishing-and-running-your-asp-net-core-project-on-linux/

## Shutdown
- https://www.blakepell.com/asp-net-core-ability-to-restart-your-site-programatically-updated-for-2-0
	```cs
	using System;
	using System.Collections.Generic;
	using System.IO;
	using System.Linq;
	using System.Text;
	using System.Threading.Tasks;
	using Microsoft.AspNetCore.Hosting;
	using Microsoft.AspNetCore.Mvc;

	namespace MySite.Controllers
	{
	    public class WebServicesController : Controller
	    {
	        private IApplicationLifetime ApplicationLifetime { get; set; }

	        public WebServicesController(IApplicationLifetime appLifetime)
	        {
	            ApplicationLifetime = appLifetime;
	        }

	        public async Task ShutdownSite()
	        {
	            // Later bro
	            ApplicationLifetime.StopApplication();
	            return "Ok";
	        }

	    }
	}
	```
