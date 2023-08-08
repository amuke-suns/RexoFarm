import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kAppPrimaryColor = Color(0xFF006E21);
const kAppSecondaryColor = Color(0xFFA8F5A5);
const kAppGreyColor = Color(0xFF767873);
const kDeepRed = Color(0xFFBA1A1A);

const kVehicleTypes = [
  'car',
  'motorcycle',
  'truck',
  'bicycle',
  'bus',
  'van',
  'suv',
  'electric',
  'tractor',
  'trailer',
  'reefer truck',
  'dump truck',
  'flatbed truck',
  'tanker truck',
  'harvesting machine',
  'forklift',
  'agricultural sprayer',
];

const kSuccessIcon = Icon(
  Icons.check_circle,
  color: kAppPrimaryColor,
);

const kErrorIcon = Icon(
  Icons.error,
  color: Colors.red,
);
