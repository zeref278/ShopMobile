part of profile_screen;

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
