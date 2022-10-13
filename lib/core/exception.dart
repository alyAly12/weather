import 'package:weather_app/core/error_message_model.dart';

class ServerExceptions implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServerExceptions({required this.errorMessageModel});
}