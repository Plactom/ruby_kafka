require "kafka"

kafka = Kafka.new(["tiflux:9092"])

kafka.each_message(topic: "greetings") do |message|
  puts message.offset, message.key, message.value
end