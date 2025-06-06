import 'package:flutter/material.dart';
import 'package:food_prediction/pages/Fruit_Page/add_fruit_next.dart';
import 'package:food_prediction/pages/Fruit_Page/fruit_page.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


// ignore: camel_case_types
class scanFruit extends StatefulWidget {
  const scanFruit({super.key});

  @override
  State<scanFruit> createState() => _scanFruitState();
}

// ignore: camel_case_types
class _scanFruitState extends State<scanFruit> {

  CameraController? _controller;
  late Future<void> _initializeControllerFuture = Future.value();

  @override
  void initState() {
    super.initState();
    _initCamera();
    _loadModel();
  }

  Future<void> _loadModel() async {
    await Tflite.loadModel(
      model: "assets/fruit_classifier.tflite",
      labels: "assets/class_labels.txt"
    );
  }

  Future<void> _capturePredictAndNavigate() async {
  if (_controller == null || _isProcessing) return;

  setState(() { _isProcessing = true; });

  try {
    await _initializeControllerFuture;
    final image = await _controller!.takePicture();

    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    String predicted = "Unknown";
    if (recognitions != null && recognitions.isNotEmpty) {
      predicted = recognitions[0]['label'];
    }

    setState(() {
      _predictedFruit = predicted;
      _isProcessing = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddFruitNext(fruitName: _predictedFruit ?? "Unknown"),
      ),
    );
  } catch (e) {
    setState(() { _isProcessing = false; });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to process image: $e"))
    );
  }
}

  String? _predictedFruit;
  bool _isProcessing = false;

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere((camera) =>
      camera.lensDirection == CameraLensDirection.back);
    
    _controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller!.initialize();

    if(mounted) {
      setState(() {});
    }
  }

  @override
  void dispose(){
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
        body: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          //==========================================================================================================================
          // Back Button
              Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FruitPage())),
                    child: const Icon(Icons.keyboard_backspace),
                  )),
          //==========================================================================================================================
          // Title
              const Text(
                "Fruit",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
          //==========================================================================================================================
          // Scan Tips
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Put the fruit inside the frame",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          //==========================================================================================================================
          // Camera Outline
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 5
                        )
                      ]
                    ),
                    child: FutureBuilder(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done && _controller != null) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 300,
                              width: 300,
                              child: CameraPreview(_controller!),
                            ),
                          );
                        } else {
                          return const SizedBox(
                            height: 300,
                            child: Center(child: CircularProgressIndicator(),),
                          );
                        }
                      }
                    )
                  )
                ),
              ),
          //==========================================================================================================================
          // Fruit Name After Scanning
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Center(
                          child: Text(
                            _predictedFruit ?? "No prediction yet",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          //==========================================================================================================================
          // Next Button
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: _isProcessing ? null : _capturePredictAndNavigate,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF0dc6b5), Color(0xFF28d892)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: _isProcessing
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Center(child: CircularProgressIndicator(color: Colors.white)),
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Center(
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          //==========================================================================================================================
            ],
          ),
        ));
  }
}
