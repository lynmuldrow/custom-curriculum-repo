# Hashketball Review
Welcome to Flatiron School! As promised, we're going to review the concepts behind Hashketball and understand how to access data using array methods. 

## SWBATs (Students will be able to)

- Distinguish between data types in Ruby
- Show how to look up documentation for data types in Ruby
- Demonstrate the use of common Array methods
  * `.each`
  * `.map`
  * `.select`
  * `.find`
- Differentiate array methods by their respective return values
- Define the Single Responsibility Principle
- Employ test-driven development best practices in their labs
  * `rspec --fail-fast` handle one error at a time
  * Red, Green, Refactor
  * Make it work (shameless green), make it right, make it fast

---

## Data Types Review
Data is all around us, and comes in many different forms. What are some different types of data that we have at our disposal? Let's learn more about how to use data to inform, find, and create.

### Common Data Types
Here are some of the common data types (defines as 'things' that represent data) you'll encounter while programming in Ruby: 

#### Symbols 
Symbols are a form of data that you'll see and work with lots in Ruby. Symbols are similar to strings, but are bits of code used as unique identifiers (like a bar code) that stays static (immutable) to represent values (where strings create new instances of an object). 

Here's the difference between a string...
```rb
> "a string".object_id
=> 70358630335100
> "a string".object_id
=> 70358640625960
> "a string".object_id
=> 70358644379620
```

...and a symbol.
```rb
> :a_symbol.object_id
=> 1086748
> :a_symbol.object_id
=> 1086748
> :a_symbol.object_id
=> 1086748
```

A symbol is created by putting a colon in front of a word, and can be used to represent all kinds of data or code. Multiple word symbols are concatenated with snake_case. 

```rb
:apples #this is a symbol
:apple_truck #this is also a symbol
```

To learn more about casing in programming, [check this out.](https://www.chaseadams.io/most-common-programming-case-types/)

#### Integers
Integers are numbers, defined by a series of digits using a dot as a decimal mark. They are different from floating point numbers (floats- decimal numbers), which return a float.

  ```rb
  123 => 123 , integer
  1.23 => 1.23, float
  ```

#### Booleans 
Represents one piece of information as true, false, or nil. The object `true` represents truth as we understand it, and `false`, the opposite. `nil` represents nothing- a 'thing' that represents its opposite! Because every method returns one 'thing' (remember, data types are 'things' that represent data), we need to have a 'thing' to represent 'nothing'. 

![Mind Blown](https://media.giphy.com/media/2fLgzU6ZNbqgj1jJy2/giphy.gif)

Booleans can be assigned to variables and are used widely in apps. 

```rb
# in IRB
2.6.1 :009 > lyn = nil    => nil 
2.6.1 :010 > lyn          => nil 
2.6.1 :011 > lyn = true   => true 
2.6.1 :012 > lyn          => true 
2.6.1 :013 > lyn = false  => false 
2.6.1 :014 > lyn          => false 
```

#### Strings
An object that represents a specific text, typically defined by characters enclosed in a set of single or double quotes. 

```rb
 "Hi! My name is Lyn." => "Hi! My name is Lyn."
```

##### String Concatenation 
You can stick different strings together using the `+` symbol, joining two different strings end-to-end. This is formally called concatenation. 

```rb
"ice " + "cream!" => "ice cream!"

"snow" + "ball" => "snowball"

"mwu" + "ha" + "ha" => "mwuhaha"
or 
"mwu" + "ha" * 2 => "mwuhaha"
```

Note that multiplying a number by a string will return more instances of that string. So: 

```rb
"1" + "1" + "1" => "111"
"1" * 3 => "111"
```

##### String Interpolation 
While we can use concatenation to connect strings together, a cleaner and more widely used method of connecting strings is through interpolation. 

With interpolation, a bit of Ruby code is added, evaluated and embedded into the string it sits in. To use interpolation, add your bit of code within a set of curly braces (curly boys :D ) like this: 

```rb
#{some text}
```
Example: 

```rb
name = "Lyn" #create a variable
p "Hello, #{name}!" #use variable for name
```
As soon as Ruby reads `#{name}`, it knows to look for the variable `name` and evaluate it with the given value, `Lyn`. It returns the value of the variable and embeds it into the string "Hello, _____!"

String interpolation only works with strings in double quotes, so be mindful of your use of double and single quotes here.

#### Arrays 
Arrays are things that store other things, like collections and lists. Think of it as a backpack- the backpack is a thing, and this thing can store other things inside of it. 

![In the bag](https://media1.tenor.com/images/d30035bbfc4e210184b1f0fbcede7781/tenor.gif?itemid=10685948)

An array is represented as a set of square brackets `[]` holding values that are separated by commas.

```rb
[3, 7, 21]
[:lyn, 21, ["happy"], 1.95, false]
```
Arrays can hold all types of objects, and unlike a backpack, will remember the order that you put things in (and take them out), unless you do something to change the order.

##### Getting Objects From an Array
There's lots of ways to get elements from an array. Here's one: 

```rb
car_makes = ["Nissan", "Tesla", "Honda"]
car_makes[1] => "Tesla"
```
Here we defined a variable `car_makes`, stored different types of car makes in an array, and invoked the variable, asking for the car make at position(index) 1. In programming, we count `0`, and arrays always start at index `0`. 

We can also add objects, overwrite objects, and learn about if objects exist in arrays: 

Adding objects: 
```rb
car_makes = ["Nissan", "Tesla", "Honda"]
car_makes[3] = "Hyundai"
car_makes << "Kia" #uses shovel- append this to the index!

#result 
car_makes => ["Nissan", "Tesla", "Honda", "Hyundai", "Kia"]
```

Overwriting objects: 
```rb
car_makes => ["Nissan", "Tesla", "Honda", "Hyundai", "Kia"]
car_makes[0] = "Audi" 

#overwrites "Nissan"
car_makes => ["Audi", "Tesla", "Honda", "Hyundai", "Kia"]
```

And learning if objects exist:
```rb
car_makes => ["Audi", "Tesla", "Honda", "Hyundai", "Kia"]

car_makes[5] => nil #there's no element at index 5, so return nil
```

##### Nested Arrays 
Arrays can also hold other arrays that hold things, and you can access the array within an array, as well as the things within the nested array. 

![wut](https://media.giphy.com/media/DhZSDMnqPu20U/giphy.gif)

Yep: 

```rb
random = [
  ["Lyn", "is", "happy"],
  [1, 2, 3],
  [true, false, nil]
]

random[1] => [1, 2, 3] 
random[0][2] => "happy"
```
![ohhh](https://i.imgur.com/aMgG2jh.gif)

##### Operating on Arrays
You can add, subtract, multiply, and divide arrays. You can find the intersection of an array, sort it, pull the first element... and so on. Here's some examples: 

```rb
# math operations 
["you ", "are "] + ["so ", "beautiful"]
=> ["you ", "are ", "so ", "beautiful"] 

["you ", "are ", "so ", "beautiful"] - ["so "]
=> ["you ", "are ", "beautiful"] 

# find the length 
[1, 2, 3, 4, 5].length
=> 5

# sort the array 
[5, 3, 4, 1, 2].sort
=> [1, 2, 3, 4, 5] 

# find the first element
["you ", "are "].first
= "you"

# find the index of an element
["you ", "are ", "so ", "beautiful"].index("are ")
=> 1
```

Practice with these in `IRB`, as you will be using these and more ways to operate on arrays often!

#### Hashes
Hashes are dictionary-like collections of key-value pairs, stored in curly braces (we call them CURLY BOYS here at Flatiron). 

These pairs allow you to store and retrieve data— hashes usually use key-value pairs that are related in some way. 

```rb
user = {first_name: "Lyn", last_name: "Muldrow"}

user => {:first_name=>"Lyn", :last_name=>"Muldrow"}

user[:first_name] => "Lyn"
```


##### Getting Values from Hashes
To retrieve values from a hash, we pass in a key within square brackets `[]`. 

```rb
schools = {yours: "Flatiron", mine: "General Assembly"}

schools[:yours] => "Flatiron"
```

We can also assign a value to an existing key: 

```rb
schools = {yours: "Flatiron", mine: "General Assembly"}

schools[:everyone] = "life"

schools => {:yours =>"Flatiron", :mine =>"General Assembly", :everyone => "life"} 
```

And we can access stuff in a hash that is nested within other hashes and/or arrays: 

```rb
pets = {
  domestic: { 
    big: ["dogs", "cats"],
    small: ["bunnies", "gerbils"]
  },
  wild: {
    cold: ["snakes", "turtles"],
    warm: ["foxes", "wallabies"]
  }
}

pets[:domestic][:small] => ["bunnies", "gerbils"]
pets[:wild][:cold][1] => "turtles"
pets[:domestic][:small][0] => "bunnies"

```
![Boom](https://media0.giphy.com/media/LrN9NbJNp9SWQ/giphy.gif)

### Resources for Data Types
Most of what we share here will teach you about process, so that you're able to solve problems on your own in an easy and efficient manner. As was mentioned in the intro, one of the most important processes you'll learn is the SEARCH PROCESS. Google is your friend. Embrace it.

Here's some search terms that will result in information about data types: 

- "Ruby Data Types" 
- "What are some data types programming Ruby"

Practice with using the programming keyword, search term, and what you'd like to know in your queries to get better, faster results.

---

## Array Methods (Enumerables) Review
When you're looking to do something with the data you're using in an array (or list), more than likely you'll need to iterate through the list to pull out the information you need. 

Ruby provides us with a few distinct ways of doing so, called `enumerables`, which is a module (collection of methods) packaged together to perform actions on arrays. Let's examine how to use these iterators!  

### `.each ` 
This method allows us to go(iterate) through each item in the array you call it on (.each) and perform an action. It returns the original array when necessary.

```rb
["lions", "tigers", "bears"].each do |animal|
  p "Oh, my!"
end

=> "Oh, my!"
"Oh, my!"
"Oh, my!"
```
In plain English, this reads: "For each of these animals, print "Oh, my!"

### `map` 
This method allows us to transform values and return a new array with the results.

```rb
[1, 2, 3].map do |number|
 number * 2
end

 => [2, 4, 6] 
```
In plain English, this reads: "For each of these numbers, multiply them by 2 and return to me only the results." 

### `select`
This method allows us to find an element in an array and pick it out. 

```rb

```



### `find`



---

## Working with the Game Hash

Home Team:

* team name: Brooklyn Nets
* colors: Black, White
* players:

|      Stat       |     Info      |     Info     |    Info     |     Info      |    Info     |
| :-------------: | :-----------: | :----------: | :---------: | :-----------: | :---------: |
| **Player Name** | Alan Anderson | Reggie Evans | Brook Lopez | Mason Plumlee | Jason Terry |
|   **Number**    |       0       |      30      |     11      |       1       |     31      |
|    **Shoe**     |      16       |      14      |     17      |      19       |     15      |
|   **Points**    |      22       |      12      |     17      |      26       |     19      |
|  **Rebounds**   |      12       |      12      |     19      |      12       |      2      |
|   **Assists**   |      12       |      12      |     10      |       6       |      2      |
|   **Steals**    |       3       |      12      |      3      |       3       |      4      |
|   **Blocks**    |       1       |      12      |      1      |       8       |     11      |
| **Slam Dunks**  |       1       |      7       |     15      |       5       |      1      |

Away Team:

* team name: Charlotte Hornets
* colors: Turquoise, Purple
* players:

|      Stat       |    Info     |      Info      |     Info     |    Info    |      Info       |
| :-------------: | :---------: | :------------: | :----------: | :--------: | :-------------: |
| **Player Name** | Jeff Adrien | Bismak Biyombo | DeSagna Diop | Ben Gordon | Brendan Haywood |
|   **Number**    |      4      |       0        |      2       |     8      |       33        |
|    **Shoe**     |     18      |       16       |      14      |     15     |       15        |
|   **Points**    |     10      |       12       |      24      |     33     |        6        |
|  **Rebounds**   |      1      |       4        |      12      |     3      |       12        |
|   **Assists**   |      1      |       7        |      12      |     2      |       12        |
|   **Steals**    |      2      |       7        |      4       |     1      |       22        |
|   **Blocks**    |      7      |       15       |      5       |     1      |        5        |
| **Slam Dunks**  |      2      |       10       |      5       |     0      |       12        |



### Iterating through Nested Levels:

This lab requires us to iterate through the many levels of our nested hash. DON'T TAKE YOUR UNDERSTANDING OF YOUR HASH FOR GRANTED. Every time you iterate into a new level of the hash, immediately place a `binding.pry` there. Then, run RSpec with the `learn` command to see what the key/value pairs of that hash are.

Let's take a look at an example:

```rb
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end
```

Open up the `hashketball.rb` file and add the line _require "pry"_ at the top and copy and paste the above method. Then, beneath the `end` that closes the method definition, call the method (`good_practices`) and, in your terminal, run the file with `ruby hashketball.rb`. Play around with the methods in each binding until you get comfortable with the iteration. This should give you a stronger sense of how we iterate through so many levels of a nested hash and what happens on each level. **Use this method of placing LOTS of bindings when you iterate in order to solve this lab.**

Okay, _now_ we're ready to build out methods:

### Method Building

* Build a method, `num_points_scored` that takes in an argument of a player's name and returns the number of points scored for that player.

  * Think about where in the hash you will find a player's `:points`. How can you iterate down into that level? Think about the return value of your method. Remember that `.each` returns the original collection that you are iterating over. How can you return the number of points for a particular player?

* Build a method, `shoe_size`, that takes in an argument of a player's name and returns the shoe size for that player.
  * Think about how you will find the shoe size of the correct player. How can you check and see if a player's name matches the name that has been passed into the method as an argument?
* Build a method, `team_colors`, that takes in an argument of the team name and returns an array of that teams colors.
* Build a method, `team_names`, that operates on the game hash to return an array of the team names.
* Build a method, `player_numbers`, that takes in an argument of a team name and returns an array of the jersey number's for that team.
* Build a method, `player_stats`, that takes in an argument of a player's name and returns a hash of that player's stats.
  * Check out the following example of the expected return value of the `player_stats` method:


    ```bash
    player_stats("Alan Anderson")
    => { :number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1
       }
    ```

* Build a method, `big_shoe_rebounds`, that will return the number of rebounds associated with the player that has the largest shoe size. Break this one down into steps:
  * First, find the player with the largest shoe size
  * Then, return that player's number of rebounds
  * Remember to think about return values here. Use `binding.pry` to drop into your method and understand what it is returning and why.

**Bonus Questions:**

Define methods to return the answer to the following questions:

1. Which player has the most points? Call the method `most_points_scored`.

2. Which team has the most points? Call the method `winning_team`.

3. Which player has the longest name? Call the method `player_with_longest_name`.

**Super Bonus:**

1. Write a method that returns true if the player with the longest name had the most steals. Call the method `long_name_steals_a_ton?`.

## Resources

* [Codecademy](http://www.codecademy.com/dashboard) - [A Night at the Movies](http://external.codecademy.com/courses/ruby-beginner-en-0i8v1/0/1)

<p class='util--hide'>View <a href='https://learn.co/lessons/advanced-hashes-hashketball'>Hashketball</a> on Learn.co and start learning to code for free.</p>
