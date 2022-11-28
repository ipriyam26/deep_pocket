// ignore_for_file: camel_case_types, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class bookViewer extends StatefulWidget {
  // bookViewer({Key? key, required this.title}) : super(key: key);

  static const route = 'resources-tabs/book-resources/book-viewer';

  const bookViewer({Key? key}) : super(key: key);

  // final String title;

  @override
  _bookViewerState createState() => _bookViewerState();
}

class _bookViewerState extends State<bookViewer> {
  late PdfViewerController _pdfViewerController;
  OverlayEntry? _overlayEntry;

  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();

    super.initState();
  }

  void _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState _overlayState = Overlay.of(context)!;
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child: ElevatedButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: details.selectedText));
            print(
                'Text copied to clipboard: ' + details.selectedText.toString());
            _pdfViewerController.clearSelection();
          },
          // color: Colors.white,
          // elevation: 10,
          child: const Text('Copy', style: TextStyle(fontSize: 17)),
        ),
      ),
    );
    _overlayState.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    var book = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
        child: Scaffold(
      body: SafeArea(
        child: SfPdfViewer.network(book,
            onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
          if (details.selectedText == null && _overlayEntry != null) {
            _overlayEntry!.remove();
            _overlayEntry = null;
          } else if (details.selectedText != null && _overlayEntry == null) {
            _showContextMenu(context, details);
          }
        },
            // enableTextSelection: true,
            controller: _pdfViewerController,
            key: _pdfViewerStateKey),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _pdfViewerStateKey.currentState!.openBookmarkView();
              },
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
              )),
          // IconButton(
          //     onPressed: () {
          //       _pdfViewerController.jumpToPage(5);
          //     },
          //     icon: const Icon(
          //       Icons.arrow_drop_down_circle,
          //       color: Colors.white,
          //     )),
          IconButton(
              onPressed: () {
                if (_pdfViewerController.zoomLevel > 1.0) {
                  _pdfViewerController.zoomLevel =
                      _pdfViewerController.zoomLevel - 0.25;
                }
              },
              icon: const Icon(
                Icons.zoom_out,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                if (_pdfViewerController.zoomLevel < 3) {
                  _pdfViewerController.zoomLevel =
                      _pdfViewerController.zoomLevel + 0.25;
                }
              },
              icon: const Icon(
                Icons.zoom_in,
                color: Colors.white,
              ))
        ],
      ),
    ));
  }
}
