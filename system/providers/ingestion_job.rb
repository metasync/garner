# frozen_string_literal: true

module Ingestion
  Service.register_provider :job do
    start do
      register(:job,
               Ingestion::Job.new(
                 name: 'ingestion-job',
                 max_batches: 100,
                 batch_size: 20,
                 slice_size: 5,
                 batch_wait: 1
               ))
    end
  end
end
