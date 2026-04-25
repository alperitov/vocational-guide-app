import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/models/feed_post.dart';
import '../../../../data/remote/feed_repository.dart';
import 'package:riverpod/riverpod.dart';

part 'feed_providers.g.dart';

@riverpod
Stream<List<FeedPost>> feed(Ref ref) =>
    ref.watch(feedRepositoryProvider).getFeedStream();
