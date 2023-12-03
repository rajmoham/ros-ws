// Auto-generated. Do not edit!

// (in-package second_coursework.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class MoveRobotRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.room = null;
    }
    else {
      if (initObj.hasOwnProperty('room')) {
        this.room = initObj.room
      }
      else {
        this.room = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveRobotRequest
    // Serialize message field [room]
    bufferOffset = _serializer.string(obj.room, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveRobotRequest
    let len;
    let data = new MoveRobotRequest(null);
    // Deserialize message field [room]
    data.room = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.room);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'second_coursework/MoveRobotRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e497569192cccb82020c3a5c262721b9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string room
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveRobotRequest(null);
    if (msg.room !== undefined) {
      resolved.room = msg.room;
    }
    else {
      resolved.room = ''
    }

    return resolved;
    }
};

class MoveRobotResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.has_reached = null;
    }
    else {
      if (initObj.hasOwnProperty('has_reached')) {
        this.has_reached = initObj.has_reached
      }
      else {
        this.has_reached = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveRobotResponse
    // Serialize message field [has_reached]
    bufferOffset = _serializer.bool(obj.has_reached, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveRobotResponse
    let len;
    let data = new MoveRobotResponse(null);
    // Deserialize message field [has_reached]
    data.has_reached = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'second_coursework/MoveRobotResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0f5b0660d01731c203012c6957666172';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool has_reached
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveRobotResponse(null);
    if (msg.has_reached !== undefined) {
      resolved.has_reached = msg.has_reached;
    }
    else {
      resolved.has_reached = false
    }

    return resolved;
    }
};

module.exports = {
  Request: MoveRobotRequest,
  Response: MoveRobotResponse,
  md5sum() { return 'd7f6bc17ab9cca7adaad06bf5bcb21cf'; },
  datatype() { return 'second_coursework/MoveRobot'; }
};
