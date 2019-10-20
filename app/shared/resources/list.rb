class List < Jets::Stack
  sqs_queue(:dead_letter)
end
