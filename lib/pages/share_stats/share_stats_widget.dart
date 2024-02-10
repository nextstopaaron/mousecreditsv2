import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/shareconfirm/shareconfirm_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'share_stats_model.dart';
export 'share_stats_model.dart';

class ShareStatsWidget extends StatefulWidget {
  const ShareStatsWidget({
    super.key,
    required this.creditCount,
  });

  final double? creditCount;

  @override
  State<ShareStatsWidget> createState() => _ShareStatsWidgetState();
}

class _ShareStatsWidgetState extends State<ShareStatsWidget> {
  late ShareStatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShareStatsModel());

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
        height: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 215.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 245.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 245.0;
          } else {
            return 245.0;
          }
        }(),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).lineColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Stats',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                fontSize: 20.0,
                              ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                ],
              ),

              // This row exists for when the "app bar" is hidden on desktop, having a way back for the user can work well.
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Back',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        'As of ${dateTimeFormat('yMMMd', getCurrentTimestamp)}, you have  credit(s) and  badge(s). Your overall credit progress is ${formatNumber(
                          functions.calPercentage(
                              (currentUserDocument?.credits.toList() ?? [])
                                  .length
                                  .toDouble(),
                              widget.creditCount),
                          formatType: FormatType.percent,
                        )} and your cred status is ${functions.credStatus((currentUserDocument?.credits.toList() ?? []).length.toDouble(), valueOrDefault<double>(
                              widget.creditCount,
                              0.0,
                            ))}!',
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Clipboard.setData(ClipboardData(
                                text:
                                    'As of ${dateTimeFormat('yMMMd', getCurrentTimestamp)}, you have ${(currentUserDocument?.credits.toList() ?? []).length.toString()} credit(s) and  badge(s). Your credit progress is ${formatNumber(
                              functions.calPercentage(
                                  (currentUserDocument?.credits.toList() ?? [])
                                      .length
                                      .toDouble(),
                                  widget.creditCount),
                              formatType: FormatType.percent,
                            )} and your cred status is ${functions.credStatus((currentUserDocument?.credits.toList() ?? []).length.toDouble(), widget.creditCount)}!'));
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const ShareconfirmWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            Navigator.pop(context);
                          },
                          text: 'Share',
                          options: FFButtonOptions(
                            width: 165.0,
                            height: 35.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
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
    );
  }
}
