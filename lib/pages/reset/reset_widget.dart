import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'reset_model.dart';
export 'reset_model.dart';

class ResetWidget extends StatefulWidget {
  const ResetWidget({super.key});

  @override
  State<ResetWidget> createState() => _ResetWidgetState();
}

class _ResetWidgetState extends State<ResetWidget> {
  late ResetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 150.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x3B1D2429),
              offset: Offset(0.0, -3.0),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          border: Border.all(
            color: FlutterFlowTheme.of(context).lineColor,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Archive your achievements and reset collecting?',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      final firestoreBatch = FirebaseFirestore.instance.batch();
                      try {
                        firestoreBatch.update(currentUserReference!, {
                          ...mapToFirestore(
                            {
                              'Archive': FieldValue.arrayUnion([
                                getArchiveFirestoreData(
                                  updateArchiveStruct(
                                    ArchiveStruct(
                                      badgeCount: valueOrDefault(
                                          currentUserDocument?.badgeCount, 0),
                                      archiveName: 'Test',
                                      archiveDate: getCurrentTimestamp,
                                      creditCount: valueOrDefault(
                                          currentUserDocument?.creditCount,
                                          0.0),
                                    ),
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                            },
                          ),
                        });

                        firestoreBatch.update(currentUserReference!, {
                          ...createUsersRecordData(
                            creditCount: 0.0,
                            badgeCount: 0,
                          ),
                          ...mapToFirestore(
                            {
                              'Credits': FieldValue.delete(),
                              'Badges': FieldValue.delete(),
                            },
                          ),
                        });
                        Navigator.pop(context);
                      } finally {
                        await firestoreBatch.commit();
                      }
                    },
                    text: 'Reset',
                    options: FFButtonOptions(
                      width: 150.0,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .labelSmall
                          .override(
                            fontFamily: 'Readex Pro',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                      elevation: 2.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pop();
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).labelSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
