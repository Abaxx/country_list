import 'package:explore/Details.dart';
import 'package:country_provider2/country_provider2.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController textEditSearch = TextEditingController();

  @override
  void initState() {
    loadData();
    textEditSearch.addListener(() {
      if(textEditSearch.text.isEmpty){
        loadData();
      }else {
        searchByCountryName(textEditSearch.text);
      }
    });
    super.initState();
  }



   loadData() {
    CountryProvider.instance.getAllCountries().then((value) {
      setState(()=> countriesData = value);
    });
    /*final allCountryNames = await CountryProvider.instance.getAllCountries(filter: CountryFilter(isName: true,));
    names = allCountryNames.map((e) => e.name).toList();

    final allCountryCapitals = await CountryProvider.instance.getAllCountries(filter: CountryFilter(isCapital: true,));
    capitals = allCountryCapitals.map((e) => e.capital).toList();

    final allCountryFlags = await CountryProvider.instance.getAllCountries(filter: CountryFilter(isFlag: true,));
    flags = allCountryFlags.map((e) => e.capital).toList();*/

  }

  void searchByCountryName(String countryName){
      setState(() {
        try {
          CountryProvider.instance
              .getCountriesByName(countryName).then((value) {
            countriesData = value as List;
          });
        } on Exception catch (e) {}
      },
      );
  }

// Countries data
  List countries = [];
  List countriesData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: RichText(text: const TextSpan(text:'Explore',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Pacifico"),
            children: [TextSpan(text: '.',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontFamily: "Pacifico"))]),),
        scrolledUnderElevation: 1,
        actions: [IconButton(onPressed: ()async{
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
                color: const Color(0xff223745),
                margin: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                child: TextField(
                  controller: textEditSearch,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,

                    icon: IconButton(onPressed: () {
                      searchByCountryName(textEditSearch.text);
                    },
                    icon: const Icon(Icons.search_sharp,size: 22,),color: Colors.white,
                      padding: const EdgeInsets.only(left: 10) ,),
                   // fillColor: Color(0xff223745),filled: true,
                    label: const Text('Search Country',style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(onPressed: (){
                      final snackBar = SnackBar(content: Container(
                        height: 450,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Languages',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),Icon(Icons.cancel_presentation,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Bahasa',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.circle_outlined,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Deutsch',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.circle_outlined,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('English',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.circle_outlined,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Espanol',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.circle_outlined,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Francaise',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.circle_outlined,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Italiano',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.circle_outlined,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('portugues',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.circle_outlined,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Pycckuu',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.circle_outlined,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Svenska',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.circle_outlined,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Turkce',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.circle_outlined,size: 15,color: Colors.white, )],
                            )
                          ],
                        ),
                      ),
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                          ),
                          backgroundColor: Colors.black);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }, icon: const Icon(Icons.language_outlined,size: 20,),label: const Text('EN'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        side: const BorderSide(color: Colors.white,width: 0.2),
                      ),
                    ),
                    ElevatedButton.icon(onPressed: (){
                      final snackBar = SnackBar(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                        ),
                          content: Container(
                        height: 130,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Filter',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),Icon(Icons.cancel_presentation,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Continent',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.arrow_downward_outlined,size: 15,color: Colors.white, )],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text('Time Zone',style: TextStyle(color: Colors.white,fontSize: 15),),Icon(Icons.arrow_downward_outlined,size: 15,color: Colors.white, )],
                            )
                          ],
                        ),
                      ),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        backgroundColor: Colors.black);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                      icon: const Icon(Icons.filter_alt_outlined,size: 20,),label: const Text('Filter'),
                      style: ElevatedButton.styleFrom(primary: Colors.black,
                        side: const BorderSide(color: Colors.white,width: 0.2),
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
          itemCount: countriesData.length,
            itemBuilder: (_,index){

              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Detail(
                        countriesData[index].name.toString(),countriesData[index].capital.toString(),
                        countriesData[index].flag.toString(),countriesData[index].population.toString(),
                        countriesData[index].region.toString(),countriesData[index].languages[0],
                        countriesData[index].area.toString(),countriesData[index].currencies[0],countriesData[index].timezones[0].toString())
                      )
                        );
                },
                child: Card(
                  child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                  child: Row(
                    children: [ 
                      Container(
                height: 50,
                width: 50,
                decoration:  const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ), 
                        child: SvgPicture.network(countriesData[index].flag.toString()),
              ),
                      const SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(countriesData[index].name.toString(),style: const TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                        Text(countriesData[index].capital.toString(),style: const TextStyle(color: Colors.black54),)
                      ],)
                    ]),
                )),
              );
    }),
    );
  }
}
