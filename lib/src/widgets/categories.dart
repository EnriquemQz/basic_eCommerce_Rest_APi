import 'package:app_project/src/services/api_services.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget{
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: FutureBuilder(
          future: ApiServices().categories(),
          builder: (context, AsyncSnapshot snap) {
            if (snap.hasData) {
              final catList = snap.data as List;

              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  itemCount: catList.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Container(
                        width: 180.0,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16.0)),
                        child: Align(
                          alignment: Alignment.bottomCenter / 1.2,
                          child: Text(
                            catList[i],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
