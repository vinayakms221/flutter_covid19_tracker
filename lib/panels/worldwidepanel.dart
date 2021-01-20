import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldWidepanel extends StatelessWidget {
  final Map worldData;

  const WorldWidepanel({Key key, this.worldData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2,),
        children: [
          StatusPanel(
              title: 'CONFIRMED',
              panelColor1: Colors.red[100],
              panelColor2: Colors.red[300],
              textColor: Colors.white,
              count: worldData['cases'].toString()),
          StatusPanel(
              title: 'ACTIVE',
              panelColor1: Colors.blue[50],
              panelColor2: Colors.blue[400],
              textColor: Colors.white,
              count: worldData['active'].toString()),
          StatusPanel(
              title: 'RECOVERED',
              panelColor1: Colors.green[100],
              panelColor2: Colors.green[300],
              textColor: Colors.white,
              count: worldData['recovered'].toString()),
          StatusPanel(
              title: 'DEATHS',
              panelColor1: Colors.grey[100],
              panelColor2: Colors.grey[700],
              textColor: Colors.white,
              count: worldData['deaths'].toString()),

          StatusPanel(
              title: 'DEATHS',
              panelColor1: Colors.grey[100],
              panelColor2: Colors.grey[700],
              textColor: Colors.white,
              count: worldData['deaths'].toString()),
        ],
      ),
    );
  }
}


class StatusPanel extends StatelessWidget {

  final Color panelColor1;
  final Color panelColor2;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor1, this.panelColor2, this.textColor, this.title, this.count,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(5),
      height: 80,
      width: width/2,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [panelColor1, panelColor2]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: textColor),),
          SizedBox(height: 5,),
          Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: textColor),),
        ],
      ),
    );
  }
}

