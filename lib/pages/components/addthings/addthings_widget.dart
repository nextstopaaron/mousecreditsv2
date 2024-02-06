import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addthings_model.dart';
export 'addthings_model.dart';

class AddthingsWidget extends StatefulWidget {
  const AddthingsWidget({super.key});

  @override
  State<AddthingsWidget> createState() => _AddthingsWidgetState();
}

class _AddthingsWidgetState extends State<AddthingsWidget> {
  late AddthingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddthingsModel());

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
      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: FutureBuilder<int>(
        future: FFAppState().creditCount(
          requestFn: () => queryCreditsRecordCount(),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          int containerCount = snapshot.data!;
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 270.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).secondary,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(25.0, 5.0, 25.0, 20.0),
              child: FutureBuilder<int>(
                future: queryBadgesRecordCount(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  int columnCount = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 15.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => FFButtonWidget(
                            onPressed:
                                ((currentUserDocument?.credits.toList() ?? [])
                                            .length ==
                                        containerCount)
                                    ? null
                                    : () async {
                                        context.pushNamed('AddCred');

                                        Navigator.pop(context);
                                      },
                            text: 'Add Credits',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 45.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Color(0x004F4F4F),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              disabledColor:
                                  FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 15.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('AddBadge');

                            Navigator.pop(context);
                          },
                          text: 'Add Badges',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 45.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Color(0x004F4F4F),
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 15.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => FFButtonWidget(
                            onPressed:
                                (((currentUserDocument?.credits.toList() ?? [])
                                                .length ==
                                            containerCount) ||
                                        ((currentUserDocument?.favorites
                                                        .toList() ??
                                                    [])
                                                .length ==
                                            containerCount))
                                    ? null
                                    : () async {
                                        context.pushNamed('AddCred');

                                        Navigator.pop(context);
                                      },
                            text: 'Add Favorites',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 45.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Color(0x004F4F4F),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              disabledColor:
                                  FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
