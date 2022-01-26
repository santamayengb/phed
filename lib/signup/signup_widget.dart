import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../list_beneficiaries_page/list_beneficiaries_page_widget.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  TextEditingController cnfpasswordController;
  bool cnfpasswordVisibility;
  TextEditingController emailAddressController;
  TextEditingController usernameController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    cnfpasswordController = TextEditingController();
    cnfpasswordVisibility = false;
    emailAddressController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'assets/images/phed-manipur.png',
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.15,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Depatment of ',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.title2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Public Health Engineering',
                              style: FlutterFlowTheme.title2.override(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Goverment of Manipur',
                              style: FlutterFlowTheme.subtitle1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: usernameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF2B343A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'Enter your name here...',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF95A1AC),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Color(0x5CFFFFFF),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 0, 24),
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF2B343A),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: TextFormField(
                                controller: emailAddressController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  labelStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  hintText: 'Enter your email here...',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x5CFFFFFF),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF2B343A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: !passwordVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  hintText: 'Enter your email here...',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x5CFFFFFF),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 24, 24, 24),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility =
                                          !passwordVisibility,
                                    ),
                                    child: Icon(
                                      passwordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF95A1AC),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF2B343A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: TextFormField(
                                controller: cnfpasswordController,
                                obscureText: !cnfpasswordVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  labelStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  hintText: 'Enter your email here...',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Color(0x5CFFFFFF),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 24, 24, 24),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => cnfpasswordVisibility =
                                          !cnfpasswordVisibility,
                                    ),
                                    child: Icon(
                                      cnfpasswordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF95A1AC),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF2B343A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (passwordController.text !=
                                      cnfpasswordController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Passwords don't match!",
                                        ),
                                      ),
                                    );
                                    return;
                                  }

                                  final user = await createAccountWithEmail(
                                    context,
                                    emailAddressController.text,
                                    passwordController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  final usersCreateData = createUsersRecordData(
                                    email: emailAddressController.text,
                                    createdTime: getCurrentTimestamp,
                                    displayName: usernameController.text,
                                  );
                                  await UsersRecord.collection
                                      .doc(user.uid)
                                      .update(usersCreateData);

                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ListBeneficiariesPageWidget(),
                                    ),
                                    (r) => false,
                                  );
                                },
                                text: 'Create new Account',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
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
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?  ',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xE8000000),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginWidget(),
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFFF0000),
                                ),
                              ),
                            ),
                          ],
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
