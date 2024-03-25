import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_demos/home_mobile/home_mobile.dart';

part 'app_bloc_event.dart';
part 'app_bloc_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final bool isDesktop;

  AppBloc({required this.isDesktop}) : super(AppState(isDesktop: isDesktop)) {
    on<ChangeIsDesktopEvent>(_changeIsDesktop);
    on<ChangePageSelectedEvent>(_changePageSelected);
  }

  void _changeIsDesktop(ChangeIsDesktopEvent event, Emitter<AppState> emit) =>
      emit(state.copyWith(isDesktop: event.isDesktop));

  void _changePageSelected(
          ChangePageSelectedEvent event, Emitter<AppState> emit) =>
      emit(state.copyWith(pageSelected: event.pageSelected));
}
