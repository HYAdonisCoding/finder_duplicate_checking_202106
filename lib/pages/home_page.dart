import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String homePageContent = 'HomePage';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('111111111');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
