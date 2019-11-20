# Jets SQS Example with Dead Letter Queue

[![BoltOps Badge](https://img.boltops.com/boltops/badges/boltops-badge.png)](https://www.boltops.com)

* [jobs/hard_job.rb](app/jobs/hard_job.rb)
* [resources/list.rb](app/shared/resources/list.rb)

Answers Jets Community Question: [How to properly configure dead letter queue for a particular queue?](https://community.rubyonjets.com/t/how-to-properly-configure-dead-letter-queue-for-a-particular-queue/302)


## Test

Deploy app:

    jets deploy

Grab the generated SQS queue url from the SQS console. Can test with [aws sqs send-message](https://docs.aws.amazon.com/cli/latest/reference/sqs/send-message.html). Example:

    QUEUE_URL=https://sqs.us-west-2.amazonaws.com/112233445566/demo-dev-HardJob-T634PZEAVH62-DeliverSqsQueue-47AEDK3P91CV
    aws sqs send-message --queue-url $QUEUE_URL --message-body '{"test": "hello world"}'

Check the Lambda function `demo-dev_hard-job_deliver` logs for the event payload.
