import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozaik/events/post_event.dart';
import 'package:mozaik/models/post_model.dart';
import 'package:mozaik/services/post_service.dart';
import 'package:mozaik/states/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<Post> _postsCache = [];

  PostBloc() : super(PostInitial()) {
    on<CreatePostEvent>(_onCreatePostEvent);
    on<FetchPosts>(_onFetchPosts);
    on<FetchPostsByUser>(_onFetchPostsByUser);
  }

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await PostService.fetchPosts();

      _postsCache = posts;
      if (_postsCache.isNotEmpty) {
        emit(PostsLoaded(_postsCache));
        return;
      }
    } catch (e) {
      emit(PostError('Failed to fetch posts: $e'));
    }
  }

  Future<void> _onFetchPostsByUser(
      FetchPostsByUser event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await PostService.fetchPostsByUser(event.handle);

      _postsCache = posts;

      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostError('Failed to load posts for user: ${event.handle} - $e'));
    }
  }

  Future<void> _onCreatePostEvent(
      CreatePostEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());

    try {
      final newPost = await PostService.createPost(
        userId: event.userId,
        content: event.content,
        spotifyTrackId: event.spotifyTrackId,
        visibility: event.visibility,
        imageUrl: event.imageUrl,
      );
      _postsCache.insert(0, newPost);
      emit(PostCreated(newPost));
      add(FetchPosts());
    } catch (e) {
      emit(PostError('Failed to create post: $e'));
    }
  }
}
