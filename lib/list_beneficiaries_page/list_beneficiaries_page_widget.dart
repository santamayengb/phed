import '../add_beneficiary/add_beneficiary_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ListBeneficiariesPageWidget extends StatefulWidget {
  const ListBeneficiariesPageWidget({Key key}) : super(key: key);

  @override
  _ListBeneficiariesPageWidgetState createState() =>
      _ListBeneficiariesPageWidgetState();
}

class _ListBeneficiariesPageWidgetState
    extends State<ListBeneficiariesPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'BENEFICIARIES',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBeneficiaryWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: StreamBuilder<List<BeneficiaryDetailsRecord>>(
          stream: queryBeneficiaryDetailsRecord(),
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
                listViewBeneficiaryDetailsRecordList = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: listViewBeneficiaryDetailsRecordList.length,
              itemBuilder: (context, listViewIndex) {
                final listViewBeneficiaryDetailsRecord =
                    listViewBeneficiaryDetailsRecordList[listViewIndex];
                return InkWell(
                  onLongPress: () async {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Delete'),
                          content: Text('Are you sure?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(alertDialogContext);
                                await listViewBeneficiaryDetailsRecord.reference
                                    .delete();
                                ;
                              },
                              child: Text('Confirm'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Slidable(
                    actionPane: const SlidableScrollActionPane(),
                    secondaryActions: [
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.blue,
                        icon: Icons.share,
                        onTap: () {
                          print('SlidableActionWidget pressed ...');
                        },
                      ),
                    ],
                    child: ListTile(
                      title: Text(
                        listViewBeneficiaryDetailsRecord.name,
                        style: FlutterFlowTheme.title3,
                      ),
                      subtitle: Text(
                        listViewBeneficiaryDetailsRecord.addres,
                        style: FlutterFlowTheme.subtitle2,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
