import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velha_guarda/Model/homepagedata.dart';
import 'package:velha_guarda/homepagewidget/homeappbar.dart';
import 'package:velha_guarda/homepagewidget/homelandscapelayout.dart';
import 'package:velha_guarda/homepagewidget/homeportraitlayout.dart';
import 'package:velha_guarda/screens/home_screen.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: (AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color:Colors.orange,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }
        ),
      )),
      body: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ChangeNotifierProvider(
          builder: (context) => HomePageData(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Consumer<HomePageData>(
              builder: (context, data, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    orientation==Orientation.portrait?HomeAppBar():SizedBox(height: 20,),
                    Expanded(
                      flex: 9,
                      child: Container(
                        width: orientation==Orientation.portrait?MediaQuery.of(context).size.width:MediaQuery.of(context).size.width-80,
                        child: ScrollView(),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class ScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: orientation == Orientation.portrait
              ? HomePortraitLayout()
              : HomeLandScapeLayout(),
        );
      },
    );
  }
}


