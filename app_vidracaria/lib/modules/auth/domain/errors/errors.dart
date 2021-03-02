/////////////// FailureAuthenticate //////////////////
abstract class FailureAuthenticate implements Exception {}

class InvalidFieldsError implements FailureAuthenticate {}
class DataSourceError implements FailureAuthenticate {
  final bool authenticated;
  final String message;

  DataSourceError({this.authenticated, this.message});
}

class StorageTokenError implements FailureAuthenticate {}

class InvalidTokenError implements FailureAuthenticate {}

class InvalidUserError implements FailureAuthenticate {}

class GetTokenError implements FailureAuthenticate {}


/////////////// FailureForgotPassword //////////////////
abstract class FailureForgotPassword implements Exception {}


/////////////// FailureRegiterUser//////////////////
abstract class FailureRegister implements Exception {}

class InvalidFieldsResgister implements FailureRegister {}