# frozen_string_literal: true

module Garner
  App.register_provider :persistence, source: :persistence, from: :garnet do
    # config.name = target['settings'].db_name
    config.db_user = target['settings'].db_user
    config.db_password = target['settings'].db_password
    config.database_url = target['settings'].database_url
    config.enable_sql_log = target['settings'].enable_sql_log
  end

  # App.register_provider :archive_source, source: :persistence, from: :garnet do
  #   config.name = 'source'
  #   config.db_user = target['settings'].source_db_user
  #   config.db_password = target['settings'].source_db_password
  #   config.database_url = target['settings'].source_database_url
  # end

  # App.register_provider :archive_dest, source: :persistence, from: :garnet do
  #   config.name = 'dest'
  #   config.db_user = target['settings'].dest_db_user
  #   config.db_password = target['settings'].dest_db_password
  #   config.database_url = target['settings'].dest_database_url
  # end
end
