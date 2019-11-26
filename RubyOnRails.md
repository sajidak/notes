# Ruby on Rails

## Notes
- What is `resources :`
	- used to declare a standard REST resource.
	- A resource is the term used for a collection of similar objects
	- , such as articles, people or animals. You can create, read, update and destroy items 
	- for a resource and these operations are referred to as CRUD operations.
	- Rails provides a resources method which can be used to declare a standard REST resource.

- When a form is submitted, the fields of the form are sent to Rails as parameters.
- See https://guides.rubyonrails.org/getting_started.html
- See https://guides.rubyonrails.org/command_line.html
	- A **scaffold** in Rails is a full set of model, database migration for that model, controller to manipulate it, views to view and manipulate the data, and a test suite for each of the above.
	- Inside the **rails console** you have access to the app and helper instances.
	- rails dbconsole
	- rails runner
	- rails destroy - opposite of generate. It'll figure out what generate did, and undo it.
- https://www.mayankmishra.me/hooking-up-a-rails-app-with-an-existing-mysql-database/
	```rb
	# Try, from console
	connection = ActiveRecord::Base.establish_connection(adapter: 'mysql2', database: '', host: '', username: '', password: '')
	ActiveRecord::Base.connection.tables
	results = ActiveRecord::Base.connection.execute('select * from table-name')

	# alternate method
	require 'mysql2'
	client = Mysql2::Client.new(host: "", username: "", password: "", database: "")
	results = client.query("SELECT * FROM table-name")
	results.each{|r| puts r}
	$data = results.first
	```
- https://www.netguru.com/codestories/database-views-and-how-to-use-them-in-a-ror-based-app
- **scaffold_controller** will generate controller and views for a model. **controller** will create only a controller

## Initializaion
- TBD

## New App
```
rails new app-name
```



## Generate Controller
```
rails generate controller Welcome index
```
- Will generate
	- Controller
	- Action
	- View
- Configure routes in `config/routes.rb`


## Generate Views
TBD

## Scaffold from DB
- https://codeburst.io/how-to-build-a-rails-app-on-top-of-an-existing-database-baa3fe6384a0
- dump the schema (structure) of your database
	```rb
	rake db:schema:dump
	## will generate db/schema.rb

	# create an empty migration file
	rails generate migration create_database_structure
	## Move the contents of db/schema.rb into the up method of this first migration.

	```
- gem 'yaml_db' to generate data seed migrations
	- `rake db:data:dump` will create db/data.yml file containing your data

- Manually
	- http://www.tutorialspoint.com/ruby-on-rails/rails-scaffolding.htm
	- As you have already tables in db then no need of scaffold or generate model command, as it will generate migration file too.
	- Create user.rb file under models folder.
		```rb
		class User < ActiveRecord::Base
		end
		```
	- Test if its working: Open rails console and type
		- `User.all # should list all existing users on the console`
	- create controller and views
		- `rails g controller users`
	- OR/IF to create new model and CRUD then
		- `rails g scaffold ModelName field_name:data_type field2_name:data_type`
		- will generate model, controller with CRUD methods, migration file and views

## Models
- Generate
	`rails generate model Comment commenter:string body:text article:references`
- Associating Models
- https://guides.rubyonrails.org/association_basics.html
	```rb
	# 1
	class Comment < ApplicationRecord
	  belongs_to :article
	end

	# 2
	class Article < ApplicationRecord
	  has_many :comments
	  validates :title, presence: true,
	                    length: { minimum: 5 }
	end
	```

## Additional Notes
### Params
- consider an example URL: http://www.example.com/?username=dhh&email=dhh@email.com.
	- In this URL,
	- `params[:username]` would equal "dhh" and
	- `params[:email]` would equal "dhh@email.com".
### a
- use `render` instead of `redirect_to` when save returns false.
	- The render method is used so that the `@article` object is passed back to the new template when it is rendered.
	- This rendering is done within the same request as the form submission,
	- whereas the redirect_to will tell the browser to issue another request.
- It is not necessary to pass all the attributes to update.
	- For example, if `@article.update(title: 'A new title')` was called,
	- Rails would only update the title attribute, leaving all other attributes untouched.
