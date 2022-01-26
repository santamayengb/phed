import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPickerWidget extends StatefulWidget {
  const LocationPickerWidget({Key key}) : super(key: key);

  @override
  _LocationPickerWidgetState createState() => _LocationPickerWidgetState();
}

class _LocationPickerWidgetState extends State<LocationPickerWidget> {
  LatLng currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            color: FlutterFlowTheme.primaryColor,
          ),
        ),
      );
    }
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: [
          FlutterFlowGoogleMap(
            controller: googleMapsController,
            onCameraIdle: (latLng) => googleMapsCenter = latLng,
            initialLocation: googleMapsCenter ??= currentUserLocationValue,
            markerColor: GoogleMarkerColor.violet,
            mapType: MapType.normal,
            style: GoogleMapStyle.standard,
            initialZoom: 14,
            allowInteraction: true,
            allowZoom: true,
            showZoomControls: true,
            showLocation: true,
            showCompass: false,
            showMapToolbar: false,
            showTraffic: false,
            centerMapOnMarkerTap: true,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        currentUserLocationValue = await getCurrentUserLocation(
                            defaultLocation: LatLng(0.0, 0.0));
                        Navigator.pop(context);
                        setState(() =>
                            FFAppState().location = currentUserLocationValue);
                      },
                      text: 'Button',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
