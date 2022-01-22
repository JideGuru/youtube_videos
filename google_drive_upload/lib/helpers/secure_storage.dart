import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:googleapis_auth/auth_io.dart';

class SecureStorage {
  final storage = FlutterSecureStorage();

  //Save Credentials
  Future saveCredentials(AccessCredentials credentials) async {
    await storage.write(key: "type", value: credentials.accessToken.type);
    await storage.write(key: "data", value: credentials.accessToken.data);
    await storage.write(key: "expiry", value: credentials.accessToken.expiry.toString());
    await storage.write(key: "refreshToken", value: credentials.refreshToken);
  }

  //Get Saved Credentials
  Future<Map<String, dynamic>?> getCredentials() async {
    var result = await storage.readAll();
    if (result.length == 0) return null;
    return result;
  }

  //Clear Saved Credentials
  Future clear() {
    return storage.deleteAll();
  }
}