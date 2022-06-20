import 'package:flutter/material.dart';
import 'package:proj/core/app_colors.dart';

class OrgsSpotlightCard extends StatelessWidget {
  final String img;
  final String description;
  final Color color;

  OrgsSpotlightCard({
    @required this.img,
    @required this.description,
    @required this.color
  }): assert(img != null),
      assert(description != null),
      assert(color != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        width: 370,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkGrey
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 200,
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      ),
                    ),
                  )
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  color: AppColors.white,
                  child: Image.asset(img),
                  width: 120,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}