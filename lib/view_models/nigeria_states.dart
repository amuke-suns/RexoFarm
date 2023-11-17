// nigeria_states.dart

import 'dart:ui';

import 'package:flutter/material.dart';

class NigeriaState {
  final String name;
  final TextStyle? textStyle;


  NigeriaState(this.name, {TextStyle? textStyle})
      : textStyle = textStyle ??
            const TextStyle(
              color: Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            );
}

final List<NigeriaState> statesInNigeria = [
  NigeriaState('Abia'),
  NigeriaState('Adamawa'),
  NigeriaState('Akwa Ibom'),
  NigeriaState('Anambra'),
  NigeriaState('Bauchi'),
  NigeriaState('Bayelsa'),
  NigeriaState('Benue'),
  NigeriaState('Borno'),
  NigeriaState('Cross River'),
  NigeriaState('Delta'),
  NigeriaState('Ebonyi'),
  NigeriaState('Edo'),
  NigeriaState('Ekiti'),
NigeriaState('Enugu'),
NigeriaState('FCT - Abuja'),
NigeriaState('Gombe'),
NigeriaState('Imo'),
NigeriaState('Jigawa'),
NigeriaState('Kaduna'),
NigeriaState('Kano'),
NigeriaState('Katsina'),
NigeriaState('Kebbi'),
NigeriaState('Kogi'),
NigeriaState('Kwara'),
NigeriaState('Lagos'),
NigeriaState('Nasarawa'),
NigeriaState('Niger'),
NigeriaState('Ogun'),
NigeriaState('Ondo'),
NigeriaState('Osun'),
NigeriaState('Oyo'),
NigeriaState('Plateau'),
NigeriaState('Rivers'),
NigeriaState('Sokoto'),
NigeriaState('Taraba'),
NigeriaState('Yobe'),
NigeriaState('Zamfara'),
  // Add more states here as NigeriaState objects
];
