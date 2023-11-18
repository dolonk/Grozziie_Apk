import 'package:grozziieapk/presentation_layer/data_layer/remote_server/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}

/*
class ApiResponse<T> {
  final Status status;
  final T? data;
  final String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING, data = null, message = null;

  ApiResponse.completed(this.data)
      : status = Status.COMPLETED,
        message = null;

  ApiResponse.error(this.message)
      : status = Status.ERROR,
        data = null;
}*/
