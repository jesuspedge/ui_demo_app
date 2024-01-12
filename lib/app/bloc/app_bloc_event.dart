part of 'app_bloc_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class ChangeIsDesktopEvent extends AppEvent {
  final bool isDesktop;

  const ChangeIsDesktopEvent({required this.isDesktop});
}

final class ChangePageSelectedEvent extends AppEvent {
  final Widget pageSelected;

  const ChangePageSelectedEvent({required this.pageSelected});
}
