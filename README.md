Leftronic Ruby Gem Documentation
================================

What is Leftronic?
------------------

[Leftronic](https://beta.leftronic.com) makes powerful dashboards for business intelligence.

* Colorful and interactive data visualizations
* Templates to get you started right away
* Drag-and-drop editor makes it easy for anyone to create a powerful dashboard, customized to their needs
* Integration with Google Analytics, Twitter, Chartbeat, Zendesk, Basecamp, Pivotal Tracker, Facebook, and more to come!
* Dashboards can be protected or shared with a shortened URL
* Powerful API's for Javascript, PHP, Python, Ruby, and Java
* Python Package and Ruby Gem

Technical Notes
---------------

We also suggest checking out our [API](https://beta.leftronic.com/api) page. While the most detailed documentation is here, it has JSON and CURL examples in addition to a test form to send data to your custom widgets.

Authentication is handled by your API access key. We strongly encourage you to keep this key private. If you're logged in, your key can be found on our [API](https://beta.leftronic.com/api) page. If you plan on using one of our API libraries, you will find instructions below on how to set your access key.

All API requests are made by sending a POST request to https://beta.leftronic.com/customSend with a properly formatted JSON packet. We do not support XML.

Current API version is 1.0.
Current Ruby Gem version is 1.1.1.

Getting Started
---------------

If you haven't already, create an account at https://beta.leftronic.com/accounts/login.

Get your API access key from the API overview page at https://beta.leftronic.com/api.

We recommend checking out our [Tutorials](https://beta.leftronic.com/tutorials) to familiarize yourself with your dashboard.

Ruby Gem
--------

Start by downloading the most recent version of our Ruby Gem on [Github](https://github.com/sonofabell/leftronic-ruby) or on [RubyGems](http://rubygems.org/gems/leftronic).

### Installing Dependencies

[RubyGems](http://rubygems.org/pages/download), [Curb](http://rubygems.org/gems/curb), and [JSON](http://rubygems.org/gems/json). We recommend installing them with the [RubyGems](http://rubygems.org/pages/download) installer.

**_Note_**: Versions prior to Ruby 1.9 may need to import [rubygems](http://rubygems.org).

```ruby
require 'rubygems'
```

Import the file. Your location may vary.

```ruby
require 'leftronic'
```

Create a class instance with your API key. Feel free to name it whatever you'd like.

```ruby
update = Leftronic.new("YOUR_ACCESS_KEY")
```

Here are some example functions to push to your dashboard. Be sure you have configured the correct widgets to accept custom data points. Also, be sure that you have entered your API access key correctly.

Let's start with pushing a number to a widget.

```ruby
update = Leftronic.pushNumber("yourNumberStream", 14600)
```

Now we'll push some geographic coordinates to a map widget. You can use either the U.S. or world map widgets. The first coordinate (37.8) is the latitude and the second coordinate (-122.6) is the longitude. If your request is successful, you should see a data point appear on San Francisco, California.

```ruby
update = Leftronic.pushGeo("yourGeoStream", 37.8, -122.6)
```

Here's how you push a title and message to a text feed widget.

```ruby
update = Leftronic.pushText("yourTextStream", "This is my title.", "Hello World!")
```

Let's push an array of names and values to a leaderboard widget. Be sure to create the array first (you may call it whatever you'd like). Be careful to use the proper syntax. Next, push the array to your widget.

```ruby
leaderArray = Array[{"name" => "Johnny", "value" => 84}, {"name" => "Jamie", "value" => 75}, {"name" => "Lance", "value" => 62}]

update = Leftronic.pushLeaderboard("yourBoardStream", leaderArray)
```

Similar to the last example, let's push a list of items to a list widget. Same rules as last time.

```ruby
listArray = Array[{"listItem" => "Elizabeth"}, {"listItem" => "Marshall"}, {"listItem" => "Claire"}, {"listItem" => "Nolan"}]

update = Leftronic.pushList("yourListStream", listArray)
```

Feedback and Issues
-------------------

If you notice any bugs or other issues, submit a patch or send us a pull request. You can also send us an email at <support@leftronic.com>.