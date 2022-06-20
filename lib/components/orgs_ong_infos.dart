import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proj/core/app_colors.dart';

class OrgsOngInfoCards extends StatelessWidget {
  final String textArea;
  final String data;

  OrgsOngInfoCards({
    @required this.textArea,
    @required this.data,
  })  : assert(textArea != null),
        assert(data != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textArea,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey),
                ),
                SizedBox(height: 10),
                Text(
                  data,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
