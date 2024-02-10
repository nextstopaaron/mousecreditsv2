import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/confirm_badge/confirm_badge_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'add_badge_model.dart';
export 'add_badge_model.dart';

class AddBadgeWidget extends StatefulWidget {
  const AddBadgeWidget({super.key});

  @override
  State<AddBadgeWidget> createState() => _AddBadgeWidgetState();
}

class _AddBadgeWidgetState extends State<AddBadgeWidget>
    with TickerProviderStateMixin {
  late AddBadgeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 150.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 170.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddBadgeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('Home');
            },
          ),
          title: Text(
            'Add Badges',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: StreamBuilder<BadgesRecord>(
                      stream:
                          BadgesRecord.getDocument(FFAppState().BadgeDocRef!),
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
                        final listViewBadgesRecord = snapshot.data!;
                        return ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final badgeList =
                                      listViewBadgesRecord.badgeMap.toList();
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(badgeList.length,
                                        (badgeListIndex) {
                                      final badgeListItem =
                                          badgeList[badgeListIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 12.0),
                                        child: Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 570.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              badgeListItem
                                                                  .imageURL,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              AlignedTooltip(
                                                                content:
                                                                    Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(
                                                                                4.0),
                                                                        child:
                                                                            Text(
                                                                          badgeListItem
                                                                              .name,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyLarge,
                                                                        )),
                                                                offset: 4.0,
                                                                preferredDirection:
                                                                    AxisDirection
                                                                        .down,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                elevation: 4.0,
                                                                tailBaseWidth:
                                                                    24.0,
                                                                tailLength:
                                                                    12.0,
                                                                waitDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            100),
                                                                showDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1500),
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .tap,
                                                                child: Text(
                                                                  badgeListItem
                                                                      .name
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        20,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge,
                                                                ),
                                                              ),
                                                              AlignedTooltip(
                                                                content:
                                                                    Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(
                                                                                4.0),
                                                                        child:
                                                                            Text(
                                                                          badgeListItem
                                                                              .description,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyLarge,
                                                                        )),
                                                                offset: 4.0,
                                                                preferredDirection:
                                                                    AxisDirection
                                                                        .down,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                elevation: 4.0,
                                                                tailBaseWidth:
                                                                    24.0,
                                                                tailLength:
                                                                    12.0,
                                                                waitDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            100),
                                                                showDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1500),
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .tap,
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    badgeListItem
                                                                        .description
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          25,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (functions.arraycheckStr(
                                                                badgeListItem
                                                                    .name,
                                                                (currentUserDocument
                                                                            ?.badges
                                                                            .toList() ??
                                                                        [])
                                                                    .map((e) =>
                                                                        e.name)
                                                                    .toList()) ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Text(
                                                                'Added!',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (!functions.arraycheckStr(
                                                            badgeListItem.name,
                                                            (currentUserDocument
                                                                        ?.badges
                                                                        .toList() ??
                                                                    [])
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList())!)
                                                          Builder(
                                                            builder: (context) =>
                                                                AuthUserStreamWidget(
                                                              builder: (context) =>
                                                                  FFButtonWidget(
                                                                onPressed: !functions.arraycheck(
                                                                        (currentUserDocument?.credits.toList() ??
                                                                                [])
                                                                            .map((e) => e
                                                                                .name)
                                                                            .toList(),
                                                                        badgeListItem
                                                                            .credReq
                                                                            .toList())!
                                                                    ? null
                                                                    : () async {
                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'Badges': FieldValue.arrayUnion([
                                                                                getUserBadgeFirestoreData(
                                                                                  updateUserBadgeStruct(
                                                                                    UserBadgeStruct(
                                                                                      description: badgeListItem.description,
                                                                                      location: badgeListItem.location,
                                                                                      name: badgeListItem.name,
                                                                                      badgeUID: badgeListItem.uid,
                                                                                      timeAdded: getCurrentTimestamp,
                                                                                      imageURL: badgeListItem.imageURL,
                                                                                      credReqCounter: badgeListItem.credReq.length,
                                                                                    ),
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                  true,
                                                                                )
                                                                              ]),
                                                                              'BadgeCount': FieldValue.increment(1),
                                                                            },
                                                                          ),
                                                                        });
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: ConfirmBadgeWidget(
                                                                                  badgename: badgeListItem.name,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                text:
                                                                    'Add Badge',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        fontSize:
                                                                            8.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  disabledColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                  disabledTextColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Credits Required:',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 5.0, 16.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        final credReqList =
                                                            badgeListItem
                                                                .credReq
                                                                .toList();
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: List.generate(
                                                              credReqList
                                                                  .length,
                                                              (credReqListIndex) {
                                                            final credReqListItem =
                                                                credReqList[
                                                                    credReqListIndex];
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (functions.arraycheckStr(
                                                                          credReqListItem,
                                                                          (currentUserDocument?.credits.toList() ?? [])
                                                                              .map((e) => e.name)
                                                                              .toList()) ??
                                                                      true)
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                  if (!functions.arraycheckStr(
                                                                      credReqListItem,
                                                                      (currentUserDocument?.credits.toList() ??
                                                                              [])
                                                                          .map((e) =>
                                                                              e.name)
                                                                          .toList())!)
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Icon(
                                                                        Icons
                                                                            .not_interested,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      credReqListItem
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            20,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      _model.credRead =
                                                                          await CreditsRecord.getDocumentOnce(
                                                                              FFAppState().CreditDocRef!);

                                                                      await currentUserReference!
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'Credits':
                                                                                FieldValue.arrayUnion([
                                                                              getUserCreditFirestoreData(
                                                                                updateUserCreditStruct(
                                                                                  UserCreditStruct(
                                                                                    name: credReqListItem,
                                                                                    location: (_model.credRead?.creditMap[credReqListIndex])?.location,
                                                                                    timeAdded: getCurrentTimestamp,
                                                                                    creditUID: (_model.credRead?.creditMap[credReqListIndex])?.uid,
                                                                                    type: (_model.credRead?.creditMap[credReqListIndex])?.type,
                                                                                  ),
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                true,
                                                                              )
                                                                            ]),
                                                                            'CreditCount':
                                                                                FieldValue.increment(1.0),
                                                                          },
                                                                        ),
                                                                      });

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'Add Credit',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          23.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['listViewOnPageLoadAnimation']!);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
