import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show Platform;

import 'package:walchain/features/home/screens/consignmentDetails.dart';

class QRScanningScreen extends StatefulWidget {
  final String type;

  const QRScanningScreen({super.key, required this.type});

  @override
  _QRScanningScreenState createState() => _QRScanningScreenState();
}

class _QRScanningScreenState extends State<QRScanningScreen> {
  final GlobalKey<State<StatefulWidget>> _qrKey = GlobalKey<State<StatefulWidget>>();
  QRViewController? _controller;
  String scannedData = '';

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.camera.request();
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller?.pauseCamera();
    } else if (Platform.isIOS) {
      _controller?.resumeCamera();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _stopScanning() {
    _controller?.pauseCamera(); // Pause camera to stop scanning
    setState(() {
      scannedData = scannedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizing
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'QR Scanning - ${widget.type}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Lora',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Scan the QR code to proceed',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            letterSpacing: 1.68,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 42,
                      height: 42,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFF9F1C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.notifications),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  width: screenWidth,
                  height: 1,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: Container(
                    width: 335,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0x4C2F4B4C)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Scan The QR',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Lora',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.5,
                  child: QRView(
                    key: _qrKey,
                    onQRViewCreated: (QRViewController controller) {
                      setState(() {
                        _controller = controller;
                      });
                      _controller?.scannedDataStream.listen((scanData) {
                        if (scannedData.isEmpty) {
                          setState(() {
                            scannedData = scanData.code!;
                          });
                          _stopScanning(); // Stop scanning after successful scan
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Consignmentdetails(name: 'Rehan', role: 'Driver',)),
                            );
                          });
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  'Scanned QR Code: $scannedData',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Lora',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
