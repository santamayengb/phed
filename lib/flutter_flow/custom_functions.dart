import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

LatLng getLocation(LatLng location) {
  if (location == null || (location.latitude == 0 && location.longitude == 0)) {
    return const LatLng(40.8295538, -73.9386429);
  }
  return location;
}

String getLocationForField(LatLng getLocation) {
  if (getLocation == null ||
      (getLocation.latitude == 0 && getLocation.longitude == 0)) {
    return ("not detected");
  }
  final String lat = getLocation.latitude.toString();
  final String long = getLocation.longitude.toString();
  return ('$lat, $long');
}

LatLng getLoca(LatLng getLocation) {
  if (getLocation == null ||
      (getLocation.latitude == 0 && getLocation.longitude == 0)) {
    return const LatLng(40.8295538, -73.9386429);
  }
  return getLocation;
}
