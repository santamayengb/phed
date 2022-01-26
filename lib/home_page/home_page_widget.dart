import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_benefeciary/edit_benefeciary_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/lat_lng.dart';
import '../flutter_flow/place.dart';
import '../view_image_detials/view_image_detials_widget.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key key,
    this.geoLocation,
  }) : super(key: key);

  final LatLng geoLocation;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var placePickerValue = FFPlace();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BeneficiaryDetailsRecord>>(
      stream: queryBeneficiaryDetailsRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
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
        List<BeneficiaryDetailsRecord> homePageBeneficiaryDetailsRecordList =
            snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final homePageBeneficiaryDetailsRecord =
            homePageBeneficiaryDetailsRecordList.isNotEmpty
                ? homePageBeneficiaryDetailsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              'Beneficiary details',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: FaIcon(
                  FontAwesomeIcons.userEdit,
                  color: Color(0xFFDEDEDE),
                  size: 25,
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditBenefeciaryWidget(),
                    ),
                  );
                },
              ),
            ],
            centerTitle: false,
            elevation: 4,
          ),
          backgroundColor: Color(0xFFEEEEEE),
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Beneficiary  name',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  Text(
                    'Haven Mckinney',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF010101),
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 30,
                  ),
                  Text(
                    'Gender',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  Text(
                    'Male',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF010101),
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 30,
                  ),
                  Text(
                    'Address',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  Text(
                    '11/a, Dontad Cross Lane, Nr Mugal Palace Hotel, Dongri',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF010101),
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 30,
                  ),
                  Text(
                    'Father name',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  Text(
                    'Brigham Jordan',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF010101),
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 30,
                  ),
                  Text(
                    'schems',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  Text(
                    'Jal Jeevan Mission',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF010101),
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    height: 30,
                  ),
                  Text(
                    'Geo Location',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        functions.getLocationForField(widget.geoLocation),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF010101),
                          fontSize: 18,
                        ),
                      ),
                      FlutterFlowPlacePicker(
                        iOSGoogleMapsApiKey:
                            'AIzaSyAhQvuqx0QGF5AzA1aRE5L7E1MOxk9-8Mk',
                        androidGoogleMapsApiKey:
                            'AIzaSyBzVhcMAOglcjsjOWUa5YoKh--tRuBMNog',
                        webGoogleMapsApiKey:
                            'AIzaSyB_dIonI5tCEIfHOsnltqlUvMRIeTDKjN0',
                        onSelect: (place) =>
                            setState(() => placePickerValue = place),
                        defaultText: 'pick location',
                        icon: Icon(
                          Icons.place,
                          color: Colors.white,
                          size: 16,
                        ),
                        buttonOptions: FFButtonOptions(
                          height: 40,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final beneficiaryDetailsUpdateData =
                              createBeneficiaryDetailsRecordData(
                            name: '',
                          );
                          await homePageBeneficiaryDetailsRecord.reference
                              .update(beneficiaryDetailsUpdateData);
                        },
                        child: Icon(
                          Icons.location_on,
                          color: Color(0xFF23753C),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Photos',
                        style: FlutterFlowTheme.bodyText1,
                      ),
                      Text(
                        'view all',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFD32F2F),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: GridView(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ViewImageDetialsWidget(),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'image',
                                    transitionOnUserGestures: true,
                                    child: Image.asset(
                                      'assets/images/Jal-Jeevan-Mission.png',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Image.network(
                                  '',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Image.network(
                                  '',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Image.network(
                                  '',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Image.network(
                                  '',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Image.network(
                                  '',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
