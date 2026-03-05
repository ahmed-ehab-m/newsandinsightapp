import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class CheckInternetService {
  final InternetConnection internetConnection;
  CheckInternetService({required this.internetConnection});
  Future<bool> isConnected() async {
    return internetConnection.hasInternetAccess;
  }

  Stream<InternetStatus> onInternetStatusChange() {
    return internetConnection.onStatusChange;
  }
}
