import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_photos_upload/services/photos_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;
  pickAndUploadFile() async {
    loading = true;
    setState(() {});
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if(result != null) {
      File file = File(result.files.single.path!);
      await PhotosService().upload(file);
      loading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Photos upload')),
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : TextButton(
          onPressed: () => pickAndUploadFile(),
          child: const Text('Upload Image'),
        ),
      ),
    );
  }
}
