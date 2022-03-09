# frozen_string_literal: true
require 'sqldef'
require 'sqldef/rails/version'
require 'sqldef/rails/railtie'

module Sqldef
  module Rails
    def self.database_config
      database = ::Rails.application.config_for(:database)
      if ENV.key?('DATABASE_URL')
        database = database.merge(
          ActiveRecord::DatabaseConfigurations::ConnectionUrlResolver.new(ENV['DATABASE_URL']).to_hash
        )
      end
      database
    end
  end
end
