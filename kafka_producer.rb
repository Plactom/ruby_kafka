require "kafka"

def get_message
  kafka = Kafka.new(["tiflux:9092"], client_id: "kafka-producer")
  producer = kafka.async_producer

  puts "send a message: "
  message = gets.chomp

  producer.produce(message, topic: "greetings")
  
  producer.deliver_messages

  if message == "exit"
    producer.shutdown
  else
    get_message
  end
end

get_message