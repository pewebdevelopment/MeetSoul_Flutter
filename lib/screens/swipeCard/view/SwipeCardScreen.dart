import 'package:datingui/res/colors.dart';
import 'package:datingui/res/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingui/screens/swipeCard/controller/SwipeCardScreenController.dart';
import 'package:datingui/my_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'dart:math' as math;
import '../../../res/strings.dart';
import '../../../widgets/back_button.dart';
import '../../notifications/notifications_screen.dart';

class SwipeCardScreen extends StatefulWidget {
  const SwipeCardScreen({Key? key}) : super(key: key);

  @override
  _SwipeCardScreenState createState() => _SwipeCardScreenState();
}

class _SwipeCardScreenState extends State<SwipeCardScreen>
    with TickerProviderStateMixin {
  final SwipeCardScreenController _swipeCardScreenController =
      Get.put(SwipeCardScreenController());
  Decoration buttonDeco =  BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(blurRadius: 10, color: Get.theme.primaryColor, spreadRadius: 5)
    ],
  );


  @override
  void dispose() {

    print("dispose");
    _swipeCardScreenController.animationController.stop();
    _swipeCardScreenController.animationController.dispose();
    _swipeCardScreenController.animationControllerDislike.dispose();
    _swipeCardScreenController.animationControllerSuper.dispose();

   Get.deleteAll();

    super.dispose();

  }

  animations() {
    _swipeCardScreenController.animationController = AnimationController(
        vsync: this,
        duration:
            Duration(milliseconds: _swipeCardScreenController.animMilliSecond))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _swipeCardScreenController.animationController
              .repeat(reverse: !_swipeCardScreenController.reverse);
          _swipeCardScreenController.reverse =
              !_swipeCardScreenController.reverse;
        }
      });

    _swipeCardScreenController.animationControllerSuper = AnimationController(
        reverseDuration:
            Duration(milliseconds: _swipeCardScreenController.animMilliSecond),
        vsync: this,
        duration:
            Duration(milliseconds: _swipeCardScreenController.animMilliSecond))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _swipeCardScreenController.animationControllerSuper.reverse();
        }
      });

    _swipeCardScreenController.animationControllerDislike = AnimationController(
        reverseDuration:
            Duration(milliseconds: _swipeCardScreenController.animMilliSecond),
        vsync: this,
        duration:
            Duration(milliseconds: _swipeCardScreenController.animMilliSecond))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _swipeCardScreenController.animationControllerDislike.reverse();
        }
      });

    _swipeCardScreenController.sizeAnimationSuper =
        Tween<double>(begin: 28.0, end: 36.0)
            .animate(_swipeCardScreenController.animationControllerSuper);
    _swipeCardScreenController.sizeAnimationDislike =
        Tween<double>(begin: 28.0, end: 36.0)
            .animate(_swipeCardScreenController.animationControllerDislike);

    _swipeCardScreenController.sizeAnimation =
        Tween<double>(begin: 30.0, end: 40.0)
            .animate(_swipeCardScreenController.animationController);
    _swipeCardScreenController.animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    animations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white,
      appBar: appBar,
      body: Obx(() {
        return _swipeCardScreenController.isEmpty.value
            ? noProfileWidget
            : mainWidget;
      }),
    );
  }

  get appBar {
    return AppBar(
      centerTitle: false,
      title: const Text(TXT_DISCOVER).addTextStyle( TextStyle(
           fontSize: 20, fontWeight: FontWeight.w600,color: Get.isDarkMode?Colors.white:Colors.black)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions:const [ NotificationButton()],
    );
  }

  get noProfileWidget {
    return Center(
      child:  Text(TXT_NO_PROFILE,style: GoogleFonts.sacramento(
        fontSize: 29
      ),),
    );
  }

  get mainWidget {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints.loose(Size.fromHeight(Get.height / 1.47)),
          child: tinderCard(),
        ),
        buttons
      ],
    );
  }

  Widget tinderCard() {
    return Obx(() {
      return SwipableStack(
          itemCount: _swipeCardScreenController.users.length,
          detectableSwipeDirections: const {
            SwipeDirection.right,
            SwipeDirection.left,
          },
          controller: _swipeCardScreenController.cardController,
          stackClipBehaviour: Clip.none,
          onSwipeCompleted: _swipeCardScreenController.onSwipeCompleted,
          horizontalSwipeThreshold: 0.8,
          verticalSwipeThreshold: 0.8,
          builder: (context, properties) {
            final itemIndex = properties.index %
                _swipeCardScreenController.users.value.length;

            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Stack(
                children: [
                  tinderCardView(itemIndex),
                  if (properties.stackIndex == 0 &&
                      properties.direction != null)
                    CardOverlay(
                      swipeProgress: properties.swipeProgress,
                      direction: properties.direction!,
                    )
                ],
              ),
            );
          });
    });
  }

  Widget tinderCardView(int index) {
    return InkWell(
      onTap: () => _swipeCardScreenController.onProfileClick(index),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 23.0,
              spreadRadius: -13.0,
              color: Colors.black54,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: _swipeCardScreenController.users.value[index].name,
                child: FadeInImage.assetNetwork(
                  placeholder: AppImages.loading,
                  placeholderFit: BoxFit.contain,
                  placeholderScale: 11,
                  image:
                      _swipeCardScreenController.users.value[index].images[0],
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(62)),
                      color: Get.theme.primaryColor.withOpacity(0.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(_swipeCardScreenController
                                      .users.value[index].name +
                                  "," +
                                  _swipeCardScreenController
                                      .users.value[index].age)
                              .addTextStyle(const TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500)),
                          _swipeCardScreenController.users.value[index].check
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    AppImages.check,
                                    height: 16,
                                    width: 16,
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          Text(_swipeCardScreenController
                                  .users.value[index].address)
                              .addTextStyle(const TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  get buttons {
    return Container(
      padding:  EdgeInsets.all(Get.height<700?0:11),

      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [likeButton, disLikeButton, superLikeButton],
      ),
    );
  }

  get likeButton {
    return Container(
      decoration: buttonDeco,
      child: CircleAvatar(
        maxRadius: Get.height<700?22:28,
        child: AnimatedBuilder(
            animation: _swipeCardScreenController.sizeAnimation,
            builder: (context, child) => Image.asset(
                  AppImages.heartm,
                  height: _swipeCardScreenController.sizeAnimation.value,
                  width: _swipeCardScreenController.sizeAnimation.value,
                )),
        backgroundColor: Get.theme.primaryColor.withAlpha(40),
      ).addInkwell(onClick: _swipeCardScreenController.onClickLikeButton),
    );
  }

  get disLikeButton {
    return Container(
      decoration: buttonDeco,
      child: CircleAvatar(
        maxRadius: Get.height<700?22:28,
        child: AnimatedBuilder(
            animation: _swipeCardScreenController.sizeAnimation,
            builder: (context, child) => Image.asset(
                  AppImages.cancel,
                  height: _swipeCardScreenController.sizeAnimationDislike.value,
                  width: _swipeCardScreenController.sizeAnimationDislike.value,
                  color: Colors.red,
                )),
        backgroundColor: Get.theme.primaryColor.withAlpha(40),
      ).addInkwell(onClick: _swipeCardScreenController.onClickDisLikeButton),
    );
  }

  get superLikeButton {
    return Container(
      decoration: buttonDeco,
      child: CircleAvatar(
        maxRadius: Get.height<700?22:28,
        child: AnimatedBuilder(
            animation: _swipeCardScreenController.sizeAnimation,
            builder: (_, child) => Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.grey[100]!,
              child: Image.asset(
                    AppImages.rocket,
                    height: _swipeCardScreenController.sizeAnimationSuper.value,
                    width: _swipeCardScreenController.sizeAnimationSuper.value,
                    color: Colors.red,
                  ),
            )),
        backgroundColor: Get.theme.primaryColor.withAlpha(40),
      ),
    ).addInkEffect(
        onClick: _swipeCardScreenController.onClickSuperLikeButton,
        radious: 50);
  }
}

class CardOverlay extends StatelessWidget {
  const CardOverlay({
    required this.direction,
    required this.swipeProgress,
    Key? key,
  }) : super(key: key);
  final SwipeDirection direction;
  final double swipeProgress;

  @override
  Widget build(BuildContext context) {
    final opacity = math.min<double>(swipeProgress, 1);

    final isRight = direction == SwipeDirection.right;
    final isLeft = direction == SwipeDirection.left;
    final isUp = direction == SwipeDirection.up;
    final isDown = direction == SwipeDirection.down;
    return Stack(
      children: [
        Opacity(
          opacity: isRight ? opacity : 0,
          child: CardLabel.right(),
        ),
        Opacity(
          opacity: isLeft ? opacity : 0,
          child: CardLabel.left(),
        ),
        Opacity(
          opacity: isUp ? opacity : 0,
          child: CardLabel.up(),
        ),
        Opacity(
          opacity: isDown ? opacity : 0,
          child: CardLabel.down(),
        ),
      ],
    );
  }
}

const _labelAngle = math.pi / 2 * 0.2;

class CardLabel extends StatelessWidget {
  const CardLabel._({
    required this.color,
    required this.label,
    required this.angle,
    required this.alignment,
    Key? key,
  }) : super(key: key);

  factory CardLabel.right() {
    return const CardLabel._(
      color: SwipeDirectionColor.right,
      label: 'Like',
      angle: -_labelAngle,
      alignment: Alignment.topLeft,
    );
  }

  factory CardLabel.left() {
    return const CardLabel._(
      color: SwipeDirectionColor.left,
      label: 'DISLIKE',
      angle: _labelAngle,
      alignment: Alignment.topRight,
    );
  }

  factory CardLabel.up() {
    return const CardLabel._(
      color: SwipeDirectionColor.up,
      label: 'UP',
      angle: _labelAngle,
      alignment: Alignment(0, 0.5),
    );
  }

  factory CardLabel.down() {
    return const CardLabel._(
      color: SwipeDirectionColor.down,
      label: 'DOWN',
      angle: -_labelAngle,
      alignment: Alignment(0, -0.75),
    );
  }

  final Color color;
  final String label;
  final double angle;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(
        vertical: 36,
        horizontal: 36,
      ),
      child: Transform.rotate(
        angle: angle,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: 4,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(6),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.4,
              color: color,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
