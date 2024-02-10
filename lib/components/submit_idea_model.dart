import '/flutter_flow/flutter_flow_util.dart';
import 'submit_idea_widget.dart' show SubmitIdeaWidget;
import 'package:flutter/material.dart';

class SubmitIdeaModel extends FlutterFlowModel<SubmitIdeaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Describe widget.
  FocusNode? describeFocusNode;
  TextEditingController? describeController;
  String? Function(BuildContext, String?)? describeControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    describeFocusNode?.dispose();
    describeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
