abstract class FailureProject implements Exception {}

class DatasourceError implements FailureProject {
}

class InvalidFieldsError implements FailureProject {}