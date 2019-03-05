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
Blockly.Blocks['dobot_linearRail'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SET_LINEAR_RAIL)
        .appendField(Blockly.Msg.DOBOT_ENABELD)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_OFF, "0"], [Blockly.Msg.DOBOT_ON, "1"]]), "enable")
        .appendField(Blockly.Msg.DOBOT_VERSION)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_OLD, "0"], [Blockly.Msg.DOBOT_NEW, "1"]]), "version");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_LINEAR_RAIL_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_linearRail'] = function(block) {
  var isEnable = block.getFieldValue('enable');
  var version = block.getFieldValue('version');
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetDeviceWithL(api, '+isEnable+', '+version+')\nmain.process.emit("CheckLinearRail", "")\n';
  return code;
};

Blockly.Blocks['dobot_conveyor'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SET_CONVEYOR)
        .appendField(Blockly.Msg.DOBOT_MOTOR)
        .appendField(new Blockly.FieldDropdown([["STEPPER1", "0"], ["STEPPER2", "1"]]), "io");
    this.appendValueInput("speed")
        .setCheck("Number")
        .appendField(Blockly.Msg.Dobot_Speed);
    this.appendDummyInput()
        .appendField("mm/s");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_CONVEYOR_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_conveyor'] = function(block) {
  var dropdown_io = block.getFieldValue('io');
  var speed = Blockly.Python.valueToCode(block, 'speed', Blockly.Python.ORDER_ATOMIC) || 50.0;
  var isEnable = (speed != 0) ? 1 : 0;
  // TODO: Assemble Python into code variable.
  var code = 'STEP_PER_CRICLE = 360.0 / 1.8 * 10.0 * 16.0\nMM_PER_CRICLE = 3.1415926535898 * 36.0\nvel = float('+speed+') * STEP_PER_CRICLE / MM_PER_CRICLE\ndType.SetEMotorEx(api, '+dropdown_io+', '+isEnable+', int(vel), 1)\n';
  return code;
};

Blockly.Blocks['dobot_setemotor'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SET_MOTOR)
        .appendField(Blockly.Msg.DOBOT_MOTOR)
        .appendField(new Blockly.FieldDropdown([["STEPPER1", "0"], ["STEPPER2", "1"]]), "io");
    this.appendValueInput("speed")
        .setCheck("Number")
        .appendField(Blockly.Msg.Dobot_Speed);
    this.appendDummyInput()
        .appendField("pulse/s");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_MOTOR_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_setemotor'] = function(block) {
  var dropdown_io = block.getFieldValue('io');
  var speed = Blockly.Python.valueToCode(block, 'speed', Blockly.Python.ORDER_ATOMIC) || 10000;
  var isEnable = (speed != 0) ? 1 : 0;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetEMotorEx(api, '+dropdown_io+', '+isEnable+', '+speed+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_setemotors'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SET_MOTORS)
        .appendField(Blockly.Msg.DOBOT_MOTOR)
        .appendField(new Blockly.FieldDropdown([["STEPPER1", "0"], ["STEPPER2", "1"]]), "io");
    this.appendValueInput("speed")
        .setCheck("Number")
        .appendField(Blockly.Msg.Dobot_Speed);
    this.appendDummyInput()
        .appendField("pulse/s");
    this.appendValueInput("distance")
        .setCheck("Number")
        .appendField(Blockly.Msg.Dobot_DISTANCE);
    this.appendDummyInput()
        .appendField("pulse");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_MOTORS_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_setemotors'] = function(block) {
  var dropdown_io = block.getFieldValue('io');
  var speed = Blockly.Python.valueToCode(block, 'speed', Blockly.Python.ORDER_ATOMIC) || 10000;
  var distance = Blockly.Python.valueToCode(block, 'distance', Blockly.Python.ORDER_ATOMIC) || 10000;
  var isEnable = (speed != 0 && distance > 0) ? 1 : 0;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetEMotorSEx(api, '+dropdown_io+', '+isEnable+', '+speed+', '+distance+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_get_adc'] = {
  init: function() {
    this.appendDummyInput("ioInput")
        .appendField(Blockly.Msg.DOBOT_GET_ADC)
        .appendField(new Blockly.FieldDropdown([["EIO01", "1"], ["EIO05", "5"], ["EIO07", "7"], ["EIO09", "9"], ["EIO12", "12"], ["EIO15", "15"]]), "io");
    this.setInputsInline(true);
    this.setInputsInline(true);
    this.setOutput(true, "Number");
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_GET_INPUT_EIO_TOOLTIP);
    this.setHelpUrl('http://www.example.com/');
    UpdateADCBlock(this);
  }
};

Blockly.Python['dobot_get_adc'] = function(block) {
  var dropdown_name = block.getFieldValue('io');
  // TODO: Assemble Python into code variable.
  var code = 'dType.GetIOADC(api, '+dropdown_name+')[0]';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Python.ORDER_NONE];
};

Blockly.Blocks['dobot_setiopwm'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_SET_PWM)
        .appendField(new Blockly.FieldDropdown([["EIO04", "4"], ["EIO06", "6"], ["EIO08", "8"], ["EIO11", "11"], ["EIO14", "14"]]), "io");
    this.appendValueInput("frequency")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_FREQUENCY);
    this.appendValueInput("dutyCycle")
        .setCheck("Number")
        .appendField(Blockly.Msg.DOBOT_DUTYCYCLE);
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_PWM_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_setiopwm'] = function(block) {
  var dropdown_io = block.getFieldValue('io');
  var frequency = Blockly.Python.valueToCode(block, 'frequency', Blockly.Python.ORDER_ATOMIC) || 1;
  var dutyCycle = Blockly.Python.valueToCode(block, 'dutyCycle', Blockly.Python.ORDER_ATOMIC) || 40;
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetIOPWMEx(api, '+dropdown_io+', '+frequency+', '+dutyCycle+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_getiopwm'] = {
  init: function() {
    this.appendDummyInput("ioInput")
        .appendField(Blockly.Msg.DOBOT_GET_PWM)
        .appendField(new Blockly.FieldDropdown([["EIO04", "4"], ["EIO06", "6"], ["EIO08", "8"], ["EIO11", "11"], ["EIO14", "14"]]), "io")
        .appendField(Blockly.Msg.DOBOT_Value, "text")
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_FREQUENCY, "0"], [Blockly.Msg.DOBOT_DUTYCYCLE, "1"]]), "value");
    this.setInputsInline(true);
    this.setOutput(true, "Number");
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_GET_PWM_TOOLTIP);
    this.setHelpUrl('http://www.example.com/');
    UpdatePWMBlock(this);
  }
};

Blockly.Python['dobot_getiopwm'] = function(block) {
  var dropdown_name = block.getFieldValue('io');
  var dropdown_value = block.getFieldValue('value');
  // TODO: Assemble Python into code variable.
  var code = 'dType.GetIOPWM(api, '+dropdown_name+')['+dropdown_value+']';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Python.ORDER_NONE];
};

Blockly.Blocks['dobot_get_input'] = {
  init: function() {
    this.appendDummyInput("ioInput")
        .appendField(Blockly.Msg.DOBOT_GET_INPUT_EIO)
       .appendField(new Blockly.FieldDropdown([["EIO01", "1"], ["EIO04", "4"], ["EIO5", "5"], ["EIO06", "6"], ["EIO07", "7"], ["EIO08", "8"], ["EIO09", "9"], ["EIO11", "11"], ["EIO12", "12"], ["EIO14", "14"], ["EIO15", "15"], ["EIO18", "18"], ["EIO19", "19"], ["EIO20", "20"]]), "io");
    this.setInputsInline(true);
    this.setInputsInline(true);
    this.setOutput(true, "Number");
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_GET_INPUT_EIO_TOOLTIP);
    this.setHelpUrl('http://www.example.com/');
    UpdateInput3VBlock(this);
  }
};

Blockly.Python['dobot_get_input'] = function(block) {
  var dropdown_name = block.getFieldValue('io');
  // TODO: Assemble Python into code variable.
  var code = 'dType.GetIODI(api, '+dropdown_name+')[0]';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Python.ORDER_NONE];
};

Blockly.Blocks['dobot_setiomultiplexing'] = {
  init: function() {
    this.appendDummyInput("ioInput")
        .appendField(Blockly.Msg.DOBOT_SET_IOMULTIPLEXING)
        .appendField(Blockly.Msg.DOBOT_type)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.Dobot_IO_INPUT_3V,   "1"], [Blockly.Msg.Dobot_IO_ADC,        "3"],
                                                [Blockly.Msg.Dobot_IO_OUTPUT_3V,  "4"], [Blockly.Msg.Dobot_IO_OUTPUT_5V,  "5"],
                                                [Blockly.Msg.Dobot_IO_OUTPUT_12V, "6"], [Blockly.Msg.Dobot_IO_PWM,        "7"]]), "value")
        .appendField("EIO", "text")
        .appendField(new Blockly.FieldDropdown([["EIO01", "1"], ["EIO02", "2"], ["EIO03", "3"], ["EIO04", "4"], ["EIO05", "5"], ["EIO06", "6"], ["EIO07", "7"], ["EIO08", "8"], ["EIO09", "9"], ["EIO10", "10"], ["EIO11", "11"], ["EIO12", "12"], ["EIO13", "13"], ["EIO14", "14"], ["EIO15", "15"], ["EIO16", "16"], ["EIO17", "17"], ["EIO18", "18"], ["EIO19", "19"], ["EIO20", "20"]], "dropdown"), "io");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_IOMULTIPLEXING_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
    UpdateMultiplexingBlock(this);
  }
};

Blockly.Python['dobot_setiomultiplexing'] = function(block) {
  var dropdown_io = block.getFieldValue('io');
  var dropdown_value = block.getFieldValue('value');
  
  switch(dropdown_value){
    case "1":
      dropdown_value = "3";
      break;
    case "3":
      dropdown_value = "4";
      break;
    case "4":
    case "5":
    case "6":
      dropdown_value = "1";
      break;
    case "7":
      dropdown_value = "2";
      break;
  }
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetIOMultiplexingEx(api, '+dropdown_io+', '+dropdown_value+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_set_output'] = {
  init: function() {
    this.appendDummyInput("ioInput")
        .appendField(Blockly.Msg.DOBOT_SET_OUTPUT)
        .appendField(new Blockly.FieldDropdown([["EIO01", "1"], ["EIO02", "2"], ["EIO03", "3"], ["EIO04", "4"], ["EIO05", "5"], ["EIO06", "6"], ["EIO07", "7"], ["EIO08", "8"], ["EIO09", "9"], ["EIO10", "10"], ["EIO11", "11"], ["EIO12", "12"], ["EIO13", "13"], ["EIO14", "14"], ["EIO15", "15"], ["EIO16", "16"], ["EIO17", "17"], ["EIO18", "18"], ["EIO19", "19"], ["EIO20", "20"]]), "io")
        .appendField(Blockly.Msg.DOBOT_value, "text")
        .appendField(new Blockly.FieldDropdown([["0", "0"], ["1", "1"]]), "value");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_OUTPUT_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
    UpdateOutput3VBlock(this);
  }
};

Blockly.Python['dobot_set_output'] = function(block) {
  var dropdown_io = block.getFieldValue('io');
  var dropdown_value = block.getFieldValue('value');
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetIODOEx(api, '+dropdown_io+', '+dropdown_value+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_set_output5V'] = {
  init: function() {
    this.appendDummyInput("ioInput")
        .appendField(Blockly.Msg.DOBOT_SET_OUTPUT5V)
        .appendField(new Blockly.FieldDropdown([["EIO02", "2"], ["EIO03", "3"], ["EIO16/SW01", "16"], ["EIO17/SW02", "17"]]), "io");
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_ENABELD)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_OFF, "0"], [Blockly.Msg.DOBOT_ON, "1"]]), "enable");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_OUTPUT5V_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
    UpdateInput5VBlock(this)
  }
};

Blockly.Python['dobot_set_output5V'] = function(block) {
  var dropdown_io = block.getFieldValue('io');
  var isEnable = block.getFieldValue('enable');
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetIODOEx(api, '+dropdown_io+', '+isEnable+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_set_output12V'] = {
  init: function() {
    this.appendDummyInput("ioInput")
        .appendField(Blockly.Msg.DOBOT_SET_OUTPUT12V)
        .appendField(new Blockly.FieldDropdown([["EIO02", "2"], ["EIO03", "3"], ["EIO16/SW01", "16"], ["EIO17/SW02", "17"]]), "io");
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_ENABELD)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_OFF, "0"], [Blockly.Msg.DOBOT_ON, "1"]]), "enable");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_OUTPUT12V_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_set_output12V'] = function(block) {
  var dropdown_io = block.getFieldValue('io');
  var isEnable = block.getFieldValue('enable');
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetIODOEx(api, '+dropdown_io+', '+isEnable+', 1)\n';
  return code;
};

Blockly.Blocks['dobot_get_12voutput'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_GET_12OUTPUT)
        .appendField(new Blockly.FieldDropdown([["EIO2", "2"], ["EIO3", "3"], ["EIO16", "16"], ["EIO17", "17"]]), "NAME");
    this.setInputsInline(true);
    this.setOutput(true, "Number");
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_GET_12OUTPUT_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_get_12voutput'] = function(block) {
  var dropdown_name = block.getFieldValue('NAME');
  // TODO: Assemble Python into code variable.
  var code = 'dType.GetIODI(api, '+dropdown_name+')[0]';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Python.ORDER_NONE];
};

Blockly.Blocks['dobot_set_colorseneor'] = {
  init: function() {
    this.appendDummyInput("input")
        .appendField(Blockly.Msg.DOBOT_SET_COLORSENEOR)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_OFF, "0"], [Blockly.Msg.DOBOT_ON, "1"]]), "io")
        .appendField(Blockly.Msg.DOBOT_VERSION)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_OLD, "0"], [Blockly.Msg.DOBOT_NEW, "1"]]), "version")
        .appendField(Blockly.Msg.DOBOT_PORT)
        .appendField(new Blockly.FieldDropdown([["GP1", "0"], ["GP2", "1"], ["GP4", "2"], ["GP5", "3"]]), "port");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_COLORSENEOR_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_set_colorseneor'] = function(block) {
  var isEnable = block.getFieldValue('io');
  var port = block.getFieldValue('port');
  var version = block.getFieldValue('version');
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetColorSensor(api, '+isEnable+' ,'+port+', '+version+')\n';
  // TODO: Change ORDER_NONE to the correct strength.
  return code;
};

Blockly.Blocks['dobot_SetInfraredSensor'] = {
  init: function() {
    this.appendDummyInput("input")
        .appendField(Blockly.Msg.DOBOT_SET_INFRARED_SENEOR)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_OFF, "0"], [Blockly.Msg.DOBOT_ON, "1"]]), "io")
        .appendField(Blockly.Msg.DOBOT_VERSION)
        .appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_OLD, "0"], [Blockly.Msg.DOBOT_NEW, "1"]]), "version")
        .appendField(Blockly.Msg.DOBOT_PORT)
        .appendField(new Blockly.FieldDropdown([["GP1", "0"], ["GP2", "1"],["GP4", "2"], ["GP5", "3"]]), "port");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_SET_INFRARED_SENEOR_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_SetInfraredSensor'] = function(block) {
  var isEnable = block.getFieldValue('io');
  var port = block.getFieldValue('port');
  var version = block.getFieldValue('version');
  // TODO: Assemble Python into code variable.
  var code = 'dType.SetInfraredSensor(api, '+isEnable+' ,'+port+', '+version+')\n';
  // TODO: Change ORDER_NONE to the correct strength.
  return code;
};

Blockly.Blocks['dobot_get_colorseneor'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_GET_COLORSENEOR)
        .appendField(new Blockly.FieldDropdown([["r", "0"], ["g", "1"], ["b", "2"]]), "NAME");
    this.setInputsInline(true);
    this.setOutput(true, "Number");
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_GET_COLORSENEOR_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_get_colorseneor'] = function(block) {
  var dropdown_name = block.getFieldValue('NAME');
  // TODO: Assemble Python into code variable.
  var code = 'dType.GetColorSensorEx(api, '+dropdown_name+')';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Python.ORDER_NONE];
};

Blockly.Blocks['dobot_GetInfraredSensor'] = {
  init: function() {
    this.appendDummyInput()
        .appendField(Blockly.Msg.DOBOT_GET_INFRARED_SENEOR)
        .appendField(new Blockly.FieldDropdown([["GP1", "0"], ["GP2", "1"],["GP4", "2"], ["GP5", "3"]]), "port");
    this.setInputsInline(true);
    this.setOutput(true, "Number");
    this.setColour(330);
    this.setTooltip(Blockly.Msg.DOBOT_GET_INFRARED_SENEOR_TOOLTIP);
    this.setHelpUrl('http://www.dobot.cc/');
  }
};

Blockly.Python['dobot_GetInfraredSensor'] = function(block) {
  var port = block.getFieldValue('port');
  // TODO: Assemble Python into code variable.
  var code = 'dType.GetInfraredSensor(api, '+port+')[0]';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Python.ORDER_NONE];
};

let LIST_IO = {
  //0.0.0版本
  INPUT_3V_0:  [["EIO01","1"],  ["EIO04","4"],  ["EIO05","5"],  ["EIO06","6"],  ["EIO07","7"],   ["EIO08","8"],    ["EIO09","9"],
                ["EIO11","11"], ["EIO12","12"], ["EIO14","14"], ["EIO15","15"], ["EIO18","18"],  ["EIO19","19"],   ["EIO20","20"]],
  ADC_0:       [["EIO01", "1"], ["EIO05", "5"], ["EIO07", "7"], ["EIO09", "9"], ["EIO12", "12"], ["EIO15", "15"]],
  OUTPUT_3V_0: [["EIO01","1"],  ["EIO04","4"],  ["EIO05","5"],  ["EIO06","6"],  ["EIO07","7"],   ["EIO08","8"],    ["EIO09","9"],
                ["EIO11","11"], ["EIO12","12"], ["EIO14","14"], ["EIO15","15"], ["EIO18","18"],  ["EIO19","19"],   ["EIO20","20"]],

  //1.0.0版本
  INPUT_3V_1:  [["EIO01","1"],  ["EIO05","5"],    ["EIO07","7"],  ["EIO09","9"],
                ["EIO12","12"], ["EIO14","14"],   ["EIO15","15"], ["EIO19","19"], ["EIO20","20"]],
  ADC_1:       [["EIO09", "9"], ["EIO15", "15"]],
  OUTPUT_3V_1: [["EIO04","4"],  ["EIO06","6"],    ["EIO08","8"],  ["EIO11","11"], ["EIO14","14"], ["EIO15","15"], ["EIO18","18"]],

  // 通用
  OUTPUT_5V:   [["EIO10","10"], ["EIO13","13"]],
  OUTPUT_12V:  [["EIO02","2"],  ["EIO03","3"],   ["EIO16/SW01","16"], ["EIO17/SW02","17"]],
  PWM:         [["EIO04","4"],  ["EIO06","6"],   ["EIO08","8"],       ["EIO11","11"],       ["EIO14","14"]]
}

function WorkspaceChanged(block, type, element, name, newValue)
{  
  if (type === Blockly.Events.CHANGE && element === 'field') {
    if (name === 'value')
      UpdateMultiplexingBlockIndexDrop(block, newValue);
    else if (name === 'version')
      UpdateColorOrInfraredDrop(block, newValue)
  }
}

function UpdateColorOrInfraredDrop(block, value)
{
  if (block.type != "dobot_set_colorseneor" && block.type != "dobot_SetInfraredSensor")
    return

  let colorInput = block.getInput("input");
  let tempPort = block.getFieldValue('port');
  colorInput.removeField("port");

  // 如果是新硬件加旧传感器，限定是GP2
  let listPort = (value === "0" && hwVersion === "1.0.0") 
                ? [["GP2", "1"]] 
                : [["GP1", "0"], ["GP2", "1"], ["GP4", "2"], ["GP5", "3"]]

  colorInput.appendField(new Blockly.FieldDropdown(listPort), "port");

  // 防止IOType重置后，IOIndex被改变
  listPort.forEach((port)=>
  {
    if (parseInt(port[1]) == tempPort)
    {
      block.setFieldValue(tempPort, 'port');
    }
  });
}

function UpdateMultiplexingBlockIndexDrop(block, value) 
{
  if (block.type != "dobot_setiomultiplexing")
    return
  let ioInput = block.getInput("ioInput");
  let ioIndex = block.getFieldValue('io');
  let listIOInfo = [["None","0"]];
  switch(value) {
    case "1": // Dobot_IO_INPUT_3V
      listIOInfo = hwVersion === "1.0.0" ? LIST_IO.INPUT_3V_1 : LIST_IO.INPUT_3V_0;
      break;
    case "3": // Dobot_IO_ADC
      listIOInfo = hwVersion === "1.0.0" ? LIST_IO.ADC_1 : LIST_IO.ADC_0;
      break
    case "4": // Dobot_IO_OUTPUT_3V
      listIOInfo = hwVersion === "1.0.0" ? LIST_IO.OUTPUT_3V_1 : LIST_IO.OUTPUT_3V_0;
      break
    case "5": // Dobot_IO_OUTPUT_5V
      listIOInfo = LIST_IO.OUTPUT_5V;
      break
    case "6": // Dobot_IO_OUTPUT_12V
      listIOInfo = LIST_IO.OUTPUT_12V;
      break
    case "7": // Dobot_IO_PWM
      listIOInfo = LIST_IO.PWM;
      break
  }
  ioInput.removeField("io")
  ioInput.appendField(new Blockly.FieldDropdown(listIOInfo),"io");

  // 防止IOType重置后，IOIndex被改变
  listIOInfo.forEach((ioInfo)=>
  {
    if (parseInt(ioInfo[1]) == ioIndex)
    {
      block.setFieldValue(ioIndex,'io');
    }
  });
};

function UpdateMultiplexingBlock(block)
{
  //根据硬件设置,IO类型，IOIndex会在事件回调中更新
  let ioInput = block.getInput("ioInput");
  let ioType = block.getFieldValue('value');
  let ioIndex = block.getFieldValue('io');
  ioInput.removeField("value")
  ioInput.removeField("text")
  ioInput.removeField("io")

  let listIOType = hwVersion === "1.0.0"
    ? [[Blockly.Msg.Dobot_IO_INPUT_3V,   "1"], [Blockly.Msg.Dobot_IO_ADC,        "3"],
       [Blockly.Msg.Dobot_IO_OUTPUT_3V,  "4"], [Blockly.Msg.Dobot_IO_OUTPUT_5V,  "5"],
       [Blockly.Msg.Dobot_IO_OUTPUT_12V, "6"], [Blockly.Msg.Dobot_IO_PWM,        "7"]]
    : [[Blockly.Msg.Dobot_IO_INPUT_3V,   "1"], [Blockly.Msg.Dobot_IO_ADC,        "3"],
       [Blockly.Msg.Dobot_IO_OUTPUT_3V,  "4"], [Blockly.Msg.Dobot_IO_OUTPUT_5V,  "5"],
       [Blockly.Msg.Dobot_IO_OUTPUT_12V, "6"], [Blockly.Msg.Dobot_IO_PWM,        "7"]];

  ioInput.appendField(new Blockly.FieldDropdown(listIOType), "value")
  ioInput.appendField("EIO", "text")
  ioInput.appendField(new Blockly.FieldDropdown(hwVersion === "1.0.0" ? LIST_IO.INPUT_3V_1 : LIST_IO.INPUT_3V_0), "io");

  listIOType.forEach((typeInfo)=>
  {
    if (parseInt(typeInfo[1]) == ioType)
    {
      block.setFieldValue(ioType,'value');
    }
  });
  block.setFieldValue(ioIndex,'io');
}

function UpdateOutput3VBlock(block)
{
  let ioInput = block.getInput("ioInput");
  let ioIndex = block.getFieldValue('io');
  let value   = block.getFieldValue('value');

  let listIOInfo = hwVersion === "1.0.0" ? LIST_IO.OUTPUT_3V_1 : LIST_IO.OUTPUT_3V_0;

  ioInput.removeField("value");
  ioInput.removeField("text");
  ioInput.removeField("io");

  ioInput.appendField(new Blockly.FieldDropdown(listIOInfo), "io");
  ioInput.appendField(Blockly.Msg.DOBOT_value, "text");
  ioInput.appendField(new Blockly.FieldDropdown([["0", "0"], ["1", "1"]]), "value");
  listIOInfo.forEach((ioInfo)=>
  {
    if (parseInt(ioInfo[1]) == ioIndex)
    {
      block.setFieldValue(ioIndex,'io');
    }
  });
  block.setFieldValue(value,'value');
}

function UpdateInput5VBlock(block)
{
  let ioInput = block.getInput("ioInput");
  let ioIndex = block.getFieldValue('io');

  ioInput.removeField("io");

  let listIOInfo = LIST_IO.OUTPUT_5V;

  ioInput.appendField(new Blockly.FieldDropdown(listIOInfo), "io");
  listIOInfo.forEach((ioInfo)=>
  {
    if (parseInt(ioInfo[1]) == ioIndex)
    {
      block.setFieldValue(ioIndex,'io');
    }
  });
}

function UpdateInput12VBlock(block)
{
  let ioInput = block.getInput("ioInput");
  let ioIndex = block.getFieldValue('io');

  ioInput.removeField("io");

  let listIOInfo = LIST_IO.OUTPUT_12V;

  ioInput.appendField(new Blockly.FieldDropdown(LIST_IO.OUTPUT_12V), "io");
  listIOInfo.forEach((ioInfo)=>
  {
    if (parseInt(ioInfo[1]) == ioIndex)
    {
      block.setFieldValue(ioIndex,'io');
    }
  });
}

function UpdatePWMBlock(block)
{
  let ioInput = block.getInput("ioInput");
  let ioIndex = block.getFieldValue('io');
  let value   = block.getFieldValue('value');

  ioInput.removeField("io");
  ioInput.removeField("text");
  ioInput.removeField("value");

  let listIOInfo = LIST_IO.PWM;

  ioInput.appendField(new Blockly.FieldDropdown(listIOInfo), "io");
  ioInput.appendField(Blockly.Msg.DOBOT_Value, "text");
  ioInput.appendField(new Blockly.FieldDropdown([[Blockly.Msg.DOBOT_FREQUENCY, "0"], [Blockly.Msg.DOBOT_DUTYCYCLE, "1"]]), "value");

  listIOInfo.forEach((ioInfo)=>
  {
    if (parseInt(ioInfo[1]) == ioIndex)
    {
      block.setFieldValue(ioIndex, 'io');
    }
  });
  block.setFieldValue(value, 'value');
}

function UpdateInput3VBlock(block)
{
  let ioInput = block.getInput("ioInput");
  let ioIndex = block.getFieldValue('io');

  ioInput.removeField("io");

  let listIOInfo = hwVersion === "1.0.0" ? LIST_IO.INPUT_3V_1 : LIST_IO.INPUT_3V_0;

  ioInput.appendField(new Blockly.FieldDropdown(listIOInfo), "io");
  listIOInfo.forEach((ioInfo)=>
  {
    if (parseInt(ioInfo[1]) == ioIndex)
    {
      block.setFieldValue(ioIndex, 'io');
    }
  });
}

function UpdateADCBlock(block)
{
  let ioInput = block.getInput("ioInput");
  let ioIndex = block.getFieldValue('io');

  ioInput.removeField("io")

  let listIOInfo = hwVersion === "1.0.0" ? LIST_IO.ADC_1 : LIST_IO.ADC_0;

  ioInput.appendField(new Blockly.FieldDropdown(listIOInfo), "io")
  listIOInfo.forEach((ioInfo)=>
  {
    if (parseInt(ioInfo[1]) == ioIndex)
    {
      block.setFieldValue(ioIndex,'io');
    }
  });
}

function UpdateIOBlock(block) {
  switch(block.type)
  {
  case "dobot_setiomultiplexing":
    UpdateMultiplexingBlock(block);
    break;
  case "dobot_get_input":
    UpdateInput3VBlock(block);
    break;
  case "dobot_get_adc":
    UpdateADCBlock(block);
    break;
  case "dobot_set_output":
    UpdateOutput3VBlock(block);
    break;
  case "dobot_set_output5V":
    UpdateInput5VBlock(block);
    break;
  case "dobot_set_output12V":
    UpdateInput12VBlock(block);
    break;
  case "dobot_getiopwm":
    UpdatePWMBlock(block);
    break;
  case "dobot_set_colorseneor":
  case "dobot_SetInfraredSensor":
    UpdateColorOrInfraredDrop(block, block.getFieldValue('version'))
  }
}
