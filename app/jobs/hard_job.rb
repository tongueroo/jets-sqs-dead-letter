class HardJob < ApplicationJob
  depends_on :list
  class_timeout 30 # must be less than or equal to the SQS queue default timeout

  sqs_event(:generate_queue,
    queue_properties: {
      redrive_policy: {
        dead_letter_target_arn: ref(:dead_letter),
        max_receive_count: 3,
    }})
  def deliver
    puts "event #{JSON.dump(event)}"
    puts "deliver called"
  end
end
