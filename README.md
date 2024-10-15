# validator

Untuk membuat validasi sederhana

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     validator:
       github: taufikmaulanaa/validator
   ```

2. Run `shards install`

## Usage

```crystal
require "validator"
```

Contoh penggunaan
```crystal
  Validator.clear_errors
  Validator.validate_required(data[:name], "Nama", "name")
  Validator.validate_max_length(data[:name], "Nama", "name", 50)
  Validator.validate_required(data[:url], "URL", "url")
  Validator.validate_max_length(data[:url], "URL", "url", 200)
  Validator.validate_required(data[:is_active], "Status", "status")

  if !Validator.valid?
    env.response.status_code = 400
    next {
      status: "error",
      errors: Validator.errors
    }.to_json
  end
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/taufikmaulanaa/validator/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Taufik](https://github.com/taufikmaulanaa) - creator and maintainer
