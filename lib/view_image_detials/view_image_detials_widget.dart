import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ViewImageDetialsWidget extends StatefulWidget {
  const ViewImageDetialsWidget({Key key}) : super(key: key);

  @override
  _ViewImageDetialsWidgetState createState() => _ViewImageDetialsWidgetState();
}

class _ViewImageDetialsWidgetState extends State<ViewImageDetialsWidget> {
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Image details',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: FlutterFlowExpandedImageView(
                      image: Image.asset(
                        'assets/images/Jal-Jeevan-Mission.png',
                        fit: BoxFit.contain,
                      ),
                      allowRotation: false,
                      tag: 'image',
                      useHeroAnimation: true,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: 'image',
                transitionOnUserGestures: true,
                child: Image.asset(
                  'assets/images/Jal-Jeevan-Mission.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Text(
                    'World Environment Day',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Date of Catureed: 21 may 2021',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Time of Catured: 10:30am',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FlutterFlowGoogleMap(
                controller: googleMapsController,
                onCameraIdle: (latLng) => googleMapsCenter = latLng,
                initialLocation: googleMapsCenter ??=
                    LatLng(13.106061, -59.613158),
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
            ),
          ],
        ),
      ),
    );
  }
}
