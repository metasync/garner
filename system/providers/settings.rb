# frozen_string_literal: true

module Garner
  App.register_provider(:settings, from: :dry_system) do
    settings do
      setting :app_name, default: Garnet.app.app_name, constructor: Types::String.constrained(filled: true)

      setting :log_level, default: 'info', constructor: Types::String.constrained(filled: true)
      setting :log_formatter, default: 'string', constructor: Types::String.constrained(filled: true)

      setting :fetch_size, default: 10, constructor: Types::Integer.constrained(filled: true)
      setting :db_name, constructor: Types::String.constrained(filled: true)
      setting :db_user, constructor: Types::String.constrained(filled: true)
      setting :db_password, constructor: Types::String.constrained(filled: true)
      setting :database_url, constructor: Types::String.constrained(filled: true)
      setting :enable_sql_log, default: false, constructor: Types::Params::Bool.optional

      setting :simulator_pool_size, default: 3, constructor: Types::Integer.constrained(filled: true)
      setting :collector_pool_size, default: 2, constructor: Types::Integer.constrained(filled: true)
      setting :elastic_agent_pool_size, default: 4, constructor: Types::Integer.constrained(filled: true)
    end
  end
end
