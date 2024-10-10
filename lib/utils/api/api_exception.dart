class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message, "Mauvaise requête", url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message, "Impossible de traiter la demande", url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url])
      : super(message, "Demande non autorisée", url);
}

class NotFoundException extends AppException {
  NotFoundException([String? message, String? url])
      : super(message, "Route non trouvée", url);
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String? message, String? url])
      : super(message, "Erreur interne de serveur", url);
}
