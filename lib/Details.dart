
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Andorra',),
        centerTitle: true,
        leading: BackButton(),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 300,
                margin: EdgeInsets.only(bottom: 5),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/flower.jpeg',),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
              ),
              const SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Population: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: '77354',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Region: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'Europe',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Capital: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'Andora la Vella',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Motto: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'Virtus unita fortior',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 15,),
              RichText(text: const TextSpan(text:'Official language: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'Catalan',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Ethnic group: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'Andorran, spanish, portuguese',style: TextStyle(color: Colors.white70,))]),),
              SizedBox(height: 5,),
              RichText(text: const TextSpan(text:'Religion: ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                  children: [TextSpan(text: 'Christianity',style: TextStyle(color: Colors.white70,))]),),
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