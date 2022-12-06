import 'package:country_list/Details.dart';
import 'package:country_provider2/country_provider2.dart';
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

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() async {

    final allCountries = await CountryProvider.instance.getAllCountries();
    countries = allCountries;

    /*final allCountryNames = await CountryProvider.instance.getAllCountries(filter: CountryFilter(isName: true,));
    names = allCountryNames.map((e) => e.name).toList();

    final allCountryCapitals = await CountryProvider.instance.getAllCountries(filter: CountryFilter(isCapital: true,));
    capitals = allCountryCapitals.map((e) => e.capital).toList();

    final allCountryFlags = await CountryProvider.instance.getAllCountries(filter: CountryFilter(isFlag: true,));
    flags = allCountryFlags.map((e) => e.capital).toList();*/

  }

  searchCountriesByName(String searchName) async {

    final searchResults = await CountryProvider.instance.getCountriesByName(searchName);
    return searchResults;

  }

// Countries data
  //List names = [];
  //List capitals = [];
  //List flags = [];
  List results = [];
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
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,

                    icon: IconButton(onPressed: (){
                       results = searchCountriesByName(search.toString());
                       countries = results;
                       if(results.isEmpty){
                        countriesData = countries;
                       }else {
                        countriesData = results;
                       }
                    },
                    icon: const Icon(Icons.search_sharp,size: 22,),color: Colors.white,
                      padding: EdgeInsets.only(left: 10) ,),
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
                    ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.language_outlined,size: 20,),label: Text('EN'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        side: const BorderSide(color: Colors.white,width: 0.2),
                      ),
                    ),
                    ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.filter_alt_outlined,size: 20,),label: const Text('Filter'),
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
          itemCount: 20,
            itemBuilder: (_,index){

              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Detail(
                        countriesData[index].name.toString(),countriesData[index].capital,
                        countriesData[index].flag,countriesData[index].population,
                        countriesData[index].region,countriesData[index].language,
                        countriesData[index].religion))
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
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(countriesData[index].flag.toString()),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
              ),const SizedBox(width: 5,),
                    Column(
                      children: [
                        Text(countriesData[index].name.toString(),style: const TextStyle(color: Colors.black),),
                        Text(countriesData[index].capital.toString(),style: const TextStyle(color: Colors.black),)
                      ],)
                    ]),
                )),
              );
    }),
    );
  }
}
