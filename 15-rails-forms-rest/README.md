# Rails Forms and REST

Now that you've learned about the auto-magic that is Rails, we'll get granular in creating forms and RESTful routes. Let's put this magic to work! 

## SWBATs 
- Review the basics of Rails
- Discuss and review forms
- Learn about the `form_for`, `form_tag`, `link_to`, `button_tag`, `submit_tag` methods
- Implement strong params

---

### Intro to Rails Review

Ruby on Rails was created in 2003 by David Heinemeier Hansson to extend the functionality of Ruby by offering an easy-to-use, automated MVC web application framework that feels as natural as the Ruby language. 


#### Why Rails? Why in THE WORLD did we learn Sinatra before Rails? 

Everything that you will learn in this experience builds on itself. Four weeks ago, you learned the basics of Ruby that has carried you along a knowledge path. That path has since expanded, and through working on the 'hard stuff first', we've shared different ways to understand and work with Ruby, including associations, domain problem exploration, libraries, and frameworks. 

After learning about ActiveRecord and how it serves to help in talking to a database in your app, it makes sense to move forward into a framework that builds on knowledge of Ruby libraries and gems to get you closer to writing logic with less configuration. Sinatra is a lightweight framework that, for learning purposes, serves as a way to become acclimated to libraries that automate processes before in some way, like we learned with ActiveRecord over SQL. 

Unlike Sinatra, which requires a lot of manual configuration to get started building your app, Rails automates the set-up process for us so that we can jump into app logic with respect to the "Convention Over Configuration" principle and overall developer happiness. When you have an idea for an app, Rails allows you to jump in using industry-standards for MVC architecture and build something amazing.

#### The Levels of Auto-Magic

As we've seen in our intro, Rails has a number of different levels of auto-magic that you can employ to get to a cleanly-written web app with minimal effort. Here's some of those levels: 

##### Lvl 1: Command Line Basics

These are tasks that you'll do throughout your experience with Rails.

Find the definitions to each by calling `rails --help`, and [view more here](https://guides.rubyonrails.org/command_line.html).

- `rails console` (rails c) - starts your console
- `rails server` (rails s) - starts a Puma server
- `rails test` (rails t) - starts testing framework (minitest, unit testing)

- `rails db:migrate` - same as rake, performs migration
- `rails db:create` - same as rake, creates database
- `rails routes` - lists all defined routes
- `rails dbconsole` - figures out which database you're using and drops you into whichever command line interface you would use with it
- `rails new` [app_name] - downloads new instance of Rails w/dependencies and files


##### Lvl 2: Generate Commands

These are tasks that you need to perform to start up an app. Rails uses templates to create a whole lot of things. Running `rails generate` by itself gives a list of available generators. 

The ones you'll probably use most often are: 

- `rails generate` / `rails g`: 
    - model
    - controller
    - resource 
    - scaffold 

- `rails g resource`

Generating a resource does everything generating a model does, but it also creates a resource in the `routes.rb` file and an empty folder in the views. 

Write `rails g resource` like this: 

```rb
rails generate resource student name:string school:belongs_to
```

At this level, you can decide how much you would like Rails to automate in your app per model/resource instead of... 


##### Lvl 3: Scaffolding Commands

...all the things! A scaffold in Rails is a full set- its a model, the database migration for that model, the controller to manipulate it, the views to view and manipulate the data, and a test suite for each of the above.

At this level, there's no room to not understand what's being included in your app. Like purchasing a new computer, there's a lot of 'bloatware' that `rails g scaffold` comes with under the hood that, if you're unfamiliar, will be TROUBLE to debug. 

It allows you to get to logic quickly, but comes with some payoffs that you'll have to decide are worthy when building your app.

---

### Strong Params
Instance variables are only made accessible to the outside world (we say “it is exposed”) if we add attribute accessors to the class.

In the same way classes sometimes want to keep certain methods private: methods that aren’t supposed to be called from outside of the object can be kept private as well. 

The keyword private tells Ruby that all methods defined from now on, are supposed to be private. They can be called from within the object (from other methods that the class defines), but not from outside.

---

### Helpful Form Definitions 

Rails forms follow very specific conventions. While learning about forms with Rails, here's a few definitions/commands that we'll go over: 

`form_with`: main form helper that creates a form tag which, when submitted, will POST to the current page

```rb
<%= form_with do %>
  Form contents
<% end %>
```

`form_tag`: allows us to automatically generate HTML form code and integrate data to both auto fill the values as well as have the form submit data that the controller can use to either create or update a record in the database.

```rb
<%= form_tag post_path(@post), method: "put" do %>
  <label>Post title:</label>
  <br>
  <%= text_field_tag :title, @post.title %>
  <br>
  <label>Post description</label>
  <br>
  <%= text_area_tag :description, @post.description %>
  <br>
  <%= submit_tag "Submit Post" %>
<% end %>
```

`form-for`: used when your form is directly connected to a model, it accepts the instance of the model as an argument and knows the standard route (it follows RESTful conventions).

```rb
<%= form_for(@post) do |f| %>
  <label>Post title:</label><br>
  <%= f.text_field :title %><br>
 
  <label>Post description</label><br>
  <%= f.text_area :description %><br>
 
  <%= f.submit %>
<% end %>
```

`link_to`: the Rails way of <a href="/">Links</a>, where a path method is used to move from page to page.

```rb
<a href="<%= book_path(@book) %>">Improve Your Ruby Skills</a>
```

`button_tag`: creates a button element that defines a submit button, reset button or a generic button to be used.

```rb
button_tag
# => <button name="button" type="submit">Button</button>
```

`submit_tag`: Creates a submit button with the text value as the caption.

```rb
submit_tag
# => <input name="commit" data-disable-with="Save changes" type="submit" value="Save changes" />
```

---

### Forms Cheatsheet
Here's a generic type of form: 

#### General Search Form 
```rb
<%= form_with url: "/search", method: :get do |form| %>
  <%= form.label :q, "Search for:" %>
  <%= form.text_field :q %>
  <%= form.submit "Search" %>
<% end %>
```

Generates: 

```rb

<form accept-charset="UTF-8" action="/search" data-remote="true" method="get">
  <label for="q">Search for:</label>
  <input id="q" name="q" type="text" />
  <input name="commit" type="submit" value="Search" data-disable-with="Search" />
</form>
```
And here are some helpers you might use: 

```rb
<%= text_area_tag(:message, "Hi, nice site", size: "24x6") %>
<%= password_field_tag(:password) %>
<%= hidden_field_tag(:parent_id, "5") %>
<%= search_field(:user, :name) %>
<%= telephone_field(:user, :phone) %>
<%= date_field(:user, :born_on) %>
<%= datetime_local_field(:user, :graduation_day) %>
<%= month_field(:user, :birthday_month) %>
<%= week_field(:user, :birthday_week) %>
<%= url_field(:user, :homepage) %>
<%= email_field(:user, :address) %>
<%= color_field(:user, :favorite_color) %>
<%= time_field(:task, :started_at) %>
<%= number_field(:product, :price, in: 1.0..20.0, step: 0.5) %>
<%= range_field(:product, :discount, in: 1..100) %>
```

Generates: 

```rb

<textarea id="message" name="message" cols="24" rows="6">Hi, nice site</textarea>
<input id="password" name="password" type="password" />
<input id="parent_id" name="parent_id" type="hidden" value="5" />
<input id="user_name" name="user[name]" type="search" />
<input id="user_phone" name="user[phone]" type="tel" />
<input id="user_born_on" name="user[born_on]" type="date" />
<input id="user_graduation_day" name="user[graduation_day]" type="datetime-local" />
<input id="user_birthday_month" name="user[birthday_month]" type="month" />
<input id="user_birthday_week" name="user[birthday_week]" type="week" />
<input id="user_homepage" name="user[homepage]" type="url" />
<input id="user_address" name="user[address]" type="email" />
<input id="user_favorite_color" name="user[favorite_color]" type="color" value="#000000" />
<input id="task_started_at" name="task[started_at]" type="time" />
<input id="product_price" max="20.0" min="1.0" name="product[price]" step="0.5" type="number" />
<input id="product_discount" max="100" min="1" name="product[discount]" type="range" />
```

---

### How should I start my process?

In respect to convention over configuration, here's a good way to start thinking about building a Rails app: 

- come up with an idea for an app with two models and write out user stories
- use generate commands to build out one model at a time and associated routes 
- write out the route logic and create associated views 
- add some seed data
- start a server and see those views in action- test, test, test
- refactor and make your controller DRY
- move to the next model, rinse and repeat








