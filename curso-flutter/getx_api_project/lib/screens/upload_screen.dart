import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_project/components/custom_button_component.dart';
import 'package:getx_api_project/components/custom_field_component.dart';
import 'package:getx_api_project/components/header_component.dart';
import 'package:getx_api_project/controllers/videos_controller.dart';
import 'package:getx_api_project/screens/dashboard_screen.dart';
import 'package:getx_api_project/utils/colors_utils.dart';
import 'package:getx_api_project/utils/snackbars_utils.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({super.key});

  final TextEditingController textVideoTitleController =
      TextEditingController();

  final TextEditingController textVideoThumbNailController =
      TextEditingController();

  final VideosController videosController = Get.find<VideosController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.blueVoid,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const HeaderComponent(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                "Adicionar vídeo",
                style: TextStyle(
                  color: ColorsUtils.blueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
              ),
              child: CustomFieldComponent(
                  label: "Nome do vídeo",
                  textController: textVideoTitleController),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
              ),
              child: CustomFieldComponent(
                label: "URL do thumbnail",
                textController: textVideoThumbNailController,
              ),
            ),
            Row(
              children: <Widget>[
                CustomButtonComponent(
                  onTap: () {
                    videosController
                        .save(
                      thumbURL: textVideoThumbNailController.text,
                      title: textVideoTitleController.text,
                    )
                        .then(
                      (value) {
                        if (value) {
                          textVideoThumbNailController.clear();                            

                          textVideoTitleController.clear();

                          SnackbarsUtils.getSuccessUpload();

                          Get.offAll(
                            () => DashboardScreen(),
                          );
                        } else {
                          SnackbarsUtils.getErrorUpload();
                        }
                      },
                    );
                  },
                  text: "Adicionar vídeo",
                  icon: Icons.login,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
