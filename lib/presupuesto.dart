import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';

class Presupuesto {
  String titulo;
  String descripcion;
  var productos = new List();
  String total;

  Presupuesto(){
    this.titulo = '';
    this.descripcion = '';
    this.total = '';
  }


  setTitulo(String titulo) {
    this.titulo = titulo;
  }

  setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  setTotal(String total) {
    this.total = total;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  generarPDF(){
    final pdf = new PDFDocument(deflate: zlib.encode);
    final page = new PDFPage(pdf, pageFormat: PDFPageFormat.letter);
    final g = page.getGraphics();
    final font = new PDFFont(pdf);
    final top = page.pageFormat.height;

    g.setColor(new PDFColor(0.0, 1.0, 1.0));
    g.drawRect(50.0 * PDFPageFormat.mm, top - 80.0 * PDFPageFormat.mm,
      100.0 * PDFPageFormat.mm, 50.0 * PDFPageFormat.mm);
    g.fillPath();

    g.setColor(new PDFColor(0.3, 0.3, 0.3));
    g.drawString(font, 12.0, "Hello World!", 10.0 * PDFPageFormat.mm,
       top - 10.0 * PDFPageFormat.mm);

   final file = _localFile;
   file.writeAsBytes(pdf.save());
  }

}