# MVC5 Dependency Injection

## Note:
- MVC5 Dependency Injection engines support constructor-based and property-based injection. 
- Constructor-based injection
	- Add parameters to the constructor. 
	- Those parameters will be populated automatically by the DI engine if a matching rule / object is registered.
	```cs
	public HomeController(IBranchService branchService)
	```

- Property-based injection
	- Create a property with a public setter and decorate it with the [FromService] attribute. 
	- The property will get populated during the object’s creation by the DI engine.
	```cs
	[FromServices]
	public IBranchService BranchService { get; set; }
	```

- **Unity.Mvc5** and **Unity.Mvc** are created by two different organizations and have different implementations.
    - **Unity.Mvc5** by Paul Hiles, creates a child container per web request. This works well with the built-in HierarchicalLifetimeManager.
    - **Unity.Mvc** by Microsoft, does not create a child container, but instead chose to create a new LifetimeManager called PerRequestLifetimeManager.



## Using Unity.Mvc5
`unmht://unmht/file.5/E:/_Notes/MVC5-DI+Attribute_Routing.mht/mvc-5-with-unity-for-dependency.html`
`http://sarangasl.blogspot.in/2015/04/mvc-5-with-unity-for-dependency.html`
`https://rakeshmahur.wordpress.com/2016/07/24/mvc5-dependency-injection-with-microsoft-unity/`
- Install Libraries from nuget
	- `Unity.Mvc5`
    - UnityConfig class inside App_Start folder created
	- verify in App_Start
- Create Interface and Class
	- Interface is optional (?)
- Create `RegisterComponents()` static method in your component-bootstrap class
- Call `RegisterComponents()` from Application_Start method in Global.asax
- In controller, add private property of Interface type
	- and add constructor with parameter
- [OPTIONAL] Move Unity Configuration to Separate File
	- unity.config 

## Using Unity.MVC
`http://www.c-sharpcorner.com/UploadFile/dacca2/implement-ioc-using-unity-in-mvc-5/`
`https://www.codeproject.com/Articles/1163016/Using-Unity-Framework-in-ASP-NET-MVC`

### Step 1: Create Unity container
```cs
using Microsoft.Practices.Unity;  
using Microsoft.Practices.Unity.Mvc;   
public class Bootstrapper  
{  
	public static IUnityContainer Initialise()  
	{  
		var container = BuildUnityContainer();  
		DependencyResolver.SetResolver(new UnityDependencyResolver(container));  
		return container;  
	}  
	private static IUnityContainer BuildUnityContainer()  
	{  
		var container = new UnityContainer();  

		// register all your components with the container here  
		//This is the important line to edit  
		container.RegisterType<ICompanyRepository, CompanyRepository>();   


		RegisterTypes(container);  
		return container;  
	}  
	public static void RegisterTypes(IUnityContainer container)  
	{  

	}  
}  
```
### Step 2 : Register container class
- In `Application_Start()' call `Bootstrapper.Initialise()`
```cs
public static void RegisterComponents()
{
      var container = new UnityContainer();
      container.RegisterType<icustomerservice, customerservice="">();
      container.RegisterType<iaccountservice, accountservice="">();
      container.RegisterType<ifundtransferservice, fundtransferservice="">();
      DependencyResolver.SetResolver(new UnityDependencyResolver(container));
}
```

### Step 3 : Create Model
```cs
    public class Company  
    {  
        public int Id { get; set; }  
        public string Name { get; set; }  
        public string Category { get; set; }  
    }  
```
### Step 4 : Create Interface
```cs
    public interface ICompanyRepository  
    {  
       IEnumerable<Company> GetAll();  
       Company Get(int id);  
       Company Add(Company item);  
       bool Update(Company item);  
       bool Delete(int id);  
    }  
```
### Step 5 : Implement interface
```cs
    public class CompanyRepository : ICompanyRepository  
    {  
        private List<Company> products = new List<Company>();  
        private int _nextId = 1;  
  
        public CompanyRepository()  
        {  
            // Add products for the Demonstration  
            Add(new Company { Name = "TIMKEN Eng", Category = "Engenering"});  
            Add(new Company { Name = "Wipro", Category = "software"});  
            Add(new Company { Name = "HSBC", Category = "Bank"});  
        }  
  
        public IEnumerable<Company> GetAll()  
        {  
            // TO DO : Code to get the list of all the records in database  
            return products;  
        }  
        public Company Get(int id)  
        {  
            // TO DO : Code to find a record in database  
            return products.Find(p => p.Id == id);  
        }  
        public Company Add(Company item)  
        {  
            if (item == null)  
            {  
                throw new ArgumentNullException("item");  
            }  
  
            // TO DO : Code to save record into database  
            item.Id = _nextId++;  
            products.Add(item);  
            return item;  
        }  
        public bool Update(Company item)  
        {  
            if (item == null)  
            {  
                throw new ArgumentNullException("item");  
            }  
  
            // TO DO : Code to update record into database  
            int index = products.FindIndex(p => p.Id == item.Id);  
            if (index == -1)  
            {  
                return false;  
            }  
            products.RemoveAt(index);  
            products.Add(item);  
            return true;  
        }  
        public bool Delete(int id)  
        {  
            // TO DO : Code to remove the records from database  
            products.RemoveAll(p => p.Id == id);  
            return true;  
        }  
    }   
```
### Step 6 : Add controller class to the application 
```cs
    public class CompanyController : Controller  
    {  
        readonly ICompanyRepository repo;  
        public CompanyController(ICompanyRepository tempProduct)  
        {  
            this.repo = tempProduct;  
        }  
        public string Index()  
        {  
            var data = repo.GetAll();  
            return JsonConvert.SerializeObject(data);  
        }  
    }  
```

### RegisterType method
The registration controls how you will retrieve objects from the container. It is the type that you will specify when you call the Resolve or ResolveAll method to retrieve the concrete object instance.
- Interface or Class Mapping to a Concrete Type
```cs
myContainer.RegisterType<IMyService, CustomerService>();
myContainer.RegisterType<MyServiceBase, DataService>();
```
- Named Type
```cs
myContainer.RegisterType(typeof(MyEmailService), "MyBestEmail");
```
- Type Mappings with the Container
    - Mapping types is useful for retrieving instances of different objects that implement the same specified interface or that inherit from the same specified base class. The target type for the mapping must inherit from or implement the base type or interface of the source.
```cs
// Register a named type mapping
myContainer.RegisterType<IMyObject, MyRealObject>("MyMapping");
// Following code will return a new instance of MyRealObject
myContainer.Resolve<IMyObject>("MyMapping");
```
- Using a Lifetime Manager with the RegisterType Method
```cs
myContainer.RegisterType<IMyService, CustomerService>(new ContainerControlledLifetimeManager());
myContainer.RegisterType<CustomerService>(new ContainerControlledLifetimeManager());

```

### Lifetime Managers
- TransientLifetimeManager
    - For this lifetime manager Unity creates and returns a new instance of the requested type for each call to the Resolve or ResolveAll method. 
    - This lifetime manager is used by default for all types registered using the RegisterType, method unless you specify a different lifetime manager
- ContainerControlledLifetimeManager 
    - registers an existing object as a singleton instance.
    - Unity returns the same instance of the registered type or object each time you call the Resolve or ResolveAll method or when the dependency mechanism injects instances into other classes.
- HierarchicalLifetimeManager
    - Unity returns the same instance of the registered type or object each time you call the Resolve or ResolveAll method or when the dependency mechanism injects instances into other classes. The distinction is that when there are child containers, each child resolves its own instance of the object and does not share one with the parent.
- PerResolveLifetimeManager
    - like a TransientLifetimeManager, but also provides a signal to the default build plan, marking the type so that instances are reused across the build-up object graph.
- PerThreadLifetimeManager
    - Unity returns, on a per-thread basis, the same instance of the registered type or object each time you call the Resolve or ResolveAll method or when the dependency mechanism injects instances into other classes. This lifetime manager effectively implements a singleton behavior for objects on a per-thread basis. PerThreadLifetimeManager returns different objects from the container for each thread.
- ExternallyControlledLifetimeManager
    - The ExternallyControlledLifetimeManager class provides generic support for externally managed lifetimes.

Using the **RegisterInstance** method to register an existing object results in the same behavior as if you just registered the lifetime container with RegisterType. Therefore, it is recommended that you do not use the RegisterInstance method to register an existing object when using the non-default lifetime managers except for the thread in which the RegisterInstance was invoked.




***



## Builtin infrastructure (Preferred)
`http://dotnetliberty.com/index.php/2015/10/15/asp-net-5-mvc6-dependency-injection-in-6-steps/`
- Can register a concrete implementation or bind an implementation to an interface. 
- This can be done by either specifying both types as generic or pass them as type parameters.

- In Controller
```cs
    private readonly FooService _fooService;
     public FooController(FooService fooService)
    {
        _fooService = fooService;
    }
```
- In ConfigureServices method of Startup.cs
```cs
public void ConfigureServices(IServiceCollection services)
{
    // ...
    services.AddTransient<FooService>();
    services.AddTransient<BarService>();
    services.AddTransient<BazService>();
}
```
### Steps
#### Interface to the Service
```cs
namespace DependencyDemo.Services
{
    public interface IGreetingService
    {
        string GetGreeting();
    }
}
```
#### Service
```cs
namespace DependencyDemo.Services
{
    public class GreetingService : IGreetingService
    {
        public string GetGreeting()
        {
            return "Hello " + GetHashCode();
        }
    }
}
```
#### Use service in controller constructor
```cs
        private IGreetingService _greetingService;
        private IGreetingService _secondService;
 
        public GreetingController(IGreetingService greetingService, IGreetingService secondService)
        {
            _greetingService = greetingService;
            _secondService = secondService;
        }
```
#### Register service in startup configuration
	- In ConfigureServices method of Startup.cs
```cs
services.AddInstance<IGreetingService>(new GreetingService());
```

## Service Types
### AddSingleton
- A new instance of that class is being created for every dependency injection. 
- 
- `services.AddSingleton<IGreetingService, GreetingService>();`
- Rather than providing a specific instance to the services collection, we just supply the implementation type as a second type parameter. 
- This tells ASP.NET to create one and only one instance of IGreetingService, and 
- any components wanting an IGreetingService will use the same shared instance.

### AddTransient
- Only one instance of that class is being created across the entire application and that instance is being used during the dependency injection.
- 
- services.AddTransient<IGreetingService, GreetingService>();
- each time somebody asks for an IGreetingService, they will get a brand new instance of GreetingService

### AddScoped
- A new instance of that class is being created for every request. If multiple components are requesting an instance of that class from the dependency injection engine during a single request, all of them will receive the same instance.
- 
- `services.AddScoped<IGreetingService, GreetingService>();`
- for the lifetime of a single web request, the same instance will be returned to that request.
- Individual requests have their own dependencies that are alive for the duration of that request.



## Links
	- http://dotnetliberty.com/index.php/2015/10/15/asp-net-5-mvc6-dependency-injection-in-6-steps/
	- http://www.c-sharpcorner.com/UploadFile/eec362/dependency-injection-in-mvc/
	- https://msdn.microsoft.com/en-us/library/dn507457(v=pandp.30).aspx
	- TODO
	- http://www.toplinestrategies.com/blogs/application-development/dependency-injection-mvc-5
	- http://www.c-sharpcorner.com/UploadFile/dacca2/implement-ioc-using-unity-in-mvc-5/
	- https://www.codeproject.com/Articles/1163016/Using-Unity-Framework-in-ASP-NET-MVC


