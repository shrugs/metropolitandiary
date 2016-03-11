
desc 'For every user that hasn\'t received an entry in 24 hours, send them one at the right time.'
task :disperse_entries => :environment do
  # get 8pm at whatever timezone
  # right now, what timezone is it 8pm in?
  # get all of the users that have that as their timezone
  # for each user, check their logs and send them an entry if they have no logs for the past 24 hours

  TIME_TO_SEND_NOTIFICATION = 20  # 8pm

  this_hour = DateTime.now.beginning_of_hour
  zone_key = ActiveSupport::TimeZone::MAPPING.keys.find do |name|
    this_hour.in_time_zone(ActiveSupport::TimeZone[name]).hour == TIME_TO_SEND_NOTIFICATION
  end

  zone_string = ActiveSupport::TimeZone[zone_key].tzinfo.identifier

  if Rails.env.development?
    zone_string = 'America/New_York'
  end

  User.where('timezone = ?', zone_string).find_each do |user|
    if Rails.env.development? || user.todays_entry_logs.length < 2
      random_entry = user.other_entries.order('RANDOM()').first
      puts "Adding Entry #{random_entry.id} to User #{user.id}"
      user.add_entry_to_diary(random_entry)
    end
  end
end