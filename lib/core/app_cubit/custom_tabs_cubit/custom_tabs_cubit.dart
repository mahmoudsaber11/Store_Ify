import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/app_cubit/custom_tabs_cubit/custom_tabs_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(InitialProductState());

  bool isListView1Visible = false;
  bool isListView2Visible = false;
  bool isListView3Visible = false;

  void toggleListView1() {
    isListView1Visible = !isListView1Visible;
    isListView2Visible = false;
    isListView3Visible = false;
    emit(ToggleListView1());
  }

  void toggleListView2() {
    isListView1Visible = false;
    isListView2Visible = !isListView2Visible;
    isListView3Visible = false;
    emit(ToggleListView2());
  }

  void toggleListView3() {
    isListView1Visible = false;
    isListView2Visible = false;
    isListView3Visible = true;
    emit(ToggleListView3());
  }
}
