# Remember The Milk Dashing widget

[Remember The Milk](https://www.rememberthemilk.com/) (RTM) widget for [Dashing](http://shopify.github.com/dashing), which uses the [Milkman](https://github.com/kevintuhumury/milkman) gem. It displays the tasks sorted by date (by default), but it can also sort the tasks by priority.

## Dependencies

[Milkman](https://github.com/kevintuhumury/milkman) is a dependency of the Remember The Milk widget, which has basically been created especially for this widget. So, add `milkman` to the Gemfile of your Dashing dashboard:

```ruby
gem "milkman"
```

and run `bundle install`.

## Installation

To actually use the widget on your own Dashboard, you'll have to [request](https://www.rememberthemilk.com/services/api/keys.rtm) an API key and shared secret from Remember The Milk. With those variables you'll be able to retrieve an authentication token. The three of them are required to use Milkman. For detailed information about authorizing Milkman, check the gem's [documentation](https://github.com/kevintuhumury/milkman#authorize-milkman). You'll need to read "Apply for an API key and shared secret". In short, you'll need to run the `milkman` executable:

```bash
milkman authorize API_KEY SHARED_SECRET
```

Follow it's instructions (you'll have to copy an authorization URL) and the instructions on the Remember The Milk site to authorize Milkman. Once you've done that you'll receive a `frob` value. Copy and paste that in the shell. The description which follows will include the three variables you'll need to copy to the job file of this widget, as shown in the [usage](https://github.com/kevintuhumury/dashing-rememberthemilk#usage) section.

## Usage

To use this widget, copy `remember_the_milk.coffee`, `remember_the_milk.html` and `remember_the_milk.scss` into the `/widgets/remember_the_milk` directory. Copy `remember-the-milk.png` into the `/assets/images` directory and put the `remember_the_milk.rb` file in your `/jobs` folder.

To include the widget in your dashboard, add the following snippet to the dashboard layout file:

```ruby
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="remember-the-milk" data-view="RememberTheMilk"></div>
</li>
```

On to the next part. Enter the API key, shared secret and authentication token in the `remember_the_milk.rb` job file:

```ruby
# milkman configuration

api_key       = "API_KEY"
shared_secret = "SHARED_SECRET"
auth_token    = "AUTH_TOKEN"
```

And your done. That's really it.

## Configuration

By default the Remember The Milk widget will display all incomplete tasks, which are due before today and will be overdue tomorrow. So, all tasks for today.

```ruby
# widget configuration

filter        = 'status:incomplete AND (dueBefore:today OR dueWithin:"1 day of today")'
date_format   = "%d/%m/%y"
sort_by       = "date"
max_items     = 8
```

The `filter` in the above configuration can be changed by using one of the available [options](https://www.rememberthemilk.com/help/?ctx=basics.search.advanced). The same applies to the `date_format`, `sort_by` and `max_items`.

### Sorting

As described in the introduction of this widget, the tasks can be sorted by date (as shown above) or by priority. Simply fill in `priority` instead of `date` as the value for `sort_by`:

```ruby
sort_by = "priority"
```

## Preview

![image](https://f.cloud.github.com/assets/412952/369848/d9fbb044-a2e0-11e2-9740-ddb95ea05447.png)
