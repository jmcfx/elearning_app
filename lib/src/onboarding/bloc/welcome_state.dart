class WelcomeState {
  final int page;
  const WelcomeState({
    this.page = 0,
  });

  WelcomeState copyWith({int? page}) {
   return WelcomeState(
      page: page ?? this.page
    );
  }
}
