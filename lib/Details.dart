
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {

  String name,capital,flag,population,region,language,religion;

  Detail(this.name,this.capital,this.flag,this.population,this.region,this.language,this.religion)

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
                  image: DecorationImage(
                    image: NetworkImage(flag,),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
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
              RichText(text: const TextSpan(text:'Motto: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'Virtus unita fortior',style: TextStyle(color: Colors.white70,))]),),
              const SizedBox(height: 15,),
              RichText(text: TextSpan(text:'Official language: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: language,style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Ethnic group: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'Andorran, spanish, portuguese',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: TextSpan(text:'Religion: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: religion,style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Government: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'Parliamentary democracy',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 15,),
              RichText(text: const TextSpan(text:'Independence: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: '8th September,1278',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Area: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: '467.63km2',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Currency: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'Euro',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'GDP: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'USD3,400 billion',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 15,),
              RichText(text: const TextSpan(text:'Time zone: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'UTC+01',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
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