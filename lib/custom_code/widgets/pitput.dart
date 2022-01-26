// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:pinput/pin_put/pin_put.dart';

class Pitput extends StatefulWidget {
  const Pitput({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _PitputState createState() => _PitputState();
}

class _PitputState extends State<Pitput> {
  @override
  Widget build(BuildContext context) {
    return PinPut(
      fieldsCount: 6,
      focusNode: FocusNode(),
      withCursor: true,
      textStyle: const TextStyle(fontSize: 25.0, color: Colors.green),
      eachFieldWidth: 55.0,
      eachFieldHeight: 55.0,
      pinAnimationType: PinAnimationType.fade,
      submittedFieldDecoration: BoxDecoration(
        color: Colors.green.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15.0),
      ),
      selectedFieldDecoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: const Color.fromRGBO(126, 203, 224, 1),
        ),
      ),
      followingFieldDecoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
    );
  }
}
