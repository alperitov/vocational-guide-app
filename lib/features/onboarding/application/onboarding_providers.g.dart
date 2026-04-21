// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingCompletoHash() =>
    r'2fdceafd8352afbef27e728ee0a8806ad732f3a4';

/// See also [onboardingCompleto].
@ProviderFor(onboardingCompleto)
final onboardingCompletoProvider = AutoDisposeFutureProvider<bool>.internal(
  onboardingCompleto,
  name: r'onboardingCompletoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onboardingCompletoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OnboardingCompletoRef = AutoDisposeFutureProviderRef<bool>;
String _$onboardingNotifierHash() =>
    r'edf272a47bd0114e0e3211ed62a6c51be69fb871';

/// See also [OnboardingNotifier].
@ProviderFor(OnboardingNotifier)
final onboardingNotifierProvider =
    AutoDisposeNotifierProvider<OnboardingNotifier, StudentProfile>.internal(
      OnboardingNotifier.new,
      name: r'onboardingNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$onboardingNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$OnboardingNotifier = AutoDisposeNotifier<StudentProfile>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
