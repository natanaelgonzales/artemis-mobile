import 'package:flutter/material.dart';
import 'package:proj/components/orgs_drawer.dart';
import 'package:proj/core/app_colors.dart';
import 'package:proj/repository/ongs_data.dart';
import '../components/orgs_ong_infos.dart';
import '../models/onginfos_model.dart';

class OnginfoScreen extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: OrgsDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Informações',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGrey),
                ),
                IconButton(
                    color: Colors.transparent,
                    icon: Icon(Icons.menu, color: AppColors.blue),
                    // set your color here
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    }),
              ]),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                      "Nome",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkGrey),
                    ),
                  SizedBox(height: 15),
                  Text(
                    "Sammy Aram",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                        color: AppColors.darkGrey),
                  ),
                  Divider(),
                  SizedBox(height: 40),
                  Text(
                    "Sobre",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkGrey),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "O Instituto Sammy Aram é um projeto de um grupo de protetores e ambientalistas voluntários unidos pela causa animal e ambiental. O projeto nasceu em março de 2020, "
                        "mas todos os voluntários já participaram em outros projetos. "
                        "O instituto tem como público beneficiário: animais resgatados, protetores independentes, população de baixa renda que tenha animais e todos aqueles que nos procuram para orientá-los sobre a causa animal. ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.italic,
                        color: AppColors.darkGrey),
                    textAlign: TextAlign.justify,
                  ),
                  Divider(),
                  SizedBox(height: 40),
                  Text(
                    "Contato",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkGrey),
                  ),
                  SizedBox(height: 15),
                  Text("Email: sammyaram@sammyaram.org",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.darkGrey),
                    textAlign: TextAlign.justify,
                  ),
                  Text("Telefone: 31 - 3987 1228",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.darkGrey),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _generateOngsInfo(BuildContext context) async {

    final info_json = await OngsData.getJson();
    final ong_data = Ongsinfo.fromJson(info_json);

    return ong_data;
  }
}
