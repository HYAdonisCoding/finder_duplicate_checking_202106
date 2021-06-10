import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';

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
  Future<File> _getLocalFile() async {
    // get the path to the document directory.
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  List fileList = [];

  @override
  void initState() {
    _getLocalFile().then((value) {
      setState(() {
        print(value);
        fileList = value as List;
      });
    });
    // TODO: implement initState
    super.initState();
    print("update files");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: _getLocalFile(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  // TopNavigator(navigatorList: (comicLists[0]['comics'] as List).cast()),
                  FileListWidget(fileLists: ['Document'])
                ],
              );
            } else {
              return Center(
                child: Text('Loading...'),
              );
            }
          },
        ));
  }
}

class FileListWidget extends StatelessWidget {
  const FileListWidget({Key? key, required this.fileLists}) : super(key: key);
  final List fileLists;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(720),
      width: ScreenUtil.screenWidth,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: fileLists.map((e) {
          return Text(e);
        }).toList(),
      ),
    );
  }
}
