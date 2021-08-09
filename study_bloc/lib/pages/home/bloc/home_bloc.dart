import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_bloc/pages/home/bloc/home_event.dart';
import 'package:study_bloc/pages/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(HomeLoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    switch (event.runtimeType) {
      case HomeFetchList:
        yield await _fetchList();
        break;
      case HomeFetchListWithError:
        yield await _fetchListWithError();
        break;
      case HomeFetchListWithEmptyList:
        yield await _fetchListWithEmptyList();
        break;
    }
  }

  Future<HomeState> _fetchList() async {
    var list = await Future.delayed(
        const Duration(seconds: 3),
        () => <String>[
              "Item 1 ",
              "Item 1 ",
              "Item 1 ",
              "Item 1 ",
              "Item 1 ",
              "Item 1 ",
              "Item 1 ",
              "Item 1 ",
              "Item 1 ",
              "Item 1 ",
              "Item 1 ",
              "Item 1 ",
              "Item 1 ",
            ]);

    return HomeStateLoaded(list: list);
  }

  Future<HomeState> _fetchListWithError() async {
    return await Future.delayed(const Duration(seconds: 3),
        () => HomeErrorState(message: "Não foi possível carregar a list"));
  }

  Future<HomeState> _fetchListWithEmptyList() async {
    return await Future.delayed(
        const Duration(seconds: 3), () => HomeStateEmptyList());
  }
}
