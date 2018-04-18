

options = {
  adapter: 'postgresql',
  database: 'altrun'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
