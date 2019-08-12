// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Represent the JMS text message used to send and receive content from the a JMS provider.
#
# Most message-oriented middleware (MOM) products treat messages as lightweight entities that consist of a header
# and a body. The header contains fields used for message routing and identification; the body contains the
# application data being sent.
public type TextMessage client object {

    // Add a reference to the `AbstractMessage` object type.
    *AbstractMessage;

    handle jmsMessage = java:createNull();

    # Initialized a `TextMessage` object.
    #
    # + handle - The java reference to the jms text message.
    function __init(handle textMessage) {
        self.jmsMessage = textMessage;
    }

    # Set the text message.
    #
    # + return - If an error occurred while setting the message's data.
    public function setText(string data) returns error? {
        return setJmsText(self.jmsMessage, java:fromString(data));
    }

    # Get the text message.
    #
    # + return - Returns the message's data or an error if it fails.
    public function getText() returns string?|error {
        handle|error val = getJmsText(self.jmsMessage);
        if (val is handle) {
            return java:toString(val);
        } else {
            return val;
        }
    }

    # Acknowledges the reception of this message. This is used when the consumer has chosen CLIENT_ACKNOWLEDGE as its
    # acknowledgment mode.
    #
    # + return - If an error occurred while acknowledging the message.
    public remote function acknowledge() returns error? {
        return acknowledge(self.jmsMessage);
    }

    # Clears out the message body.
    #
    # + return - If an error occurred while clearing out the message properties.
    public function clearBody() returns error? {
        return clearBody(self.jmsMessage);
    }

    # Clears a message's properties.
    #
    # + return - If an error occurred while clearing out the message properties.
    public function clearProperties() returns error? {
        return clearProperties(self.jmsMessage);
    }

    # Get the given boolean property.
    #
    # + return - Returns the boolean value or an error if it fails.
    public function getBooleanProperty(string name) returns boolean | error? {
        return getBooleanProperty(self.jmsMessage, java:fromString(name));
    }

    # Get the given byte property.
    #
    # + return - Returns the byte value or an error if it fails.
    public function getByteProperty(string name) returns byte | error? {
        return getByteProperty(self.jmsMessage, java:fromString(name));
    }

    # Get the given double property.
    #
    # + return - Returns the double value or an error if it fails.
    public function getDoubleProperty(string name) returns float | error? {
        return getDoubleProperty(self.jmsMessage, java:fromString(name));
    }

    # Get the given float property.
    #
    # + return - Returns the float value or an error if it fails.
    public function getFloatProperty(string name) returns float | error? {
        return getFloatProperty(self.jmsMessage, java:fromString(name));
    }

    # Get the given int property.
    #
    # + return - Returns the int value or an error if it fails.
    public function getIntProperty(string name) returns int | error? {
        return getIntProperty(self.jmsMessage, java:fromString(name));
    }

    # Get the message correlation ID.
    #
    # + return - Returns the message correlation ID or an error if it fails.
    public function getJMSCorrelationID() returns string | error? {
        handle|error val = getJMSCorrelationID(self.jmsMessage);
        if (val is handle) {
            return java:toString(val);
        } else {
            return val;
        }
    }

    # Get the message correlation ID as an array of bytes.
    #
    # + return - Returns the message correlation ID as an byte array or an error if it fails.
    public function getJMSCorrelationIDAsBytes() returns byte[] | error? {
        return getJMSCorrelationIDAsBytes(self.jmsMessage);
    }

    # Get the message delivery mode.
    #
    # + return - Returns the message delivery mode or an error if it fails.
    public function getJMSDeliveryMode() returns int | error? {
        return getJMSDeliveryMode(self.jmsMessage);
    }

    # Get the message delivery time.
    #
    # + return - Returns the message delivery time or an error if it fails.
    public function getJMSDeliveryTime() returns int | error? {
        return getJMSDeliveryTime(self.jmsMessage);
    }

    # Get the message destination object.
    #
    # + return - Returns the message destination object or an error if it fails.
    public function getJMSDestination() returns Destination | error? {
        handle|error val = getJMSDestination(self.jmsMessage);
        if (val is handle) {
            [string, string] [destinationName, destinationType] = check toDestination(val);
            Destination destination = new(destinationName, destinationType, val);
            return destination;
        } else {
            return val;
        }
    }

    # Get the message expiration time.
    #
    # + return - Returns the message expiration time or an error if it fails.
    public function getJMSExpiration() returns int | error? {
        return getJMSExpiration(self.jmsMessage);
    }

    # Get the message ID.
    #
    # + return - Returns the message ID or an error if it fails.
    public function getJMSMessageID() returns string | error? {
        handle|error val = getJMSMessageID(self.jmsMessage);
        if (val is handle) {
            return java:toString(val);
        } else {
            return val;
        }
    }

    # Get the message priority.
    #
    # + return - Returns the message priority or an error if it fails.
    public function getJMSPriority() returns int | error? {
        return getJMSPriority(self.jmsMessage);
    }

    # Get an indication whether the message being redelivered.
    #
    # + return - Returns the message redelivered or an error if it fails.
    public function getJMSRedelivered() returns boolean | error? {
        return getJMSRedelivered(self.jmsMessage);
    }

    # Get the Destination object to which a reply to this message should be sent.
    #
    # + return - Returns the reply to destination or an error if it fails.
    public function getJMSReplyTo() returns Destination | error? {
        handle|error val = getJMSReplyTo(self.jmsMessage);
        if (val is handle) {
            [string, string] [destinationName, destinationType] = check toDestination(val);
            Destination destination = new(destinationName, destinationType, val);
            return destination;
        } else {
            return val;
        }
    }

    # Get the message timestamp.
    #
    # + return - Returns the message timestamp or an error if it fails.
    public function getJMSTimestamp() returns int | error? {
        return getJMSTimestamp(self.jmsMessage);
    }

    # Get the message type identifier.
    #
    # + return - Returns the message type or an error if it fails.
    public function getJMSType() returns string | error? {
        handle|error val = getJMSType(self.jmsMessage);
        if (val is handle) {
            return java:toString(val);
        } else {
            return val;
        }
    }

    # Get the given long property.
    #
    # + return - Returns the int value or an error if it fails.
    public function getLongProperty(string name) returns int | error? {
        return getLongProperty(self.jmsMessage, java:fromString(name));
    }

    # Get string array of property names.
    #
    # + return - Returns the string array of property names or an error if it fails.
    public function getPropertyNames() returns string[] | error? {
        return getPropertyNames(self.jmsMessage);
    }

    # Get the given short property.
    #
    # + return - Returns the int value or an error if it fails.
    public function getShortProperty(string name) returns int | error? {
        return getShortProperty(self.jmsMessage, java:fromString(name));
    }

    # Get the given string property.
    #
    # + return - Returns the string value or an error if it fails.
    public function getStringProperty(string name) returns string | error? {
        handle|error val = getStringProperty(self.jmsMessage, java:fromString(name));
        if (val is handle) {
            return java:toString(val);
        } else {
            return val;
        }
    }

    # Indicate whether a property value exists.
    #
    # + return - Returns true if the property exists or an error if it fails.
    public function propertyExists(string name) returns boolean | error? {
        return propertyExists(self.jmsMessage, java:fromString(name));
    }

    # Set the boolean value with the specified name into the message.
    #
    # + return - Returns an error if it fails.
    public function setBooleanProperty(string name, boolean value) returns error? {
        return setBooleanProperty(self.jmsMessage, java:fromString(name), value);
    }

    # Set the byte value with the specified name into the message.
    #
    # + return - Returns an error if it fails.
    public function setByteProperty(string name, byte value) returns error? {
        return setByteProperty(self.jmsMessage, java:fromString(name), value);
    }

    # Set the double value with the specified name into the message.
    #
    # + return - Returns an error if it fails.
    public function setDoubleProperty(string name, float value) returns error? {
        return setDoubleProperty(self.jmsMessage, java:fromString(name), value);
    }

    # Set the float value with the specified name into the message.
    #
    # + return - Returns an error if it fails.
    public function setFloatProperty(string name, float value) returns error? {
        return setFloatProperty(self.jmsMessage, java:fromString(name), value);
    }

    # Set the int value with the specified name into the message.
    #
    # + return - Returns an error if it fails.
    public function setIntProperty(string name, int value) returns error? {
        return setIntProperty(self.jmsMessage, java:fromString(name), value);
    }

    # Set the reply destination to the message which a reply should send.
    #
    # + return - Returns an error if it fails.
    public function setJMSReplyTo(Destination replyTo) returns error? {
        return setJMSReplyTo(self.jmsMessage, replyTo.getJmsDestination());
    }

    # Set the message type.
    #
    # + return - Returns an error if it fails.
    public function setJMSType(string jmsType) returns error? {
        return setJMSType(self.jmsMessage, java:fromString(jmsType));
    }

    # Set the long value with the specified name into the message.
    #
    # + return - Returns an error if it fails.
    public function setLongProperty(string name, int value) returns error? {
        return setLongProperty(self.jmsMessage, java:fromString(name), value);
    }

    # Set the short value with the specified name into the message.
    #
    # + return - Returns an error if it fails.
    public function setShortProperty(string name, int value) returns error? {
        return setShortProperty(self.jmsMessage, java:fromString(name), value);
    }

    # Set the string value with the specified name into the message.
    #
    # + return - Returns an error if it fails.
    public function setStringProperty(string name, string value) returns error? {
        return setStringProperty(self.jmsMessage, java:fromString(name), java:fromString(value));
    }

    # Get the JMS text message
    #
    # + return - Returns the java reference to the jms text message
    function getJmsMessage() returns handle {
        return self.jmsMessage;
    }

};

public function setJmsText(handle textMessage, handle data) returns error? = @java:Method {
    name: "setText",
    class: "javax.jms.TextMessage"
} external;

public function getJmsText(handle textMessage) returns handle | error = @java:Method {
    name: "getText",
    class: "javax.jms.TextMessage"
} external;