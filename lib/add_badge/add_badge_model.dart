import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_badge_widget.dart' show AddBadgeWidget;
import 'package:flutter/material.dart';

class AddBadgeModel extends FlutterFlowModel<AddBadgeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CreditsRecord? credRead;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
