import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/nonetoshow/nonetoshow_widget.dart';
import 'add_cred_widget.dart' show AddCredWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AddCredModel extends FlutterFlowModel<AddCredWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CreditsRecord> simpleSearchResults1 = [];
  List<CreditsRecord> simpleSearchResults2 = [];
  bool firestoreRequestCompleted = false;
  String? firestoreRequestLastUniqueKey;
  // Model for Nonetoshow component.
  late NonetoshowModel nonetoshowModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nonetoshowModel = createModel(context, () => NonetoshowModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    nonetoshowModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
