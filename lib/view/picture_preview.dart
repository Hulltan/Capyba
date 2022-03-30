import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewPage extends StatelessWidget {
  File picture;

  PreviewPage({Key? key, required this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned.fill(
                child: Image.file(picture),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _checkButton(),
                  _closeButton(),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }

  _checkButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black.withOpacity(0.5),
          child: IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.green,
              size: 28,
            ),
            onPressed: () => Get.back(result: picture),
          ),
        ),
      ),
    );
  }

  _closeButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black.withOpacity(0.5),
          child: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.green,
              size: 28,
            ),
            onPressed: () => Get.back(),
          ),
        ),
      ),
    );
  }
}
