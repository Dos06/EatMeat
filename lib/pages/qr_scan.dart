import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScan extends StatefulWidget {
  const QrScan({Key? key}) : super(key: key);

  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),
            Positioned(
              bottom: 100,
              child: buildResult(),
            ),
            Positioned(
              top: 10,
              child: buildControlButtons(),
            ),
            Positioned(
              bottom: 30,
              child: FloatingActionButton(
                child: const Icon(
                  Icons.close,
                  size: 36.0,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildControlButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white24,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: FutureBuilder<bool?>(
              future: controller?.getFlashStatus(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Icon(
                    snapshot.data! ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                  );
                }
                return Container();
              },
            ),
            onPressed: () async {
              await controller?.toggleFlash();
            },
          ),
          IconButton(
            icon: FutureBuilder(
                future: controller?.getCameraInfo(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return const Icon(
                      Icons.switch_camera,
                      color: Colors.white,
                    );
                  }
                  return Container();
                }),
            onPressed: () async {
              await controller?.flipCamera();
            },
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white24,
      ),
      child: Text(
        barcode != null ? 'Result: ${barcode!.code}' : 'Ready to scan!',
        maxLines: 3,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Theme.of(context).primaryColorDark,
        borderRadius: 10,
        borderLength: 20,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
