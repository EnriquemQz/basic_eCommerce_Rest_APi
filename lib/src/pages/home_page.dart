import 'package:app_project/src/widgets/best_rating.dart';
import 'package:app_project/src/widgets/best_seller.dart';

import 'package:flutter/material.dart';

import 'package:app_project/src/widgets/categories.dart';
import 'package:app_project/src/widgets/promo_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: const [
           PromoBanner(),
           Categories(),
           BestSeller(),
           BestRating()
        ],
      ),
    );
  }
}




