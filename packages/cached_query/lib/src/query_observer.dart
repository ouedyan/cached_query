import 'package:cached_query/src/mutation/mutation_state.dart';

import '../cached_query.dart';

/// Query Observer
///
/// Observe state changes in every query and mutation.
abstract class QueryObserver {
  /// Called when a mutation is created in the cache
  void onMutationCreation(
    Mutation<dynamic, dynamic> query,
  ) {}

  /// Called when a mutation is found in the cache and re-used
  void onMutationReuse(
    Mutation<dynamic, dynamic> query,
  ) {}

  /// Called when an infinite query or query are created in the cache
  void onQueryCreation(
    Cacheable<dynamic> query,
  ) {}

  /// Called when an infinite query or query are deleted from the cache
  /// When the whole cache is deleted, the key will be null.
  void onQueryDeletion(Object? key) {}

  /// Called when a query state is updated.
  ///
  /// Called before the state changes
  void onChange(
    Cacheable<dynamic> query,
    QueryState<dynamic> nextState,
  ) {}

  /// Called if a query fails.
  void onError(
    Cacheable<dynamic> query,
    StackTrace stackTrace,
    QueryState<dynamic> errorState,
  ) {}

  /// Called if a mutation error happens.
  void onMutationError(
    Mutation<dynamic, dynamic> mutation,
    StackTrace stackTrace,
    MutationError<dynamic> errorState,
  ) {}

  /// Called when the state of a mutation changes.
  void onMutationChange(
    Mutation<dynamic, dynamic> mutation,
    MutationState<dynamic> nextState,
  ) {}
}
