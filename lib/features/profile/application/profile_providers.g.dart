// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studentProfileHash() => r'6c1f7f0188e434bca6ee7938cb3d6c0bacd4bfcf';

/// See also [studentProfile].
@ProviderFor(studentProfile)
final studentProfileProvider =
    AutoDisposeFutureProvider<StudentProfile?>.internal(
      studentProfile,
      name: r'studentProfileProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$studentProfileHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StudentProfileRef = AutoDisposeFutureProviderRef<StudentProfile?>;
String _$profileEditorNotifierHash() =>
    r'2ace09bf3cfb427744dc9194d9217740181ec5c4';

/// See also [ProfileEditorNotifier].
@ProviderFor(ProfileEditorNotifier)
final profileEditorNotifierProvider =
    AutoDisposeNotifierProvider<
      ProfileEditorNotifier,
      AsyncValue<StudentProfile?>
    >.internal(
      ProfileEditorNotifier.new,
      name: r'profileEditorNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$profileEditorNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProfileEditorNotifier =
    AutoDisposeNotifier<AsyncValue<StudentProfile?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
