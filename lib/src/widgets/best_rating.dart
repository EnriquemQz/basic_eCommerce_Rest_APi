import 'package:app_project/src/services/api_services.dart';
import 'package:app_project/src/widgets/flayers.dart';
import 'package:flutter/material.dart';

class BestRating extends StatelessWidget {
  const BestRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices().bestRating(),
      builder: (context, AsyncSnapshot snap){
        if(snap.hasData){
          List bRList = snap.data['products'];

          bRList = bRList.where((e) => e['rating'] >= 4.7 ).toList();

          return Flayers(
            title: 'Mejor Calificado', 
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bRList.length,
              itemBuilder: (context, i){
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(bRList[i]['thumbnail'])
                          )
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '⭐ ${bRList[i]['rating'].toString()}',
                            style: const TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bRList[i]['description']
                      ),
                    )
                  ],
                );
              }
            )
          );
        } else {
          return const SizedBox();
        }
      }
    );
  }
}