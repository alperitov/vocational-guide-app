// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedRepositoryHash() => r'0b263d23b74893888a881af1abf94d23d98f9234';

/// See also [feedRepository].
@ProviderFor(feedRepository)
final feedRepositoryProvider = Provider<FeedRepository>.internal(
  feedRepository,
  name: r'feedRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$feedRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FeedRepositoryRef = ProviderRef<FeedRepository>;
String _$feedStreamHash() => r'70f2790a83112e5b913a77bca51747401f7aa1f4';

/// See also [feedStream].
@ProviderFor(feedStream)
final feedStreamProvider = AutoDisposeStreamProvider<List<FeedPost>>.internal(
  feedStream,
  name: r'feedStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$feedStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FeedStreamRef = AutoDisposeStreamProviderRef<List<FeedPost>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
