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

'use strict';

Blockly.Blocks['dobot_home'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_BASEIC_HOME);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_BASEIC_HOME_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_home'] = function(block) {
  // TODO: Assemble JavaScript into code variable.
  var code = 'dType.SetHOMECmdEx(api, 0, 1)\n';
  return code;
};

Blockly.Blocks['dobot_time'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_BASEIC_TIME);
    this.setInputsInline(true);
    this.setOutput(true, "Number");
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_BASEIC_TIME_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_time'] = function(block) {
  // TODO: Assemble JavaScript into code variable.
  var code = 'dType.gettime()[0]';
  return [code, Blockly.Python.ORDER_NONE];
};

Blockly.Blocks['dobot_selectendtype'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_BASEIC_SETENDTYPE)
        .appendField(new Blockly.FieldDropdown(
      [[Blockly.Msg.DOBOT_BASEIC_SETENDTYPE_SUCTIONCAP, "59.7"], 
      [Blockly.Msg.DOBOT_BASEIC_SETENDTYPE_GRIPPER, "59.701"], 
      [Blockly.Msg.DOBOT_BASEIC_SETENDTYPE_LASER, "70"], 
      [Blockly.Msg.DOBOT_BASEIC_SETENDTYPE_PEN, "61"]]), "type");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_BASEIC_SETENDTYPE_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_selectendtype'] = function(block) {
  var dropdown_type = block.getFieldValue('type');
  if(dropdown_type == "59.701")
      dropdown_type = "59.7";
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetEndEffectorParamsEx(api, '+dropdown_type+', 0, 0, 1)\n';
  return code;
};

Blockly.Blocks['dobot_SetEndEffectorParams'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_BASEIC_SETENDEFFECTORPARAMS);
    this.appendValueInput("xBias")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_xBias);
    this.appendValueInput("yBias")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_yBias);
    this.appendValueInput("zBias")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_zBias);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_BASEIC_SETENDEFFECTORPARAMS_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_SetEndEffectorParams'] = function(block) {
  var value_xbias = Blockly.Python.valueToCode(block, 'xBias', Blockly.Python.ORDER_ATOMIC) || 0.0;
  var value_ybias = Blockly.Python.valueToCode(block, 'yBias', Blockly.Python.ORDER_ATOMIC) || 0.0;
  var value_zbias = Blockly.Python.valueToCode(block, 'zBias', Blockly.Python.ORDER_ATOMIC) || 0.0;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetEndEffectorParamsEx(api, '+value_xbias+',  '+value_ybias+',  '+value_zbias+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_setptpjointparams'] = {
  init: function() {
    this.appendValueInput("Velocity")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_SET_JOINT_SPEED)
        .appendField(Blockly.Msg.DOBOT_VELOCITY);
    this.appendValueInput("Acceleration")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_ACCELERATION);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_JOINT_SPEED_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_setptpjointparams'] = function(block) {
  var vel = Blockly.Python.valueToCode(block, 'Velocity', Blockly.Python.ORDER_ATOMIC) || 20;
  var acc = Blockly.Python.valueToCode(block, 'Acceleration', Blockly.Python.ORDER_ATOMIC) || 50;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetPTPJointParamsEx(api,'+vel+','+acc+','
            +vel+','+acc+','
            +vel+','+acc+','
            +vel+','+acc+',1)\n';
  return code;
};

Blockly.Blocks['dobot_setptpoordinateparams'] = {
  init: function() {
    this.appendValueInput("Velocity")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_SET_COORDINATE_SPEED)
        .appendField(Blockly.Msg.DOBOT_VELOCITY);
    this.appendValueInput("Acceleration")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_ACCELERATION);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_COORDINATE_SPEED_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_setptpoordinateparams'] = function(block) {
  var vel = Blockly.Python.valueToCode(block, 'Velocity', Blockly.Python.ORDER_ATOMIC) || 20;
  var acc = Blockly.Python.valueToCode(block, 'Acceleration', Blockly.Python.ORDER_ATOMIC) || 50;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetPTPCoordinateParamsEx(api,'+vel+','+acc+','
            +vel+','+acc+',1)\n';
  return code;
};

Blockly.Blocks['dobot_setptplparams'] = {
  init: function() {
    this.appendValueInput("lVelocity")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_SET_L_SPEED)
        .appendField(Blockly.Msg.DOBOT_VELOCITY);
    this.appendValueInput("lAcceleration")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_ACCELERATION);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_JOINT_L_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};
Blockly.Python['dobot_setptplparams'] = function(block) {
  var value_lvelocity = Blockly.Python.valueToCode(block, 'lVelocity', Blockly.Python.ORDER_ATOMIC) || 20;
  var value_lacceleration = Blockly.Python.valueToCode(block, 'lAcceleration', Blockly.Python.ORDER_ATOMIC) || 50;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetPTPLParamsEx(api,'+value_lvelocity+','+value_lacceleration+',1)\n';
  return code;
};

Blockly.Blocks['dobot_setlinearspeed'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SET_LINEAR_SPEED);
    this.appendValueInput("velocity")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_VELOCITY_RATIO);
    this.appendValueInput("acceleration")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_ACCELERATION_RATIO);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip('');
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_setlinearspeed'] = function(block) {
  var value_velocity = Blockly.Python.valueToCode(block, 'velocity', Blockly.Python.ORDER_ATOMIC) || 20;
  var value_acceleration = Blockly.Python.valueToCode(block, 'acceleration', Blockly.Python.ORDER_ATOMIC) || 50;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetPTPCommonParamsEx(api,'+value_velocity+','+value_acceleration+',1)\n';
  return code;
};

Blockly.Blocks['dobot_setjumpheight'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SET_JUMP_HEIGHT);
    this.appendValueInput("height")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_height);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_JUMP_HEIGHT_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_setjumpheight'] = function(block) {
  var value_height = Blockly.Python.valueToCode(block, 'height', Blockly.Python.ORDER_ATOMIC) || 20;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetPTPJumpParamsEx(api,'+value_height+',100,1)\n';
  return code;
};
