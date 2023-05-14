import 'package:bloc/bloc.dart';
import 'package:kemet/models/place_hint.dart';
import 'package:kemet/models/place_model.dart';
import 'package:meta/meta.dart';

part 'place_search_page_state.dart';

class PlaceSearchPageCubit extends Cubit<PlaceSearchPageState> {
  PlaceSearchPageCubit() : super(PlaceSearchPageInitial());

  List<PlaceHint> searchResults = [];

  void getSearchResuls(String query) {
    //TODO:update the search results
  }

  addSomePlaces() {
    searchResults = [
      PlaceHint(id: 1, name: 'مسجد الحسين', image: 'assets/images/1.jpg'),
      PlaceHint(id: 2, name: 'مسجد السلطان حسن', image: 'assets/images/2.jpg'),
      PlaceHint(id: 3, name: 'مسجد الازهر', image: 'assets/images/3.jpg'),
      PlaceHint(
          id: 4, name: 'مسجد عمرو بن العاص', image: 'assets/images/4.jpg'),
      PlaceHint(
          id: 5, name: 'مسجد احمد ابن طولون', image: 'assets/images/5.jpg'),
    ];
    emit(UpdatePlacesSuccess());
  }
}
