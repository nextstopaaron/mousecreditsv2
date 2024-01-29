import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/share_badge_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: const [
                            ChipData('Easy'),
                            ChipData('Medium'),
                            ChipData('Hard')
                          ],
                          onChanged: (val) => setState(
                              () => _model.choiceChipsValue = val?.first),
                          selectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 10.0,
                            elevation: 0.0,
                            borderColor: FlutterFlowTheme.of(context).lineColor,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: const Color(0x00000000),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 10.0,
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          chipSpacing: 12.0,
                          rowSpacing: 12.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          wrapped: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child:
                      PagedListView<DocumentSnapshot<Object?>?, BadgesRecord>(
                    pagingController: _model.setListViewController(
                      BadgesRecord.collection.where(
                        'Challenge',
                        isEqualTo: _model.choiceChipsValue,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<BadgesRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ),
                      // Customize what your widget looks like when it's loading another page.
                      newPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewBadgesRecord = _model
                            .listViewPagingController!.itemList![listViewIndex];
                        return Visibility(
                          visible: (currentUserDocument?.badges.toList() ?? [])
                                  .contains(listViewBadgesRecord.reference) ==
                              false,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 12.0),
                            child: AuthUserStreamWidget(
                              builder: (context) =>
                                  StreamBuilder<List<CreditsRecord>>(
                                stream: queryCreditsRecord(
                                  queryBuilder: (creditsRecord) =>
                                      creditsRecord.where(
                                    'Badges',
                                    arrayContains:
                                        listViewBadgesRecord.reference,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<CreditsRecord>
                                      containerCreditsRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width: double.infinity,
                                    constraints: const BoxConstraints(
                                      maxWidth: 570.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AlignedTooltip(
                                                      content: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  4.0),
                                                          child: Text(
                                                            listViewBadgesRecord
                                                                .name,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge,
                                                          )),
                                                      offset: 4.0,
                                                      preferredDirection:
                                                          AxisDirection.down,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      elevation: 4.0,
                                                      tailBaseWidth: 24.0,
                                                      tailLength: 12.0,
                                                      waitDuration: const Duration(
                                                          milliseconds: 100),
                                                      showDuration: const Duration(
                                                          milliseconds: 1500),
                                                      triggerMode:
                                                          TooltipTriggerMode
                                                              .tap,
                                                      child: Text(
                                                        listViewBadgesRecord
                                                            .name
                                                            .maybeHandleOverflow(
                                                          maxChars: 20,
                                                          replacement: '…',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge,
                                                      ),
                                                    ),
                                                    AlignedTooltip(
                                                      content: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  4.0),
                                                          child: Text(
                                                            listViewBadgesRecord
                                                                .description,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge,
                                                          )),
                                                      offset: 4.0,
                                                      preferredDirection:
                                                          AxisDirection.down,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      elevation: 4.0,
                                                      tailBaseWidth: 24.0,
                                                      tailLength: 12.0,
                                                      waitDuration: const Duration(
                                                          milliseconds: 100),
                                                      showDuration: const Duration(
                                                          milliseconds: 1500),
                                                      triggerMode:
                                                          TooltipTriggerMode
                                                              .tap,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          listViewBadgesRecord
                                                              .description
                                                              .maybeHandleOverflow(
                                                            maxChars: 25,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Credits Required:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if ((currentUserDocument?.badges
                                                              .toList() ??
                                                          [])
                                                      .contains(
                                                          listViewBadgesRecord
                                                              .reference) ==
                                                  false)
                                                FFButtonWidget(
                                                  onPressed: !functions.arraycheck(
                                                          (currentUserDocument
                                                                      ?.credits
                                                                      .toList() ??
                                                                  [])
                                                              .map((e) => e.id)
                                                              .toList(),
                                                          listViewBadgesRecord
                                                              .credReq
                                                              .map((e) => e.id)
                                                              .toList())!
                                                      ? null
                                                      : () async {
                                                          await listViewBadgesRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'Users': FieldValue
                                                                    .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                              },
                                                            ),
                                                          });

                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'Badges': FieldValue
                                                                    .arrayUnion([
                                                                  listViewBadgesRecord
                                                                      .reference
                                                                ]),
                                                              },
                                                            ),
                                                          });

                                                          await listViewBadgesRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'Popularity':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              },
                                                            ),
                                                          });
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      ShareBadgeWidget(
                                                                    badge:
                                                                        listViewBadgesRecord
                                                                            .name,
                                                                    description:
                                                                        listViewBadgesRecord
                                                                            .description,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                  text: 'Add Badge',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              fontSize: 8.0,
                                                            ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .lineColor,
                                                    disabledTextColor:
                                                        const Color(0x65666666),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 5.0, 16.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final containerVar =
                                                      containerCreditsRecordList
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
                                                        containerVar.length,
                                                        (containerVarIndex) {
                                                      final containerVarItem =
                                                          containerVar[
                                                              containerVarIndex];
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
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (containerVarItem
                                                                    .users
                                                                    .contains(
                                                                        currentUserReference) ==
                                                                true)
                                                              Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                                size: 18.0,
                                                              ),
                                                            if (containerVarItem
                                                                    .users
                                                                    .contains(
                                                                        currentUserReference) ==
                                                                false)
                                                              Icon(
                                                                Icons
                                                                    .not_interested,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                size: 18.0,
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Text(
                                                                containerVarItem
                                                                    .name
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 20,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed: ((currentUserDocument?.credits.toList() ??
                                                                              [])
                                                                          .contains(
                                                                              containerVarItem.reference) ==
                                                                      true)
                                                                  ? null
                                                                  : () async {
                                                                      // Add User

                                                                      await containerVarItem
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'Users':
                                                                                FieldValue.arrayUnion([
                                                                              currentUserReference
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      // Add Credit

                                                                      await currentUserReference!
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'Credits':
                                                                                FieldValue.arrayUnion([
                                                                              containerVarItem.reference
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      // Update Popularity

                                                                      await containerVarItem
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'Popularity':
                                                                                FieldValue.increment(1),
                                                                          },
                                                                        ),
                                                                      });
                                                                      // Remove Favorite

                                                                      await currentUserReference!
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'Favorites':
                                                                                FieldValue.arrayRemove([
                                                                              containerVarItem.reference
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      // Remove Credit from Favorite

                                                                      await containerVarItem
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'Favorites':
                                                                                FieldValue.arrayRemove([
                                                                              currentUserReference
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });

                                                                      await currentUserReference!
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'CreditCount':
                                                                                FieldValue.increment(1),
                                                                          },
                                                                        ),
                                                                      });
                                                                    },
                                                              text:
                                                                  'Add Credit',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 23.0,
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          8.0,
                                                                    ),
                                                                elevation: 3.0,
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
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ).animateOnPageLoad(
                          animationsMap['listViewOnPageLoadAnimation']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
