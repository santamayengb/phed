import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/lat_lng.dart';
import '../flutter_flow/upload_media.dart';
import '../location_picker/location_picker_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddBeneficiaryWidget extends StatefulWidget {
  const AddBeneficiaryWidget({
    Key key,
    this.location,
  }) : super(key: key);

  final LatLng location;

  @override
  _AddBeneficiaryWidgetState createState() => _AddBeneficiaryWidgetState();
}

class _AddBeneficiaryWidgetState extends State<AddBeneficiaryWidget> {
  LatLng currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String genderFieldValue;
  TextEditingController nameFieldController;
  TextEditingController addressFieldController;
  TextEditingController fatherFieldController;
  String radioButtonValue;
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  String uploadedFileUrl3 = '';

  @override
  void initState() {
    super.initState();
    addressFieldController = TextEditingController();
    nameFieldController = TextEditingController();
    fatherFieldController = TextEditingController();
  }

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
        List<BeneficiaryDetailsRecord>
            addBeneficiaryBeneficiaryDetailsRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final addBeneficiaryBeneficiaryDetailsRecord =
            addBeneficiaryBeneficiaryDetailsRecordList.isNotEmpty
                ? addBeneficiaryBeneficiaryDetailsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              'Add Beneficiary Details',
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
                  TextFormField(
                    controller: nameFieldController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  Text(
                    'Gender',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  FlutterFlowDropDown(
                    options: ['Male', 'Female'].toList(),
                    onChanged: (val) => setState(() => genderFieldValue = val),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    textStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    elevation: 2,
                    borderColor: Colors.transparent,
                    borderWidth: 0,
                    borderRadius: 0,
                    margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    hidesUnderline: true,
                  ),
                  Text(
                    'Address',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  TextFormField(
                    controller: addressFieldController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  Divider(
                    height: 30,
                  ),
                  Text(
                    'Father name',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  TextFormField(
                    controller: fatherFieldController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  Divider(
                    height: 30,
                    color: Color(0x42878787),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Geo Location',
                        style: FlutterFlowTheme.bodyText1,
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationPickerWidget(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.place,
                          color: Color(0xFF1DA400),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    functions.getLocationForField(
                        addBeneficiaryBeneficiaryDetailsRecord.getLocation),
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  Text(
                    'schems',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                  FlutterFlowRadioButton(
                    options: ['Jal jeevan yojna'],
                    onChanged: (value) {
                      setState(() => radioButtonValue = value);
                    },
                    optionHeight: 25,
                    textStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                    buttonPosition: RadioButtonPosition.left,
                    direction: Axis.horizontal,
                    radioButtonColor: Colors.blue,
                    inactiveRadioButtonColor: Color(0x42878787),
                    toggleable: false,
                    horizontalAlignment: WrapAlignment.start,
                    verticalAlignment: WrapCrossAlignment.start,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Photos',
                        style: FlutterFlowTheme.bodyText1,
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
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      maxWidth: 100.00,
                                      maxHeight: 100.00,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        validateFileFormat(
                                            selectedMedia.storagePath,
                                            context)) {
                                      showUploadMessage(
                                          context, 'Uploading file...',
                                          showLoading: true);
                                      final downloadUrl = await uploadData(
                                          selectedMedia.storagePath,
                                          selectedMedia.bytes);
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      if (downloadUrl != null) {
                                        setState(() =>
                                            uploadedFileUrl1 = downloadUrl);
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        showUploadMessage(
                                            context, 'Failed to upload media');
                                        return;
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/images.png',
                                        ).image,
                                      ),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: uploadedFileUrl1,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      maxWidth: 100.00,
                                      maxHeight: 100.00,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        validateFileFormat(
                                            selectedMedia.storagePath,
                                            context)) {
                                      showUploadMessage(
                                          context, 'Uploading file...',
                                          showLoading: true);
                                      final downloadUrl = await uploadData(
                                          selectedMedia.storagePath,
                                          selectedMedia.bytes);
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      if (downloadUrl != null) {
                                        setState(() =>
                                            uploadedFileUrl2 = downloadUrl);
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        showUploadMessage(
                                            context, 'Failed to upload media');
                                        return;
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/images.png',
                                        ).image,
                                      ),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: uploadedFileUrl2,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      maxWidth: 100.00,
                                      maxHeight: 100.00,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        validateFileFormat(
                                            selectedMedia.storagePath,
                                            context)) {
                                      showUploadMessage(
                                          context, 'Uploading file...',
                                          showLoading: true);
                                      final downloadUrl = await uploadData(
                                          selectedMedia.storagePath,
                                          selectedMedia.bytes);
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      if (downloadUrl != null) {
                                        setState(() =>
                                            uploadedFileUrl3 = downloadUrl);
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        showUploadMessage(
                                            context, 'Failed to upload media');
                                        return;
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/images.png',
                                        ).image,
                                      ),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: uploadedFileUrl3,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: LatLng(0.0, 0.0));
                            final beneficiaryDetailsCreateData =
                                createBeneficiaryDetailsRecordData(
                              name: nameFieldController.text,
                              addres: addressFieldController.text,
                              gender: genderFieldValue,
                              fatherName: fatherFieldController.text,
                              schem: radioButtonValue,
                              getLocation: currentUserLocationValue,
                            );
                            await BeneficiaryDetailsRecord.collection
                                .doc()
                                .set(beneficiaryDetailsCreateData);
                            Navigator.pop(context);
                          },
                          text: 'SUBMIT',
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
            ),
          ),
        );
      },
    );
  }
}
