import ballerinax/rabbitmq;
import ballerina/log;

// Configurable variables for RabbitMQ connection
configurable string rabbitmqHost = ?;
configurable int rabbitmqPort = ?;
configurable string rabbitmqUsername = ?;
configurable string rabbitmqPassword = ?;
configurable string rabbitmqVirtualHost = ?;

// RabbitMQ client for publishing messages
rabbitmq:Client rabbitmqClient = check new (rabbitmqHost, rabbitmqPort,
    username = rabbitmqUsername,
    password = rabbitmqPassword,
    virtualHost = rabbitmqVirtualHost
);

// Automation: publishes a message to the RabbitMQ queue
public function main() returns error? {
    rabbitmq:AnydataMessage publishMessage = {
        content: "Hello, RabbitMQ!",
        routingKey: "myQueue"
    };
    check rabbitmqClient->publishMessage(publishMessage);
    log:printInfo("Message published successfully to queue: myQueue");
}
