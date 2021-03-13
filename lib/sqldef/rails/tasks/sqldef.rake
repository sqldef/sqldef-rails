# frozen_string_literal: true

namespace :sqldef do
  desc 'Export the database'
  task export: [:environment] do
    puts 'hello'
  end

  desc 'Apply the database'
  task apply: [:environment] do
    puts 'hello'
  end
end