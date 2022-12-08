
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Detail extends StatelessWidget {

  String name,capital,flag,population,region,area,timezone;
  var language,currency;

  Detail(this.name,this.capital,this.flag,this.population,this.region,this.language,this.area,this.currency,this.timezone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name,),
        centerTitle: true,
        leading: BackButton(),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 300,
                margin: EdgeInsets.only(bottom: 5),
                decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: SvgPicture.network(flag),
              ),
              const SizedBox(height: 5,),
              RichText(text:  TextSpan(text:'Population: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: population,style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: TextSpan(text:'Region: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: region,style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: TextSpan(text:'Capital: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: capital,style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              const SizedBox(height: 15,),
              RichText(text: TextSpan(text:'Official language: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: language.toString(),style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: TextSpan(text:'Area: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: area,style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: TextSpan(text:'Currency.to: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: currency.toString(),style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: TextSpan(text:'Time Zone: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: timezone,style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 15,),
              RichText(text: const TextSpan(text:'Date format: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'dd/mm/yyyy',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Dialling code: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: '+376',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Driving side: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'Right',style: TextStyle(color: Colors.white70,))]),),
              
            ],
          ),
        ),
      ),
    );
  }
}