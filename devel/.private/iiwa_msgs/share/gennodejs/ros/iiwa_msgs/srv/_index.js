
"use strict";

let SetPTPJointSpeedLimits = require('./SetPTPJointSpeedLimits.js')
let TimeToDestination = require('./TimeToDestination.js')
let SetWorkpiece = require('./SetWorkpiece.js')
let SetSmartServoJointSpeedLimits = require('./SetSmartServoJointSpeedLimits.js')
let SetSmartServoLinSpeedLimits = require('./SetSmartServoLinSpeedLimits.js')
let SetPTPCartesianSpeedLimits = require('./SetPTPCartesianSpeedLimits.js')
let SetEndpointFrame = require('./SetEndpointFrame.js')
let SetSpeedOverride = require('./SetSpeedOverride.js')
let ConfigureControlMode = require('./ConfigureControlMode.js')

module.exports = {
  SetPTPJointSpeedLimits: SetPTPJointSpeedLimits,
  TimeToDestination: TimeToDestination,
  SetWorkpiece: SetWorkpiece,
  SetSmartServoJointSpeedLimits: SetSmartServoJointSpeedLimits,
  SetSmartServoLinSpeedLimits: SetSmartServoLinSpeedLimits,
  SetPTPCartesianSpeedLimits: SetPTPCartesianSpeedLimits,
  SetEndpointFrame: SetEndpointFrame,
  SetSpeedOverride: SetSpeedOverride,
  ConfigureControlMode: ConfigureControlMode,
};
