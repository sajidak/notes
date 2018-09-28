# Controllers

## Session
`HttpContext.Session.GetString(SessionName);`

### Enable
- Step 1
```cs
public void ConfigureServices(
            IServiceCollection services)
        {
            services.AddDistributedMemoryCache();
            services.AddSession();
        }
```
- Step 2
```cs
public void Configure(
            IApplicationBuilder app,
            IHostingEnvironment env)
        {
            app.UseSession();

            app.Use(async (context, next) =>
            {
                context.Session.SetString("GreetingMessage", "Hello Session State");
                await next();
            });

            app.Run(async (context) =>
            {
                var message = context.Session.GetString("GreetingMessage");
                await context.Response.WriteAsync($"{message}");
            });
        }
```
