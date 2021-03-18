import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/dashboard/domain/errors/errors.dart';

abstract class DashboardState {

}

class DashboardStart implements DashboardState {
  final User user;
  DashboardStart(this.user);
}

class DashboardLoading implements DashboardState {}

class DashboardError implements DashboardState {
  final FailureDashboard error;

  DashboardError(this.error);
}

class FailureGetUserAuthenticaded implements DashboardState {
  final String message;

  FailureGetUserAuthenticaded(this.message);
}

class DashboardSuccess implements DashboardState {
  final User user;

  DashboardSuccess({this.user});  
}