part of 'bottom_navbar_bloc.dart';
class BottomNavBarState extends Equatable{
  final int index;
  const BottomNavBarState({required this.index});

  @override
  // TODO: implement props
  List<Object?> get props =>[index];
}