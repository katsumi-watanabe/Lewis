# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:

env :PATH, ENV['PATH']
set :output, 'log/cron.log'
set :environment, ENV['CRON']

every 1.days, at: '0:00 am' do
  runner 'History.where("created_at < ?", 30.days.ago.beginning_of_day).delete_all'
end

every 1.days, at: '0:00 am' do
  runner 'Activity.where("created_at < ?", 30.days.ago.beginning_of_day).delete_all'
end

#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
