# frozen_string_literal: true

namespace :sqldef do
  commands = {
    'mysql2'     => :mysqldef,
    'postgresql' => :psqldef,
    'sqlite3'    => :sqlite3def,
  }

  desc 'Export the database'
  task export: [:environment] do
    database = Rails.application.config_for(:database)
    Sqldef.export(
      host:     database.fetch(:host),
      port:     database[:port],
      user:     database.fetch(:username),
      password: database[:password],
      database: database.fetch(:database),
      command:  commands.fetch(database.fetch(:adapter)),
      path:     Rails.root.join('db/schema.sql').to_s,
    )
  end

  desc 'Dry-run the database'
  task 'dry-run': [:environment] do
    database = Rails.application.config_for(:database)
    Sqldef.dry_run(
      host:     database.fetch(:host),
      port:     database[:port],
      user:     database.fetch(:username),
      password: database[:password],
      database: database.fetch(:database),
      command:  commands.fetch(database.fetch(:adapter)),
      path:     Rails.root.join('db/schema.sql').to_s,
    )
  end

  desc 'Apply the database'
  task apply: [:environment] do
    puts 'hello'
  end
end
