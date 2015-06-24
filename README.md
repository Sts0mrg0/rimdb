# Rimdb

[![Build Status](https://travis-ci.org/juco/rimdb.svg?branch=master)](https://travis-ci.org/juco/rimdb)

IMDB's API sucks, hence this Gem. It's designed to pull back:

* A users ratings
* A users watchlist

And maybe some other stuff in the future.

## Usage

```ruby
require 'rimdb'

my_imdb_user_id = 1234
ratings = Rimdb::Ratings.new(my_imdb_user_id)

ratings.each_movie do |movie|
  puts movie.title
end
```
