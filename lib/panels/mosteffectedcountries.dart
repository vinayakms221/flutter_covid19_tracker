import 'package:flutter/material.dart';


class MostAffectedPanel extends StatelessWidget {

  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(flex: 1,child: Container(child: Image.network(countryData[index]['countryInfo']['flag'], height: 25,width: 50,))),
              // SizedBox(width: 10,),
              Expanded(flex:1,child: Container(child: Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),))),
              // SizedBox(width: 10,),
              Expanded(flex: 1,child: Container(child: Text('Deaths:' + countryData[index]['deaths'].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),))),
            ],
          ),
        );
      },
        itemCount: 5,
      ),
    );
  }
}
