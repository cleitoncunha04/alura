
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api_project/models/video_model.dart';
import 'package:getx_api_project/services/videos_services.dart';
import 'package:logger/logger.dart';

class VideosController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    findAllFromUser();
  }

  final RxBool _isVideoLoading = true.obs;

  final RxList<VideoModel> _videos = <VideoModel>[].obs;

  final VideosServices _videosServices = Get.put(VideosServices());

  List<VideoModel> get videos => _videos;

  final Logger _logger = Logger();

  final Map<String, dynamic> session = GetStorage().read('session');

  RxBool get isVideoLoading => _isVideoLoading;

  Future<bool> findAllFromUser() async {
    bool isFound = false;

    _logger.i(session);

    try {
      _isVideoLoading(true);

      Response<List<VideoModel>> response =
          await _videosServices.findAllByUserId(session["user"]["id"]);

      if (response.statusCode == 200) {
        isFound = true;

        _videos.assignAll(response.body!);

        _logger.i(_videos.toJson());
      } else {
        throw response.statusText!;
      }
    } catch (e) {
      _logger.e(
        e.toString(),
      );
    } finally {
      _isVideoLoading(false);
    }

    return isFound;
  }

  Future<bool> save({
    required String thumbURL,
    required String title,
  }) async {
    _logger.i(session);

    bool isSaved = false;

    final VideoModel video = VideoModel(
      thumbURL: thumbURL,
      title: title,
      userId: session["user"]["id"],
    );

    try {
      Response<void> response = await _videosServices.save(
        video,
        session["accessToken"],
      );

      if (response.statusCode == 201) {
        isSaved = true;
      } else {
        throw response.statusText!;
      }
    } catch (e) {
      _logger.e(e.toString());
    }
    return isSaved;
  }
}
