import 'dart:io';

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GoogleMlKitHelper {
  Future<String> readTextFromImage(File image) async {
    final inputImage = InputImage.fromFile(image);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    textRecognizer.close();

    return text;
  }
}
