import 'package:com.app.aboelazayem/constants.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  final String pdfUrl;

  const PdfView({required this.pdfUrl});

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  // PdfViewerController _pdfViewerController;
  @override
  void initState() {
    // _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator(
           backgroundColor: kSecondryColor,
          )
        : Container(
            color: Colors.green,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Text("test"),
          );
  }
}
