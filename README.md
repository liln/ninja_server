# NinjaServer

This is a tiny HTTP server written in Ruby.

### Features

* Serves up static files from a directory to a web browser
* Sanitizes the path requested to prevent access outside the folder
* Implicitly adds index.html to path when accessing directory roots
* NinjaServer hides the functionality of TinyServer within it
* Defaults to using public folder to serve up assets unless the public folder does not exist
* Silently kills the server with CTRL+c

## Installation

Add this line to your application's Gemfile:

    gem 'ninja_server'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ninja_server

## Usage

`ninja_server` will use default 1337 port, try to use public folder or this folder
`ninja_server port` will try to use public folder or this folder
`ninja_server port staticroot` will serve up to your desires

## Contributing

1. Fork it ( http://github.com/orangeninjamidget/ninja_server/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

[Lillian Ng](https://github.com/orangeninjamidget/)

## License

MIT: [http://lng.mit-license.org](http://lng.mit-license.org)
