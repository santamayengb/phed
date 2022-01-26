import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../list_beneficiaries_page/list_beneficiaries_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPageWidget extends StatefulWidget {
  const LocationPageWidget({Key key}) : super(key: key);

  @override
  _LocationPageWidgetState createState() => _LocationPageWidgetState();
}

class _LocationPageWidgetState extends State<LocationPageWidget> {
  String dropDownValue1;
  String dropDownValue2;
  String dropDownValue3;
  String dropDownValue4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'CHOOSE LOCATION',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 16),
                child: FlutterFlowDropDown(
                  options: [
                    'Sawombung CD Block',
                    'Heingang CD Block',
                    'Khetrigao CD Block',
                    'Keirao CD Block'
                  ].toList(),
                  onChanged: (val) => setState(() => dropDownValue1 = val),
                  width: double.infinity,
                  height: 50,
                  textStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  hintText: 'Block',
                  fillColor: Colors.white,
                  elevation: 2,
                  borderColor: Color(0x1C323232),
                  borderWidth: 1,
                  borderRadius: 4,
                  margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                  hidesUnderline: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: FlutterFlowDropDown(
                  options: [
                    'Haraorou Tangkham G.P',
                    'Khundrakpam G.P',
                    'Makeng Dolaithabi G.P',
                    'Nongren Chingnungkok G.P',
                    'Pukhao G.P',
                    'Pungdongbam G.P',
                    'Sawombung G.P'
                  ].toList(),
                  onChanged: (val) => setState(() => dropDownValue2 = val),
                  width: double.infinity,
                  height: 50,
                  textStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  hintText: 'Gram Panchayat',
                  fillColor: Colors.white,
                  elevation: 2,
                  borderColor: Color(0x1C323232),
                  borderWidth: 1,
                  borderRadius: 4,
                  margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                  hidesUnderline: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: FlutterFlowDropDown(
                  options: [
                    'Matakhong',
                    'Porompat Kshetri  Leikai',
                    'Porompat Mutum Leikai',
                    'Top Naoriya'
                  ].toList(),
                  onChanged: (val) => setState(() => dropDownValue3 = val),
                  width: double.infinity,
                  height: 50,
                  textStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  hintText: 'Village',
                  fillColor: Colors.white,
                  elevation: 2,
                  borderColor: Color(0x1C323232),
                  borderWidth: 1,
                  borderRadius: 4,
                  margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                  hidesUnderline: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: FlutterFlowDropDown(
                  options: [
                    'Khanarok (Khandrok)',
                    'Thiyam Konjil',
                    'Chanam Sandrok',
                    'Phunan Maring'
                  ].toList(),
                  onChanged: (val) => setState(() => dropDownValue4 = val),
                  width: double.infinity,
                  height: 50,
                  textStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  hintText: 'Habitation (Leikai)',
                  fillColor: Colors.white,
                  elevation: 2,
                  borderColor: Color(0x1C323232),
                  borderWidth: 1,
                  borderRadius: 4,
                  margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                  hidesUnderline: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListBeneficiariesPageWidget(),
                      ),
                    );
                  },
                  text: 'SHOW BENEFICIARIES',
                  options: FFButtonOptions(
                    width: double.infinity,
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
                    borderRadius: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
