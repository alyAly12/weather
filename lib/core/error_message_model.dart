import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final int statusCode;
  final String message;

  const ErrorMessageModel({required this.statusCode,required this.message});

  factory ErrorMessageModel.fromJson(Map<String ,dynamic>json)=>
      ErrorMessageModel(
          statusCode: json['cod'],
          message: json['message']
      );

  @override

  List<Object?> get props => [statusCode ,message];
}