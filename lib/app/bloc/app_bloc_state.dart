part of 'app_bloc_bloc.dart';

// ignore: must_be_immutable
final class AppState extends Equatable {
  bool isDesktop;
  Widget pageSelected;

  AppState({this.isDesktop = true, this.pageSelected = const HomeMobilePage()});

  AppState copyWith({
    bool? desktop,
    Widget? newPageSelected,
  }) =>
      AppState(
          isDesktop: desktop ?? isDesktop,
          pageSelected: newPageSelected ?? pageSelected);

  @override
  List<Object> get props => [isDesktop, pageSelected];
}
