import '/flutter_flow/flutter_flow_util.dart';
import 'testing_widget.dart' show TestingWidget;
import 'package:flutter/material.dart';

class TestingModel extends FlutterFlowModel<TestingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - genUID] action in Button widget.
  String? genUID;
  // Stores action output result for [Custom Action - genUID] action in Button widget.
  String? genUID2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
