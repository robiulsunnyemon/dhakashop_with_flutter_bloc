part of 'bottom_navbar_bloc.dart';

abstract class BottomNavBarEvent  extends Equatable{}

class NavBarItemTapped extends BottomNavBarEvent {
  final int index;
  NavBarItemTapped(this.index);

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
