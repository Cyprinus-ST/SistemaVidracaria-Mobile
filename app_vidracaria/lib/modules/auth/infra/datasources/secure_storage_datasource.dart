abstract class SecureStorageDatasource {
  Future<void> storeTokenOnStorage(String token);
  Future<String> getTokenOfStorage();
  Future<bool> tokenIsValid(String token);
}