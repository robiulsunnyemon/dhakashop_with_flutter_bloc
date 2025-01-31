
import 'package:bloc/bloc.dart';
import 'package:dhakashop/domain/repositories/bottom_navbar/bottom_navbar_repository.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navbar_event.dart';
part 'bottom_navbar_state.dart';



class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  final BottomNavbarRepository cartProductRepository;
  BottomNavBarBloc(this.cartProductRepository) : super(BottomNavBarState(index: 0)) {
    on<NavBarItemTapped>(
            (event, emit)async{
              emit(BottomNavBarState(index: event.index));
            }
    );
  }
}
