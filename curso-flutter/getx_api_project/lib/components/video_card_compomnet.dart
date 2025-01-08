import 'package:flutter/material.dart';
import 'package:getx_api_project/utils/colors_utils.dart';
import 'package:getx_api_project/utils/images_utils.dart';

class VideoCardComponent extends StatelessWidget {
  const VideoCardComponent(
      {super.key, required this.imageURL, required this.videoTitle});

  final String imageURL;
  final String videoTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          height: 202,
          width: 360,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageURL),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImagesUtils.profilePicture),
                ),
              ),
            ),
            Flexible(
              child: Text(
                videoTitle,
                style: TextStyle(
                  color: ColorsUtils.mediumGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
