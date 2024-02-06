import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Home widget.
  List<CreditsRecord>? creditsMasterQuery;

  /// Query cache managers for this widget.

  final _latestCollectedManager =
      StreamRequestManager<List<CreditDetailsRecord>>();
  Stream<List<CreditDetailsRecord>> latestCollected({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CreditDetailsRecord>> Function() requestFn,
  }) =>
      _latestCollectedManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLatestCollectedCache() => _latestCollectedManager.clear();
  void clearLatestCollectedCacheKey(String? uniqueKey) =>
      _latestCollectedManager.clearRequest(uniqueKey);

  final _latestAvailableManager = StreamRequestManager<List<CreditsRecord>>();
  Stream<List<CreditsRecord>> latestAvailable({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CreditsRecord>> Function() requestFn,
  }) =>
      _latestAvailableManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLatestAvailableCache() => _latestAvailableManager.clear();
  void clearLatestAvailableCacheKey(String? uniqueKey) =>
      _latestAvailableManager.clearRequest(uniqueKey);

  final _rankingsManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> rankings({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _rankingsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRankingsCache() => _rankingsManager.clear();
  void clearRankingsCacheKey(String? uniqueKey) =>
      _rankingsManager.clearRequest(uniqueKey);

  final _popularityQueryManager = StreamRequestManager<List<CreditsRecord>>();
  Stream<List<CreditsRecord>> popularityQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CreditsRecord>> Function() requestFn,
  }) =>
      _popularityQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPopularityQueryCache() => _popularityQueryManager.clear();
  void clearPopularityQueryCacheKey(String? uniqueKey) =>
      _popularityQueryManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearLatestCollectedCache();

    clearLatestAvailableCache();

    clearRankingsCache();

    clearPopularityQueryCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
