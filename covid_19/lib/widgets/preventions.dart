import 'package:covid_19/widgets/prevention_card.dart';
import 'package:flutter/material.dart';

class Preventions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PreventionCard(
          svgSrc: 'assets/icons/hand_wash.svg',
          title: 'Wash Hands',
        ),
        PreventionCard(
          svgSrc: 'assets/icons/use_mask.svg',
          title: 'Use Masks',
        ),
        PreventionCard(
          svgSrc: 'assets/icons/Clean_Disinfect.svg',
          title: 'Clean Disinfect',
        ),
      ],
    );
  }
}