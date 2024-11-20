class DashboardEvents {
  const DashboardEvents();
}

class TriggerAppEvent extends DashboardEvents {
  final int index;

  const TriggerAppEvent({required this.index}) : super();
}
