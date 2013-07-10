# Milkman Dashing widget

Milkman widget for [Dashing](http://shopify.github.com/dashing), which uses the [Milkman](https://github.com/kevintuhumury/milkman) gem to retrieve tasks from [Remember The Milk](https://www.rememberthemilk.com/) (RTM). It displays the tasks sorted by date (by default), but it can also sort the tasks by priority. An example of the former can be viewed [below](https://github.com/kevintuhumury/dashing-milkman#preview).

## Dependencies

[Milkman](https://github.com/kevintuhumury/milkman) is a dependency of the Milkman widget, which has basically been created especially for this widget. So, add `milkman` to the Gemfile of your Dashing dashboard:

```ruby
gem "milkman"
```

and run `bundle install`.

## Authorization

To actually use the widget on your own Dashboard, you'll have to [request](https://www.rememberthemilk.com/services/api/keys.rtm) an API key and shared secret from Remember The Milk. With those variables you'll be able to retrieve an authentication token. The three of them are required to use Milkman. For detailed information about authorizing Milkman, check the gem's [documentation](https://github.com/kevintuhumury/milkman#authorize-milkman). You'll need to read "Apply for an API key and shared secret".

In short, you'll need to run the `milkman` executable:

```bash
milkman authorize API_KEY SHARED_SECRET
```

Follow it's instructions (you'll have to copy an authorization URL) and the instructions on the Remember The Milk site to authorize Milkman. Once you've done that you'll receive a `frob` value. Copy and paste that in the shell. The description which follows will include the three variables you'll need to copy to the job file of this widget, as shown in the [usage](https://github.com/kevintuhumury/dashing-milkman#usage) section.

## Usage

To use this widget, copy `milkman.coffee`, `milkman.html` and `milkman.sass` into the `/widgets/milkman` directory of your dashboard. Copy `milkman.png` into the `/assets/images` directory and put the `milkman.rb` file in your `/jobs` folder.

To include the widget on your dashboard, add the following snippet to the dashboard layout file:

```ruby
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="milkman" data-view="Milkman"></div>
</li>
```

On to the next part. Enter the API key, shared secret and authentication token in the `milkman.rb` job file:

```ruby
# milkman configuration

api_key       = "API_KEY"
shared_secret = "SHARED_SECRET"
auth_token    = "AUTH_TOKEN"
```

And your done. That's really it. Now... use it!

## Configuration

By default the Milkman widget will display all incomplete tasks, which are due before today and will be overdue tomorrow. So, all tasks for today.

```ruby
# widget configuration

filter        = 'status:incomplete AND (dueBefore:today OR dueWithin:"1 day of today")'
date_format   = "%d/%m/%y"
sort_by       = "date"
max_items     = 8
```

The `filter` in the above configuration can be changed by using one of the available [options](https://www.rememberthemilk.com/help/?ctx=basics.search.advanced). The `date_format` can be changed to something of your liking. The same applies to the `max_items` configuration option.

### Sorting

As described in the introduction of this widget, the tasks can be sorted by date (as shown above) or by priority. Simply fill in `priority` instead of `date` as the value for `sort_by` to do just that:

```ruby
sort_by = "priority"
```

## Preview

![image](https://f.cloud.github.com/assets/412952/778301/b6b622aa-e9ac-11e2-9d5e-8184a47c4107.png)

## Copyright

Copyright 2013 Kevin Tuhumury. Released under the MIT License. This product uses the Remember The Milk API, but is not endorsed or certified by Remember The Milk.
