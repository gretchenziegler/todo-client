# Todo::Client

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/todo/client`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'todo-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install todo-client

## Usage

*API Token required for all requests.*

### Get Lists
Get all lists and their associated items.

Required params: token

Example call:
`Todo::Client::Lists.all({token: <token>})`

Sample response:
```
{"lists"=>
  [{"name"=>"Weekend Chores",
    "src"=>"http://todoable.teachable.tech/api/lists/e8266545-efe8-41db-a0bf-c08ca657ba06",
    "id"=>"e8266545-efe8-41db-a0bf-c08ca657ba06"},
   {"name"=>"Random Stuff",
    "src"=>"http://todoable.teachable.tech/api/lists/a04f78a6-f732-4e94-91ca-9caaa85258db",
    "id"=>"a04f78a6-f732-4e94-91ca-9caaa85258db"}]}
```

### Create List
Create a new, empty list.

Required params: token, name

Example call:
`Todo::Client::Lists.create({token: <token>, name: 'Weekend Chores'})`

Returns created list. Sample response:
```
{"name"=>"Weekend Chores",
 "src"=>"http://todoable.teachable.tech/api/lists/19712379-4609-47f0-9310-5353e6a203d8",
 "id"=>"19712379-4609-47f0-9310-5353e6a203d8"}
```

### Get List By Id
Retrieve contents of an existing list.

Required params: token, list_id (available in `Lists.all` payload)

Example call:
`Todo::Client::List.find({token: <token>, list_id: <list_id>})`

Sample response:
```
{"name"=>"Random Stuff",
 "items"=>
  [{"name"=>"Eat a marshmallow",
    "finished_at"=>"2018-11-22T02:36:20.684Z",
    "src"=>"http://todoable.teachable.tech/api/lists/a04f78a6-f732-4e94-91ca-9caaa85258db/items/4425aae2-500b-4322-9531-2db1458f91bf",
    "id"=>"4425aae2-500b-4322-9531-2db1458f91bf"}]}
```

### Update List Name
Update the name of an existing list.

Required params: token, list_id

Example call:
`Todo::Client::List.update({token: <token>, list_id: <list_id>, name: <name>})`

Successful response:
Unsuccessful response:

### Delete List By Id
Delete an existing list.

Required params: token, list_id

Example call:
`Todo::Client::List.delete({token: <token>, list_id: <list_id>})`

Successful response:
Unsuccessful response:

### Create List Item
Add an item to an existing list.

Required params: token, list_id, name

Example call:
`Todo::Client::Item.create({token: <token>, list_id: <list_id>, name: 'Laundry'})`

Returns created item. Sample response:
```
{"name"=>"Laundry",
 "finished_at"=>nil,
 "src"=>"http://todoable.teachable.tech/api/lists/19712379-4609-47f0-9310-5353e6a203d8/items/497b5725-c779-4f77-84bd-6519d00a9250",
 "id"=>"497b5725-c779-4f77-84bd-6519d00a9250"}
```

### Mark Item As Finished
Flag an item as completed; update time of completion.

Required params: token, list_id, item_id (available in `List.find` payload)

Example call:
`Todo::Client::Item.complete({token: <token>, list_id: <list_id>, item_id: <item_id>})`

Successful response:
Unsuccessful response:

### Delete List Item
Delete an item from a list.

Required params: token, list_id, item_id

Example call:
`Todo::Client::Item.delete({token: <token>, list_id: <list_id>, item_id: <item_id>})`

Successful response:
Unsuccessful response:

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gretchenziegler/todo-client.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
