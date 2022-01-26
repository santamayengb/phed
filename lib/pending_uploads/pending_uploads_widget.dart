import '../auth/auth_util.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingUploadsWidget extends StatefulWidget {
  const PendingUploadsWidget({Key key}) : super(key: key);

  @override
  _PendingUploadsWidgetState createState() => _PendingUploadsWidgetState();
}

class _PendingUploadsWidgetState extends State<PendingUploadsWidget> {
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  String uploadedFileUrl3 = '';
  String uploadedFileUrl4 = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Text(
                'PENDING UPLOADS',
                style: FlutterFlowTheme.title3.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: InkWell(
              onTap: () async {
                await signOut();
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginWidget(),
                  ),
                  (r) => false,
                );
              },
              child: Icon(
                Icons.logout,
                color: FlutterFlowTheme.tertiaryColor,
                size: 30,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 32),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '21/3/2021',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                constraints: BoxConstraints(
                                  maxHeight: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                ),
                                child: Text(
                                  'Tomba Maichou Sanganp',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF303030),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    maxWidth: 300.00,
                                    maxHeight: 300.00,
                                    allowPhoto: true,
                                    backgroundColor:
                                        FlutterFlowTheme.primaryColor,
                                    textColor: FlutterFlowTheme.tertiaryColor,
                                  );
                                  if (selectedMedia != null &&
                                      validateFileFormat(
                                          selectedMedia.storagePath, context)) {
                                    showUploadMessage(
                                        context, 'Uploading file...',
                                        showLoading: true);
                                    final downloadUrl = await uploadData(
                                        selectedMedia.storagePath,
                                        selectedMedia.bytes);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    if (downloadUrl != null) {
                                      setState(
                                          () => uploadedFileUrl1 = downloadUrl);
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      showUploadMessage(
                                          context, 'Failed to upload media');
                                      return;
                                    }
                                  }
                                },
                                text: 'Add Photo',
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 120,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                    fontSize: 12,
                                  ),
                                  elevation: 4,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '23/3/2021',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                constraints: BoxConstraints(
                                  maxHeight: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                ),
                                child: Text(
                                  'Sawanui Kom',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF303030),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    maxWidth: 300.00,
                                    maxHeight: 300.00,
                                    allowPhoto: true,
                                    backgroundColor:
                                        FlutterFlowTheme.primaryColor,
                                    textColor: FlutterFlowTheme.tertiaryColor,
                                  );
                                  if (selectedMedia != null &&
                                      validateFileFormat(
                                          selectedMedia.storagePath, context)) {
                                    showUploadMessage(
                                        context, 'Uploading file...',
                                        showLoading: true);
                                    final downloadUrl = await uploadData(
                                        selectedMedia.storagePath,
                                        selectedMedia.bytes);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    if (downloadUrl != null) {
                                      setState(
                                          () => uploadedFileUrl2 = downloadUrl);
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      showUploadMessage(
                                          context, 'Failed to upload media');
                                      return;
                                    }
                                  }
                                },
                                text: 'Add Photo',
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 120,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                    fontSize: 12,
                                  ),
                                  elevation: 4,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '25/3/2021',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                constraints: BoxConstraints(
                                  maxHeight: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                ),
                                child: Text(
                                  'Hatnu Sanaganamf Pad',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF303030),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    maxWidth: 300.00,
                                    maxHeight: 300.00,
                                    allowPhoto: true,
                                    backgroundColor:
                                        FlutterFlowTheme.primaryColor,
                                    textColor: FlutterFlowTheme.tertiaryColor,
                                  );
                                  if (selectedMedia != null &&
                                      validateFileFormat(
                                          selectedMedia.storagePath, context)) {
                                    showUploadMessage(
                                        context, 'Uploading file...',
                                        showLoading: true);
                                    final downloadUrl = await uploadData(
                                        selectedMedia.storagePath,
                                        selectedMedia.bytes);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    if (downloadUrl != null) {
                                      setState(
                                          () => uploadedFileUrl3 = downloadUrl);
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      showUploadMessage(
                                          context, 'Failed to upload media');
                                      return;
                                    }
                                  }
                                },
                                text: 'Add Photo',
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 120,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                    fontSize: 12,
                                  ),
                                  elevation: 4,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '25/3/2021',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                constraints: BoxConstraints(
                                  maxHeight: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                ),
                                child: Text(
                                  'Ibotomba Meitei',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF303030),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    maxWidth: 300.00,
                                    maxHeight: 300.00,
                                    allowPhoto: true,
                                    backgroundColor:
                                        FlutterFlowTheme.primaryColor,
                                    textColor: FlutterFlowTheme.tertiaryColor,
                                  );
                                  if (selectedMedia != null &&
                                      validateFileFormat(
                                          selectedMedia.storagePath, context)) {
                                    showUploadMessage(
                                        context, 'Uploading file...',
                                        showLoading: true);
                                    final downloadUrl = await uploadData(
                                        selectedMedia.storagePath,
                                        selectedMedia.bytes);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    if (downloadUrl != null) {
                                      setState(
                                          () => uploadedFileUrl4 = downloadUrl);
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      showUploadMessage(
                                          context, 'Failed to upload media');
                                      return;
                                    }
                                  }
                                },
                                text: 'Add Photo',
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 120,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                    fontSize: 12,
                                  ),
                                  elevation: 4,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '27/3/2021',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                constraints: BoxConstraints(
                                  maxHeight: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                ),
                                child: Text(
                                  'Rakhi Laishram',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF303030),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Add Photo',
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 120,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                    fontSize: 12,
                                  ),
                                  elevation: 4,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '29/3/2021',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                constraints: BoxConstraints(
                                  maxHeight: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                ),
                                child: Text(
                                  'Tomba Maichou Sanganp',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF303030),
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Add Photo',
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 120,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                    fontSize: 12,
                                  ),
                                  elevation: 4,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
