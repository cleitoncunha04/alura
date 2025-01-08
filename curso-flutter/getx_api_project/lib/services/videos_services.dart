import 'package:get/get.dart';
import 'package:getx_api_project/models/video_model.dart';
import 'package:getx_api_project/utils/api_endpoints.dart';

class VideosServices extends GetConnect {
  @override
  void onInit() {
    super.onInit();

    httpClient.baseUrl = ApiEndpoints.baseUrl;
  }

  Future<Response<void>> save(VideoModel video, String token) => post(
        ApiEndpoints.addVideoByUser,
        video.toJson(),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

  Future<Response<List<VideoModel>>> findAllByUserId(int userId) => get(
        ApiEndpoints.videos,
        decoder: VideoModel.listFromJson,
        query: {"userId": userId.toString()},
      );
}
