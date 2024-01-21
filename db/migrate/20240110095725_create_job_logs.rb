# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :job_logs do
      # primary_key :id
      primary_key :id, type: :Bignum
      # String :id, primary_key: true

      String :name, null: false
      DateTime :started_at, null: false
      DateTime :ended_at
      TrueClass :collected, null: false, default: false
      DateTime :created_at, null: false

      index :ended_at
    end
  end
end
