# sqldef-rails

Run [sqldef](https://github.com/k0kubun/sqldef) on Rails.

## Installation

```ruby
gem 'sqldef-rails'
```

## Usage
### Configuration

Just configure `config/database.yml` normally.

```yml
default: &default
  adapter: postgresql
  username: postgres
  password:
  host: 127.0.0.1

development:
  <<: *default
  database: sqldef_development

test:
  <<: *default
  database: sqldef_test
```

### Export

Dump the current schema to `db/schema.sql`.

```bash
bundle exec rake db:schema:dump
```

You may use `bin/rails` instead of `bundle exec rake` too.

### Dry Run

You can show DDLs to be executed to match `db/schema.sql`.

```bash
bundle exec rake db:migrate:status
```

### Aplly

You can run DDLs to match `db/schema.sql`.

```bash
bundle exec rake db:migrate
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
