// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$latestQuizSessionHash() => r'b3cb112b794c665893b7654c8988f6c6f4e6ffc6';

/// See also [latestQuizSession].
@ProviderFor(latestQuizSession)
final latestQuizSessionProvider = FutureProvider<QuizSession?>.internal(
  latestQuizSession,
  name: r'latestQuizSessionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$latestQuizSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LatestQuizSessionRef = FutureProviderRef<QuizSession?>;
String _$quizHistoryHash() => r'fb421912f04257bb918aaffb2ab032f2d64d0818';

/// See also [quizHistory].
@ProviderFor(quizHistory)
final quizHistoryProvider = FutureProvider<List<QuizSession>>.internal(
  quizHistory,
  name: r'quizHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$quizHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef QuizHistoryRef = FutureProviderRef<List<QuizSession>>;
String _$latestSessionByTypeHash() =>
    r'2712e8a649193ea8285a6fa6ee0af4fac6ebd1e5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [latestSessionByType].
@ProviderFor(latestSessionByType)
const latestSessionByTypeProvider = LatestSessionByTypeFamily();

/// See also [latestSessionByType].
class LatestSessionByTypeFamily extends Family<AsyncValue<QuizSession?>> {
  /// See also [latestSessionByType].
  const LatestSessionByTypeFamily();

  /// See also [latestSessionByType].
  LatestSessionByTypeProvider call(QuizType tipo) {
    return LatestSessionByTypeProvider(tipo);
  }

  @override
  LatestSessionByTypeProvider getProviderOverride(
    covariant LatestSessionByTypeProvider provider,
  ) {
    return call(provider.tipo);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'latestSessionByTypeProvider';
}

/// See also [latestSessionByType].
class LatestSessionByTypeProvider
    extends AutoDisposeFutureProvider<QuizSession?> {
  /// See also [latestSessionByType].
  LatestSessionByTypeProvider(QuizType tipo)
    : this._internal(
        (ref) => latestSessionByType(ref as LatestSessionByTypeRef, tipo),
        from: latestSessionByTypeProvider,
        name: r'latestSessionByTypeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$latestSessionByTypeHash,
        dependencies: LatestSessionByTypeFamily._dependencies,
        allTransitiveDependencies:
            LatestSessionByTypeFamily._allTransitiveDependencies,
        tipo: tipo,
      );

  LatestSessionByTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tipo,
  }) : super.internal();

  final QuizType tipo;

  @override
  Override overrideWith(
    FutureOr<QuizSession?> Function(LatestSessionByTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LatestSessionByTypeProvider._internal(
        (ref) => create(ref as LatestSessionByTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tipo: tipo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<QuizSession?> createElement() {
    return _LatestSessionByTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LatestSessionByTypeProvider && other.tipo == tipo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tipo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LatestSessionByTypeRef on AutoDisposeFutureProviderRef<QuizSession?> {
  /// The parameter `tipo` of this provider.
  QuizType get tipo;
}

class _LatestSessionByTypeProviderElement
    extends AutoDisposeFutureProviderElement<QuizSession?>
    with LatestSessionByTypeRef {
  _LatestSessionByTypeProviderElement(super.provider);

  @override
  QuizType get tipo => (origin as LatestSessionByTypeProvider).tipo;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
