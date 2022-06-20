import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_icons.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';

class HowToPaintScreen extends StatelessWidget {
  const HowToPaintScreen({Key? key}) : super(key: key);

  static const routeName = 'how_to_paint';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.lightGrey,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: -240,
              top: 100,
              child: Container(
                width: screenSize.height / 2.5,
                height: screenSize.height / 2.5,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      CustomColors.secondary.withOpacity(0.3),
                      CustomColors.lightGrey.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 270,
              top: 400,
              child: Container(
                width: screenSize.height / 2.5,
                height: screenSize.height / 2.5,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      CustomColors.secondary.withOpacity(0.3),
                      CustomColors.lightGrey.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: -240,
              top: 700,
              child: Container(
                width: screenSize.height / 2.5,
                height: screenSize.height / 2.5,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      CustomColors.secondary.withOpacity(0.3),
                      CustomColors.lightGrey.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 270,
              top: 1000,
              child: Container(
                width: screenSize.height / 2.5,
                height: screenSize.height / 2.5,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      CustomColors.secondary.withOpacity(0.3),
                      CustomColors.lightGrey.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.arrow_back_ios_rounded),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Como pintar',
                              style: Fonts.title2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const _InstrunctionItem(
                    index: 1,
                    title: 'Prepare a tinta',
                    description: 'Abra a tinta e a coloque na caçamba',
                    icon: CustomIcons.paint_bucket,
                  ),
                  const _InstrunctionItem(
                    index: 2,
                    title: 'Primeira demão',
                    description:
                        'Aplique a tinta na parede em N como mostrado no vídeo para melhor aproveitamento',
                    icon: CustomIcons.brush,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Icon(
                        Icons.arrow_downward_rounded,
                        color: CustomColors.cardIndicationColor,
                        size: 80,
                      ),
                    ),
                  ),
                  const _InstrunctionItem(
                    index: 3,
                    title: 'Repasse a tinta',
                    description:
                        'Passe mais uma camada de tinta por cima da parede para reduzir imperfeições',
                    icon: CustomIcons.brush,
                  ),
                  const _WaitReminder(),
                  const _InstrunctionItem(
                    index: 4,
                    title: 'Segunda demão',
                    description:
                        'Aplique a tinta na parede em N como mostrado no vídeo para melhor aproveitamento',
                    icon: CustomIcons.brush,
                  ),
                  const _InstrunctionItem(
                    index: 5,
                    title: 'Repasse a tinta',
                    description:
                        'Passe mais uma camada de tinta por cima da parede para reduzir imperfeições',
                    icon: CustomIcons.brush,
                  ),
                  const _WaitReminder(),
                  const _InstrunctionItem(
                    index: 6,
                    title: 'Acabou',
                    description: 'Sua parede está pronta',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InstrunctionItem extends StatelessWidget {
  const _InstrunctionItem(
      {Key? key,
      required this.index,
      required this.title,
      required this.description,
      this.icon})
      : super(key: key);

  final int index;
  final String title, description;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    index.toString(),
                    style: Fonts.instrunctionIndex,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    style: Fonts.subtitle1,
                  ),
                ],
              ),
              if (icon != null) Icon(icon),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              description,
              style: Fonts.description,
            ),
          ),
        ],
      ),
    );
  }
}

class _WaitReminder extends StatelessWidget {
  const _WaitReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CustomIcons.time,
            color: CustomColors.secondary,
            size: 50,
          ),
          Text(
            'Aguarde 2 horas',
            style: Fonts.subtitle1,
          ),
        ],
      ),
    );
  }
}
