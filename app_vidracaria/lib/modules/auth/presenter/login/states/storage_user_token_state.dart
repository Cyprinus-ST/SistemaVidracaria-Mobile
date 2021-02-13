import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';

abstract class StorageUserTokenState {
  
}

class StorageUserTokenSuccess implements StorageUserTokenState {}

class StorageUserTokenStart implements StorageUserTokenState {}

class StorageUserTokenLoading implements StorageUserTokenState {}

class StorageUserTokenError implements StorageUserTokenState {
  final FailureAuthenticate error;

  StorageUserTokenError(this.error);
}

