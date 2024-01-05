// Auto-generated. Do not edit!

// (in-package robotiq_2f_gripper_control.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class UnityGripperRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.open_close = null;
    }
    else {
      if (initObj.hasOwnProperty('open_close')) {
        this.open_close = initObj.open_close
      }
      else {
        this.open_close = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UnityGripperRequest
    // Serialize message field [open_close]
    bufferOffset = _serializer.bool(obj.open_close, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UnityGripperRequest
    let len;
    let data = new UnityGripperRequest(null);
    // Deserialize message field [open_close]
    data.open_close = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robotiq_2f_gripper_control/UnityGripperRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '802f192131aa6ac294b45abdc83414e0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool open_close #open 0 close 1
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new UnityGripperRequest(null);
    if (msg.open_close !== undefined) {
      resolved.open_close = msg.open_close;
    }
    else {
      resolved.open_close = false
    }

    return resolved;
    }
};

class UnityGripperResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.gripper_state = null;
    }
    else {
      if (initObj.hasOwnProperty('gripper_state')) {
        this.gripper_state = initObj.gripper_state
      }
      else {
        this.gripper_state = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UnityGripperResponse
    // Serialize message field [gripper_state]
    bufferOffset = _serializer.string(obj.gripper_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UnityGripperResponse
    let len;
    let data = new UnityGripperResponse(null);
    // Deserialize message field [gripper_state]
    data.gripper_state = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.gripper_state.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robotiq_2f_gripper_control/UnityGripperResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8e18dd67c0dc955135b296c7abccdd08';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string gripper_state
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new UnityGripperResponse(null);
    if (msg.gripper_state !== undefined) {
      resolved.gripper_state = msg.gripper_state;
    }
    else {
      resolved.gripper_state = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: UnityGripperRequest,
  Response: UnityGripperResponse,
  md5sum() { return 'b8f9390b552cf214da09ba18942db4b9'; },
  datatype() { return 'robotiq_2f_gripper_control/UnityGripper'; }
};
