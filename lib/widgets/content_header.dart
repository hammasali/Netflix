import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';
import 'package:video_player/video_player.dart';

import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featheredContent;

  const ContentHeader({Key key, this.featheredContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveUI(
      mobile: _ContentHeaderMobile(featheredContent: featheredContent),
      desktop: _ContentHeaderDesktop(featheredContent: featheredContent),
    );
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featheredContent;

  const _ContentHeaderMobile({Key key, this.featheredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(featheredContent.imageUrl),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image(image: AssetImage(featheredContent.titleImageUrl)),
          ),
        ),
        Positioned(
            bottom: 40.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  onTap: () => print('My list'),
                  info: 'List',
                ),
                _PlayButton(),
                VerticalIconButton(
                  icon: Icons.info_outline,
                  onTap: () => print('info'),
                  info: 'Info',
                )
              ],
            ))
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  final Content featheredContent;

  const _ContentHeaderDesktop({Key key, this.featheredContent})
      : super(key: key);

  @override
  __ContentHeaderDesktopState createState() => __ContentHeaderDesktopState();
}

class __ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  VideoPlayerController videoPlayerController;
  bool isMuted = true;

  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.network(widget.featheredContent.videoUrl)
          ..initialize().then((_) {
            setState(() {});
          })
          ..play()
          ..setVolume(0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => videoPlayerController.value.isPlaying
          ? videoPlayerController.pause()
          : videoPlayerController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
              aspectRatio: videoPlayerController.value.initialized
                  ? videoPlayerController.value.aspectRatio
                  : 2.344,
              child: videoPlayerController.value.initialized
                  ? VideoPlayer(videoPlayerController)
                  : Image(
                      image: AssetImage(widget.featheredContent.imageUrl),
                      fit: BoxFit.cover,
                    )),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: videoPlayerController.value.initialized
                  ? videoPlayerController.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
          ),
          Positioned(
              left: 60.0,
              right: 60.0,
              bottom: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250.0,
                    child: Image(
                      image: AssetImage(widget.featheredContent.titleImageUrl),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    widget.featheredContent.description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                              color: Colors.black,
                              offset: Offset(4.0, 2.0),
                              blurRadius: 6.0)
                        ]),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      _PlayButton(),
                      SizedBox(
                        width: 16.0,
                      ),
                      FlatButton.icon(
                          onPressed: () {},
                          color: Colors.white,
                          icon: const Icon(
                            Icons.info_outline,
                            size: 30.0,
                          ),
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
                          label: const Text(
                            'More Info',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        width: 20.0,
                      ),
                      if (videoPlayerController.value.initialized)
                        IconButton(
                            icon: isMuted
                                ? Icon(Icons.volume_up)
                                : Icon(Icons.volume_off),
                            onPressed: () {
                              setState(() {
                                isMuted
                                    ? videoPlayerController.setVolume(100)
                                    : videoPlayerController.setVolume(0);
                                isMuted =
                                    videoPlayerController.value.volume == 0;
                              });
                            })
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        padding: !ResponsiveUI.isDesktop(context)
            ? EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)
            : EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
        color: Colors.white,
        onPressed: () => print('Play Button'),
        icon: Icon(
          Icons.play_arrow,
          size: 30.0,
        ),
        label: Text(
          'Play',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
        ));
  }
}
