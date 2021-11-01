import 'package:flutter_application_07/constants.dart';
import 'package:flutter_application_07/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightAgeWidget extends StatelessWidget {
  final String text;
  final int number;
  final Function minus;
  final Function plus;
  final bool isCm;
  const WeightAgeWidget({
    Key key,
    @required this.text,
    @required this.number,
    @required this.minus,
    @required this.plus,
    this.isCm = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        isCm
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    number.toString(),
                    style: kHeightTextStyle,
                  ),
                  Text(
                    ' kg',
                  ),
                ],
              )
            : Text(
                number.toString(),
                style: kHeightTextStyle,
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundeIconButton(
              onTap: minus,
              child: FaIcon(FontAwesomeIcons.minus),
            ),
            SizedBox(width: 20.0),
            RoundeIconButton(
              onTap: plus,
              child: FaIcon(FontAwesomeIcons.plus),
            ),
          ],
        ),
      ],
    );
  }
}
