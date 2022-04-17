part of setting_screen;

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<SettingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
