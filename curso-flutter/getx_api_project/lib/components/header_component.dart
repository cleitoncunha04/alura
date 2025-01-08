import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_project/components/custom_button_component.dart';
import 'package:getx_api_project/screens/upload_screen.dart';
import 'package:getx_api_project/utils/colors_utils.dart';
import 'package:getx_api_project/utils/images_utils.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 38.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                ImagesUtils.logo,
                height: 28,
              ),
              CustomButtonComponent(
                onTap: () {Get.to(() => UploadScreen());},
                text: "Upload de vídeo",
                icon: Icons.upload,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "Título do canal",
            style: TextStyle(
              color: ColorsUtils.blueAccent,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          "@seucanal",
          style: TextStyle(
            color: ColorsUtils.blueAccent,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          width: double.infinity,
          height: 1,
          decoration: BoxDecoration(
            color: ColorsUtils.mediumGrey,
          ),
        ),
      ],
    );
  }
}
