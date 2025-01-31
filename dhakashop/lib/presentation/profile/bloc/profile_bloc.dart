import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(ProfileState(
    name: "Robiul Sunny Emon",
    email: "robiulsunnyemon@example.com",
    phone: "+880 1234 567 890",
  )) {
    on<LoadProfile>((event, emit) {
      emit(state);
    });
  }
}



