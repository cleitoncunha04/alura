import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_project/components/custom_button_component.dart';
import 'package:getx_api_project/components/header_component.dart';
import 'package:getx_api_project/components/video_card_compomnet.dart';
import 'package:getx_api_project/controllers/videos_controller.dart';
import 'package:getx_api_project/models/video_model.dart';
import 'package:getx_api_project/screens/upload_screen.dart';
import 'package:getx_api_project/utils/colors_utils.dart';
import 'package:getx_api_project/utils/images_utils.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final VideosController videosController = Get.put(VideosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.blueVoid,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          16,
          64,
          16,
          28,
        ),
        child: Obx(
          () => videosController.isVideoLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : videosController.videos.isEmpty
                  ? const _EmptyDashboard()
                  : _FullDashboard(videosList: videosController.videos),
        ),
      ),
    );
  }
}

class _EmptyDashboard extends StatelessWidget {
  const _EmptyDashboard();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const HeaderComponent(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 72.0,
              horizontal: 31,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.asset(
                    ImagesUtils.emptyDashboard,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 40.0,
                  ),
                  child: Text(
                    "Você ainda não postou nenhum vídeo em seu perfil, que tal começar?",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomButtonComponent(
                      onTap: () {
                        Get.to(() => UploadScreen());
                      },
                      text: "Upload de vídeo",
                      icon: Icons.upload,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FullDashboard extends StatelessWidget {
  const _FullDashboard({required this.videosList});

  final List<VideoModel> videosList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: HeaderComponent(),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Text(
            "Seus vídeos",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorsUtils.blueAccent,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      SliverList.builder(
        itemCount: videosList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: VideoCardComponent(
              imageURL: videosList[index].thumbURL,
              videoTitle: videosList[index].title),
        ),
      ),
    ]);
  }
}
