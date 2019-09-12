import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFEFEFE),
        accentColor: Color(0xFFED38333),
        fontFamily: 'Segoe UI',
        textTheme: TextTheme(
          headline: TextStyle(color: Color(0xFFCDCDCD), fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(color: Color(0xFFCDCDCD), fontSize: 36.0, fontWeight: FontWeight.w400),
          body1: TextStyle(color: Color(0xFFCDCDCD), fontSize: 14.0, fontWeight: FontWeight.w100)
        )
      ),
      home: Homepage(title: 'EventX'),
    );
  }
}


class Homepage extends StatefulWidget {
    const Homepage({ Key key, this.title }) : super(key: key);

    final String title;

    @override
    _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {

  final List<Tab> homeTabs = <Tab>[
    Tab(text: 'Home'),
    Tab(text: 'Event'),
    Tab(text: 'Buy Ticket')
  ];

  TabController _homeTabController;

  @override
  void initState(){
    super.initState();
    _homeTabController = TabController(vsync: this, length: homeTabs.length);
  }

  @override
  void dispose(){
    _homeTabController.dispose();
    super.dispose();
  }

  Widget avatar(){
    return  Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.5), offset: Offset(0, 2), blurRadius: 10)],
        shape: BoxShape.circle,
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            'https://images-na.ssl-images-amazon.com/images/M/MV5BMjEzMjA0ODk1OF5BMl5BanBnXkFtZTcwMTA4ODM3OQ@@._V1_UY256_CR5,0,172,256_AL_.jpg'
          ),
          fit: BoxFit.cover,
        )
      )
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: homeTabs,
          controller: _homeTabController,
        )
      ),
      body: TabBarView(
        controller: _homeTabController,
        children: homeTabs.map((Tab tab){
          final String label = tab.text.toUpperCase();
          if(label == 'HOME'){
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              avatar(), 
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Aguy'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Color(0xFF777777).withAlpha(50), offset: Offset(0, 2), blurRadius: 5)], borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0)
                        ),
                        SizedBox(height: 15),
                      ],
                    )
                  )
                ),
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'This is the $label tab'
                ),
              ),
            );
          }
        }).toList(),
      )
    );
  }
}

