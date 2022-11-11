import 'package:country_list/Details.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme,darkTheme)=> MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: RichText(text: const TextSpan(text:'Explore',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Pacifico"),
            children: [TextSpan(text: '.',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontFamily: "Pacifico"))]),),
        scrolledUnderElevation: 1,
        actions: [IconButton(onPressed: (){
          AdaptiveTheme.of(context).toggleThemeMode();
        }, icon: const Icon(Icons.bedtime_outlined),
        )
        ],
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Column(
            children: [
              Container(
                width: 350,
                height: 48,
                color: Color(0xff223745),
                margin: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                child: TextField(
                  controller: search,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,

                    icon: IconButton(onPressed: (){},icon: const Icon(Icons.search_sharp,size: 22,),color: Colors.white,
                      padding: EdgeInsets.only(left: 10) ,),
                   // fillColor: Color(0xff223745),filled: true,
                    label: const Text('Search Country',style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.language_outlined,size: 20,),label: Text('EN'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        side: BorderSide(color: Colors.white,width: 0.2),
                      ),
                    ),
                    ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.filter_alt_outlined,size: 20,),label: const Text('Filter'),
                      style: ElevatedButton.styleFrom(primary: Colors.black,
                        side: BorderSide(color: Colors.white,width: 0.2),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
      //backgroundColor: Colors.black,
      body: ListView.builder(
          itemCount: 20,
            itemBuilder: (_,index){

              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Detail()));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  child: Row(
                    children: [Image.asset('assets/images/flower.jpeg',height: 50,width: 50,),SizedBox(width: 5,),
                    Column(
                      children: const [
                        Text('Nigeria',style: TextStyle(color: Colors.black),),
                        Text('Abuja',style: TextStyle(color: Colors.black),)
                      ],
                    )],
                  ),
                ),
              );
    }),
    );
  }
}
