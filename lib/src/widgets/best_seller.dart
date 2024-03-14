import 'package:app_project/src/services/api_services.dart';
import 'package:app_project/src/widgets/flayers.dart';
import 'package:flutter/material.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices().bestSeller(),
      builder: (context, AsyncSnapshot snap){
        if(snap.hasData){
          final bSList = snap.data['products'] as List;

          return Flayers(
            title: 'Lo más vendido', 
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
              ),
              itemCount: bSList.length, 
              itemBuilder: (context, i){
                return SizedBox(
                  child: Image(
                    image: NetworkImage(bSList[i]['thumbnail'])
                  ),
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