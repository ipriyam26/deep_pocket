import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class bookViewer extends StatefulWidget {
  // bookViewer({Key? key, required this.title}) : super(key: key);

  static const route = 'resources-tabs/book-resources/book-viewer';

  // final String title;

  @override
  _bookViewerState createState() => _bookViewerState();
}

class _bookViewerState extends State<bookViewer> {
  late PdfViewerController _pdfViewerController;
  OverlayEntry? _overlayEntry;
  late PdfTextSearchResult _searchResult;

  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    _searchResult = PdfTextSearchResult();

    super.initState();
  }

  void _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState _overlayState = Overlay.of(context)!;
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child: RaisedButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: details.selectedText));
            print(
                'Text copied to clipboard: ' + details.selectedText.toString());
            _pdfViewerController.clearSelection();
          },
          color: Colors.white,
          elevation: 10,
          child: Text('Copy', style: TextStyle(fontSize: 17)),
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
              icon: Icon(
                Icons.bookmark,
                color: Colors.white,
              )),
          // IconButton(
          //     onPressed: () {
          //       _pdfViewerController.jumpToPage(5);
          //     },
          //     icon: Icon(
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
              icon: Icon(
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
              icon: Icon(
                Icons.zoom_in,
                color: Colors.white,
              ))
        ],
      ),
    ));
  }
}
