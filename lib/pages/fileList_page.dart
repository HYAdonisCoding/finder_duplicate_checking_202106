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
  Future<String> _getLocalFile(String dirString) async {
    // get the path to the document directory.
    /// 获取根地址
    String dir = (await getApplicationDocumentsDirectory()).path;
    if (dirString.isEmpty) {
      /// 获取当前文件夹
      rootDir = dir;
      // /Users/adam/Library/Developer/CoreSimulator/Devices/1DD5EEEB-FE49-43A5-858C-B614B5B1C6C6/data/Containers/Data/Application/79F4ECCB-1E32-4C0B-BAA0-D255BE9439A6/Documents
      // 截取最后文件夹的名称
      List strs = dir.split("/");
      fileList = [strs.last];
    } else {
      /// 获取文件夹内容

    }

    print('dir' + dir);
    return dir;
  }

  List fileList = [];
  String rootDir = '';
  String currentDir = '';

  @override
  void initState() {
    _getLocalFile("").then((value) {
      setState(() {
        print(value);
        List strs = value.split("/");
        fileList = [strs.last];
        print(fileList);
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
          future: _getLocalFile(""),
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
      height: ScreenUtil.screenHeight,
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
