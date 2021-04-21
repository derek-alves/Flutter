import 'package:devquizz/core/app_gradients.dart';
import 'package:devquizz/core/app_text_styles.dart';
import 'package:devquizz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: "Olá, ",
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                  text: "Derek!",
                                  style: AppTextStyles.titleBold)
                            ]),
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/59737946?s=400&u=3be486fd32e1d1a1a9dae23a33d9a3c17b06b230&v=4"))),
                      )
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment(0.0, 1.0),
                    child: Flexible(fit: FlexFit.loose, child: ScoreCard()))
              ],
            ),
          ),
        );
}
