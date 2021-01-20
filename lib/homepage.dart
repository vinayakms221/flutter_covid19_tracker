import 'dart:convert';
import 'package:covid_19/datasource.dart';
import 'package:covid_19/pages/countryPage.dart';
import 'package:covid_19/panels/infoPanel.dart';
import 'package:covid_19/panels/mosteffectedcountries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'panels/worldwidepanel.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldWideData()async{
    http.Response response= await http.get('https://corona.lmao.ninja/v3/covid-19/all');
    setState(() {
      worldData=json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData()async{
    http.Response response= await http.get('https://corona.lmao.ninja/v3/covid-19/countries');
    setState(() {
      countryData=json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19  TRACKER'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Worldwide', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text('Regional', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)),
                  ),
                ],
              ),
            ),
            worldData==null?Center(child: CircularProgressIndicator()):WorldWidepanel(worldData: worldData,),

            SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Most Affected Countries', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ),

            SizedBox(height: 20,),

            countryData==null?Container():MostAffectedPanel(countryData: countryData,),

            SizedBox(height: 25,),

            InfoPanel(),
            SizedBox(height: 20,),
            Center(child: Text('WE ARE TOGETHER IN THE FIGHT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
            SizedBox(height: 50,)


          ],
        ),
      ),
    );
  }
}
