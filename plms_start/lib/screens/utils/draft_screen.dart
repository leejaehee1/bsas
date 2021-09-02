import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/utils/header_issue.dart';

// https://www.youtube.com/watch?v=eWhnXGjppHw

class DraftPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _cdx = 0;
  double _cdy = 0;

  double get cdx => this._cdx;
  double get cdy => this._cdy;

  set cdx(double newCdx) => this._cdx = newCdx;
  set cdy(double newCdy) => this._cdy = newCdy;

  double boxWidth = 100.0;
  double boxHeight = 100.0;

  var pixelList = [];

  @override
  void initState() {
    Future.microtask(() {
      _cdx = MediaQuery.of(context).size.width / 2 - (this.boxWidth / 2);
      _cdy = MediaQuery.of(context).size.height / 2 - (this.boxHeight / 2);
    }).then((_) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2B3745),
        automaticallyImplyLeading: false,
        title: Header(
          title: "title",
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1.5 / 7,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFE6E6E6),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffB7C5B9),
                      offset: Offset(-7, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text('Category: A'),
                          Text('Category: A'),
                          Text('Category: A')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 4 / 7,
            color: Color(0xFFE6E6E6),
            child: GestureDetector(
              onTapDown: (TapDownDetails td) {
                setState(() {
                  this.cdx = td.globalPosition.dx - (this.boxWidth * 0.33);
                  this.cdy = td.globalPosition.dy - (this.boxHeight * 2.75);
                  // this.cdx = td.globalPosition.dx;
                  // this.cdy = td.globalPosition.dy;
                  // print([this.cdx, this.cdy]);
                  // print();
                });
              },
              child: Container(
                padding: EdgeInsets.all(15),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/punch_draft_sample.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fill,
                    ),
                    Transform.translate(
                      offset: Offset(cdx, cdy),
                      child: Container(
                        // child: Icon(Icons.add_location_sharp, color: Colors.white,),
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_location_sharp,
                              color: Colors.black,
                            ),
                            label: Text(
                              'map',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xFFE6E6E6),
            height: 66,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff71838D), // background
                    // onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff5D8595), // background
                    // onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {},
                  child: Text("Clear Location"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff2F4C5A), // background
                    // onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    pixelList.add([this.cdx, this.cdy]);
                    print("pixelList");
                    // print(pixelList);
                  },
                  child: Text("Save Location"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
