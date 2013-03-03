# Projectors extension for Refinery CMS.

## Features
This refinery-cms extension adds a page type "projectors" to refinery.
Each projector has a page, the content is taken from an existing page.
In the backend, the following options can be set:
* name of the page that should be displayed
* zoom factor for text
* text position
* refresh rate

As you update the backend, the page is automaticaly updated via AJAX or refresh.

## Installation
To add the extension, add the following line to your gemfile:
```ruby
gem 'refinerycms-projectors', :git => 'git://github.com/tnds/refinerycms-projectors.git', :branch => 'release'
```

Now, run ``bundle install``

Next, to install the search plugin run:

    rails generate refinery:projectors

Run database migrations:

    rake db:migrate