# frozen_string_literal: true

Rake::Task.tasks.each do |task|
  case task.name
  when /\Adb:schema:/, /\Adb:migrate(:|\z)/, 'db:rollback'
    task.clear
  end
end

namespace :db do
  {
    'migrate:status' => 'sqldef:dry-run',
    'migrate'        => 'sqldef:apply',
    'schema:load'    => 'sqldef:apply',
    'schema:dump'    => 'sqldef:export',
  }.each do |db, sqldef|
    desc Rake::Task[sqldef].comment
    task db => sqldef
  end
end
