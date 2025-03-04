import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/models/post/post_list.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:boilerplate/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  // repository instance
  Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _PostStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<AstronautList> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<AstronautList> fetchPostsFuture =
      ObservableFuture<AstronautList>(emptyPostResponse);

  @observable
  AstronautList astronautList;

  @observable
  Astronaut currentAstronaut;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------

  @action
  void setCurrentAstronaut(Astronaut astronaut){
    this.currentAstronaut = astronaut;
  }

  @action
  Future getPosts() async {
    final future = _repository.getPosts();
    fetchPostsFuture = ObservableFuture(future);

    future.then((postList) {
      this.astronautList = postList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
