import 'package:flutter/material.dart';

class FileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finder Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FileListPage(title: 'File List'),
    );
  }
}

class FileListPage extends StatefulWidget {
  const FileListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FileListPageState createState() => _FileListPageState();
}

class _FileListPageState extends State<FileListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          
        ),
        body: Center(
          child: Text("文件目录"),
          
        )
      );
  }
}
