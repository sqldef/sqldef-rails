require 'rails/railtie'

class Sqldef::Rails::Railtie < ::Rails::Railtie
  rake_tasks do
    load File.expand_path('./tasks/sqldef.rake', __dir__)
    load File.expand_path('./tasks/databases.rake', __dir__)
  end
end
