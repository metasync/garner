# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :job_step_logs do
      # primary_key :id
      # foreign_key :job_log_id, :job_logs, on_delete: :cascade

      primary_key :id, type: :Bignum
      foreign_key :job_log_id, :job_logs, type: :Bignum, on_delete: :cascade

      # String :id, primary_key: true
      # foreign_key :job_log_id, :job_logs, type: String, on_delete: :cascade

      String :name, null: false
      DateTime :started_at, null: false
      DateTime :ended_at

      if ENV['DB_ADAPTER'] == 'tinytds'
        # Use VARCHAR(MAX) for SQL Server
        String :error, size: :max
      else
        # Use TEXT for other databases
        String :error, text: true
      end

      DateTime :created_at, null: false
    end
  end
end
