import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cred_drop_down_model.dart';
export 'cred_drop_down_model.dart';

class CredDropDownWidget extends StatefulWidget {
  const CredDropDownWidget({super.key});

  @override
  State<CredDropDownWidget> createState() => _CredDropDownWidgetState();
}

class _CredDropDownWidgetState extends State<CredDropDownWidget> {
  late CredDropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CredDropDownModel());

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

    return StreamBuilder<CreditsRecord>(
      stream: CreditsRecord.getDocument(FFAppState().CreditDocRef!),
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
        final credSearchCreditsRecord = snapshot.data!;
        return FlutterFlowDropDown<String>(
          controller: _model.credSearchValueController ??=
              FormFieldController<String>(null),
          options: credSearchCreditsRecord.creditMap
              .map((e) => e.name)
              .toList()
              .sortedList((e) => e),
          onChanged: (val) => setState(() => _model.credSearchValue = val),
          width: 300.0,
          height: 50.0,
          searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium,
          searchTextStyle: FlutterFlowTheme.of(context).bodyMedium,
          textStyle: FlutterFlowTheme.of(context).bodyMedium,
          hintText: 'Please select...',
          searchHintText: 'Search for an item...',
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 2.0,
          borderColor: FlutterFlowTheme.of(context).alternate,
          borderWidth: 2.0,
          borderRadius: 8.0,
          margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
          hidesUnderline: true,
          isOverButton: true,
          isSearchable: true,
          isMultiSelect: false,
        );
      },
    );
  }
}
