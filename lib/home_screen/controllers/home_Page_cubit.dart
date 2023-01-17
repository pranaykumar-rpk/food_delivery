import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/home_screen/models/home_page_state.dart';

class HomePageControllerCubit extends Cubit<HomePageState> {
  HomePageControllerCubit() : super(HomePageState());

  void search(String searchQuery) {
    print(searchQuery);
  }
}

// class HomePageControllerCubit{
//       void search(String searchQuery) {
//     print(searchQuery);
//   }
// }
