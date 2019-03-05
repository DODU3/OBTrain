/**
 * Blockly Demos: Block Factory Blocks
 *
 * Copyright 2012 Google Inc.
 * https://developers.google.com/blockly/
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @fileoverview Blocks for Blockly's Block Factory application.
 * @author fraser@google.com (Neil Fraser)
 */
//Blockly.Python.definitions_['import_random'] = 'import random';
'use strict';

Blockly.Blocks['dobot_goto'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_GOTO);
    this.appendValueInput("xBias")
        .setCheck("Number")
        .appendField("X");
    this.appendValueInput("yBias")
        .setCheck("Number")
        .appendField("Y");
    this.appendValueInput("zBias")
        .setCheck("Number")
        .appendField("Z");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_GOTO_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_goto'] = function(block) {
  var value_xbias = Blockly.Python.valueToCode(block, 'xBias', Blockly.Python.ORDER_ATOMIC) || 208;
  var value_ybias = Blockly.Python.valueToCode(block, 'yBias', Blockly.Python.ORDER_ATOMIC) || 0.0;
  var value_zbias = Blockly.Python.valueToCode(block, 'zBias', Blockly.Python.ORDER_ATOMIC) || 0.0;
  // TODO: Assemble Python into code variable.
  var code = 'current_pose = dType.GetPose(api)\ndType.SetPTPCmdEx(api, 2, '+value_xbias+',  '+value_ybias+',  '+value_zbias+', current_pose[3], 1)\n';
  return code;
};

Blockly.Blocks['dobot_jumpto'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_JUMPTO);
    this.appendValueInput("xBias")
        .setCheck("Number")
        .appendField("X");
    this.appendValueInput("yBias")
        .setCheck("Number")
        .appendField("Y");
    this.appendValueInput("zBias")
        .setCheck("Number")
        .appendField("Z");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_JUMPTO_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_jumpto'] = function(block) {
  var value_xbias = Blockly.Python.valueToCode(block, 'xBias', Blockly.Python.ORDER_ATOMIC) || 208;
  var value_ybias = Blockly.Python.valueToCode(block, 'yBias', Blockly.Python.ORDER_ATOMIC) || 0.0;
  var value_zbias = Blockly.Python.valueToCode(block, 'zBias', Blockly.Python.ORDER_ATOMIC) || 0.0;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetPTPCmdEx(api, 0, '+value_xbias+',  '+value_ybias+',  '+value_zbias+', 0, 1)\n';
  return code;
};

Blockly.Blocks['dobot_move'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_MOVE);
    this.appendValueInput("xBias")
        .setCheck("Number")
        .appendField("ΔX");
    this.appendValueInput("yBias")
        .setCheck("Number")
        .appendField("ΔY");
    this.appendValueInput("zBias")
        .setCheck("Number")
        .appendField("ΔZ");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_MOVE_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_move'] = function(block) {
  var value_xbias = Blockly.Python.valueToCode(block, 'xBias', Blockly.Python.ORDER_ATOMIC) || 0.0;
  var value_ybias = Blockly.Python.valueToCode(block, 'yBias', Blockly.Python.ORDER_ATOMIC) || 0.0;
  var value_zbias = Blockly.Python.valueToCode(block, 'zBias', Blockly.Python.ORDER_ATOMIC) || 0.0;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetPTPCmdEx(api, 7, '+value_xbias+',  '+value_ybias+',  '+value_zbias+', 0, 1)\n';
  return code;
};

Blockly.Blocks['dobot_setr'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SETR);
    this.appendValueInput("R")
        .setCheck("Number")
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SETR_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_setr'] = function(block) {
  var value_zbias = Blockly.Python.valueToCode(block, 'R', Blockly.Python.ORDER_ATOMIC) || 0.0;
  // TODO: Assemble Python into code variable.
  var code = 'current_pose = dType.GetPose(api)\ndType.SetPTPCmdEx(api, 4, current_pose[4], current_pose[5], current_pose[6], '+value_zbias+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_setl'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SETL);
    this.appendValueInput("L")
        .setCheck("Number")
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SETL_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_setl'] = function(block) {
  var value_zbias = Blockly.Python.valueToCode(block, 'L', Blockly.Python.ORDER_ATOMIC) || 0.0;
  // TODO: Assemble Python into code variable.
  var code = 'current_pose = dType.GetPose(api)\ndType.SetPTPWithLCmdEx(api, 1, current_pose[0], current_pose[1], current_pose[2], current_pose[3], '+value_zbias+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_setjointangle'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SET_JOINT_ANGLE);
    this.appendValueInput("Joint1")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_j1);
    this.appendValueInput("Joint2")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_j2);
    this.appendValueInput("Joint3")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_j3);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_JOINT_ANGLE_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_setjointangle'] = function(block) {
  var value_xbias = Blockly.Python.valueToCode(block, 'Joint1', Blockly.Python.ORDER_ATOMIC) || 0.0;
  var value_ybias = Blockly.Python.valueToCode(block, 'Joint2', Blockly.Python.ORDER_ATOMIC) || 0.0;
  var value_zbias = Blockly.Python.valueToCode(block, 'Joint3', Blockly.Python.ORDER_ATOMIC) || 0.0;
  // TODO: Assemble Python into code variable.
  var code = 'current_pose = dType.GetPose(api)\ndType.SetPTPCmdEx(api, 4, '+value_xbias+',  '+value_ybias+',  '+value_zbias+', current_pose[7], 1)\n';
  return code;
};

Blockly.Blocks['dobot_laser'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_LASER)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_ON, "1"], [Blockly.Msg.DOBOT_OFF, "0"]]), "enable");
    this.appendValueInput("power")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_POWER);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_LASER_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_laser'] = function(block) {
  var isEnable = block.getFieldValue('enable');
  var power = Blockly.Python.valueToCode(block, 'power', Blockly.Python.ORDER_ATOMIC) || 50;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetEndEffectorLaserEx(api, '+isEnable+', '+power+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_pump'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SUCTIONCAP)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_ON, "1"], [Blockly.Msg.DOBOT_OFF, "0"]]), "io");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SUCTIONCAP_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_pump'] = function(block) {
  var dropdown_io = block.getFieldValue('io');
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetEndEffectorSuctionCupEx(api, '+dropdown_io+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_gripper'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_GRIPPER)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_GripperON, "1"], [Blockly.Msg.DOBOT_GripperOff, "2"], [Blockly.Msg.DOBOT_OFF, "0"]]), "io");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_GRIPPER_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_gripper'] = function(block) {
  var dropdown_io = block.getFieldValue('io');
  // TODO: Assemble Python into code variable.
  var code = '';
  if(dropdown_io == 1)
    code = 'dType.SetEndEffectorGripperEx(api, 1, 1)\n';
  else if(dropdown_io == 2)
    code = 'dType.SetEndEffectorGripperEx(api, 1, 0)\n';
  else if(dropdown_io == 0)
    code = 'dType.SetEndEffectorGripperEx(api, 0, 0)\n';
  return code;
};

Blockly.Blocks['dobot_get_current_coordinate'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_GET_CURRETN_COORDINATE)
        .appendField(new Blockly.FieldDropdown([["x", "1"], ["y", "2"], ["z", "3"], ["r", "4"]]), "value");
    this.setInputsInline(true);
    this.setOutput(true, "Number");
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_GET_CURRETN_COORDINATE_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_get_current_coordinate'] = function(block) {
  var dropdown_value = block.getFieldValue('value');
  // TODO: Assemble Python into code variable.
  var code = 'dType.GetPoseEx(api, '+dropdown_value+')';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Python.ORDER_NONE];
};

Blockly.Blocks['dobot_get_joint_angle'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_GET_CURRENT_ANGLE)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_joint1, "5"], [Blockly.Msg.DOBOT_joint2, "6"], [Blockly.Msg.DOBOT_joint3, "7"], [Blockly.Msg.DOBOT_joint4, "8"],["l", "0"]]), "value");
    this.setInputsInline(true);
    this.setOutput(true, "Number");
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_GET_CURRENT_ANGLE_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_get_joint_angle'] = function(block) {
  var dropdown_value = block.getFieldValue('value');
  // TODO: Assemble Python into code variable.
  var code = 'dType.GetPoseEx(api, '+dropdown_value+')';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Python.ORDER_NONE];
};

Blockly.Blocks['dobot_delaytime'] = {
  init: function() {
    this.appendValueInput("time")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_DELAYTIME);
    this.appendDummyInput()
        .appendField("s");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_DELAYTIME_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_delaytime'] = function(block) {
  var value_time = Blockly.Python.valueToCode(block, 'time', Blockly.Python.ORDER_ATOMIC) || 0.5;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetWAITCmdEx(api, '+value_time+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_SetLostStepParams'] = {
  init: function() {
    this.appendValueInput("threshold")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_SETLOSTSTEPPARAMS_TOOLTIP);
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_ANGLEUNIT);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SETLOSTSTEPPARAMS_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_SetLostStepParams'] = function(block) {
  var value_threshold = Blockly.Python.valueToCode(block, 'threshold', Blockly.Python.ORDER_ATOMIC) || 0.5;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetLostStepParams(api, '+value_threshold+')\n';
  return code;
};

Blockly.Blocks['dobot_SetLostStepCmd'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SETLOSTSTEPCMD_TOOLTIP);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SETLOSTSTEPCMD_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_SetLostStepCmd'] = function(block) {
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetLostStepCmdEx(api, 1)\n';
  return code; 
};

