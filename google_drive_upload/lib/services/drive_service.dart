import 'dart:io';


import 'package:google_drive_upload/helpers/constants.dart';
import 'package:google_drive_upload/helpers/secure_storage.dart';
import 'package:googleapis/drive/v3.dart' as gdrive;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:url_launcher/url_launcher.dart';

class DriveService {
  final storage = SecureStorage();
  List<String> _scopes = [gdrive.DriveApi.driveScope];

  Future<http.Client> getHttpClient() async {
    final client = http.Client();
    AuthClient authClient;
    var credentials = await storage.getCredentials();
    if (credentials == null) {
      //Needs user authentication
      authClient = await clientViaUserConsent(
        ClientId(clientId),
        _scopes,
        _prompt,
      );
      //Save Credentials
      await storage.saveCredentials(authClient.credentials);
    } else {
      DateTime expiryDate = DateTime.tryParse(credentials["expiry"])!;
      // if(DateTime.now().isAfter(expiryDate)) {
      //   storage.clear();
      // }
      print(expiryDate);
      authClient = authenticatedClient(
        client,
        AccessCredentials(
          AccessToken(credentials["type"], credentials["data"], expiryDate),
          credentials["refreshToken"],
          _scopes,
        ),
      );
    }
    return authClient;
  }

  Future upload(File file) async {
    var client = await getHttpClient();
    var drive = gdrive.DriveApi(client);
    print("Uploading file");
    var response = await drive.files.create(
      gdrive.File()..name = path.basename(file.absolute.path),
      uploadMedia: gdrive.Media(file.openRead(), file.lengthSync()),
    );

    print("Result ${response.toJson()}");
  }

  Future<List<gdrive.File>> getFiles() async {
    var client = await getHttpClient();
    var driveApi = gdrive.DriveApi(client);
    var res = await driveApi.files.list(
      orderBy: 'folder, modifiedTime',
      // q: "root in parents",
    );
    return res.files ?? [];
  }

  void _prompt(String url) {
    print('Please go to the following URL and grant access:');
    print('  => $url');
    print('');
    launch(url);
  }
}
