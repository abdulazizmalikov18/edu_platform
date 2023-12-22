import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:edu_platform/core/exceptions/failures.dart';
import 'package:flutter/material.dart';

class MyFunctions {
  static String getDay(bool isDay) {
    DateTime today = DateTime.now();
    DateTime selDay;
    if (isDay) {
      selDay = today.subtract(const Duration(days: 1)).toLocal();
    } else {
      selDay = today.add(const Duration(days: 2)).toLocal();
    }

    return "${selDay.year}-${selDay.month}-${selDay.day}";
  }

  static String phoneFormat(String phone) {
    var formattedPhone = '';
    if (phone.length == 9) {
      //!input = 904781717
      formattedPhone += '${phone.substring(0, 2)} '; //90
      formattedPhone += '${phone.substring(2, 5)} '; // 478
      formattedPhone += '${phone.substring(5, 7)} '; // 17
      formattedPhone += phone.substring(7); // 17
      //!result 90 487 17 17
    } else if (phone.length == 13) {
      //!input = +998904781717
      formattedPhone += '${phone.substring(0, 4)} '; //+998
      formattedPhone += '${phone.substring(4, 6)} '; //90
      formattedPhone += '${phone.substring(6, 9)} '; // 478
      formattedPhone += '${phone.substring(9, 11)} '; // 17
      formattedPhone += phone.substring(11);
      //!result +998 90 487 17 17
    }

    return formattedPhone;
  }

  static String getFormattedPrice(String content, List<int> stopsList) {
    final buffer = StringBuffer();
    for (var i = 0; i < content.length; i++) {
      if (stopsList.contains(i + 1)) {
        buffer.write(' ');
      }
      buffer.write(content[i]);
    }
    return buffer.toString();
  }

  static String getThousandsSeparatedPrice(String price) {
    var priceInText = '';
    var counter = 0;
    for (var i = price.length - 1; i >= 0; i--) {
      counter++;
      var str = price[i];
      if ((counter % 3) != 0 && i != 0) {
        priceInText = '$str$priceInText';
      } else if (i == 0) {
        priceInText = '$str$priceInText';
      } else {
        priceInText = ' $str$priceInText';
      }
    }
    return priceInText.trim();
  }

  static Future<ImageInfo> getImageInfo(BuildContext context, String image) async {
    final assetImage = AssetImage(image);
    final stream = assetImage.resolve(createLocalImageConfiguration(context));
    final completer = Completer<ImageInfo>();
    stream.addListener(ImageStreamListener((imageInfo, _) => completer.complete(imageInfo)));
    return completer.future;
  }

  static Future<Uint8List> getBytesFromCanvas({
    required int width,
    required int height,
    required int placeCount,
    required BuildContext context,
    required String image,
    Offset? offset,
    bool shouldAddText = true,
  }) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final paint = Paint()..color = Colors.red;
    canvas.drawImage(await getImageInfo(context, image).then((value) => value.image),
        offset ?? const Offset(0, 3), paint);

    if (shouldAddText) {
      final painter = TextPainter(textDirection: ui.TextDirection.ltr);
      painter
        ..text = TextSpan(
          text: placeCount.toString(),
          style: const TextStyle(fontSize: 100, color: Colors.white),
        )
        ..layout()
        ..paint(
          canvas,
          Offset((width * 0.47) - painter.width * 0.2, (height * 0.1) - painter.height * 0.1),
        );
    }

    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data?.buffer.asUint8List() ?? Uint8List(0);
  }

  static double getRadiusFromZoom(double zoom) =>
      40000 / pow(2, zoom) > 1 ? 40000 / pow(2, zoom) : 1;

  static String getFormatCost(String cost) {
    var oldCost = cost;
    if (cost.contains('.')) {
      final arr = cost.split('.');
      oldCost = arr.first;
    }
    var newCost = '';
    for (var i = 0; i < oldCost.length; i++) {
      if ((oldCost.length - i) % 3 == 0) newCost += ' ';
      newCost += oldCost[i];
    }
    return newCost.trimLeft();
  }

  static List<String> getUpperLetter() =>
      [for (int i = 0; i < 26; i++) String.fromCharCode(i + 65)];

  static bool isEmail(String email) => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);

  static String getErrorMessage(Failure failure) {
    var err = (failure is ServerFailure) ? failure.errorMessage : failure.toString();
    if (err == 'Wrong code!') {
      err = 'Код подтверждения введен неверно';
    }
    return err;
  }
}
