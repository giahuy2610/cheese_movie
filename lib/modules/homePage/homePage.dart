import 'package:cheese_movie/modules/homePage/recentScrollView/recentScrollView.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../common/movie/movie.dart';
import '../categoryPage/filterByCategoryPage/filteredByCategoryPage.dart';
import './continuteWatchingScrollView/continuteWatchingScrollView.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/rendering.dart';
import '../engjoyMoviePage/enjoyMoviePage.dart';
import '../../models/futureGetMovies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const _indicatorSize = 150.0;

  /// Whether to render check mark instead of spinner
  bool _renderCompleteState = false;

  ScrollDirection prevScrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    // TODO: implement initState
    initDynamicLinks();
    super.initState();
  }

  void initDynamicLinks() async {
    print('haaaaaaaaaaaaaaaaaaa');
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      handleDynamicLink(deepLink);
    }

    FirebaseDynamicLinks.instance.onLink.listen(
        (PendingDynamicLinkData dynamicLink) {
      final Uri deepLink = dynamicLink.link;
      handleDynamicLink(deepLink);
    }, onError: (e) {
      print(e);
    });
  }

  // Ở đây nếu link có chứa "post" thì sẽ cho nhảy đến màn hình Post và truyền param thứ 2 của link là 56 qua màn hình Post.
  void handleDynamicLink(Uri url) {
    List<String> separatedString = [];
    separatedString.addAll(url.path.split('/'));
    FutureGetMovies(separatedString[1]).then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (context) => EnjoyMoviePage(value))));
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      offsetToArmed: _indicatorSize,
      onRefresh: () => Future.delayed(const Duration(seconds: 2)),
      completeStateDuration: const Duration(seconds: 2),
      onStateChanged: (change) {
        /// set [_renderCompleteState] to true when controller.state become completed
        if (change.didChange(to: IndicatorState.complete)) {
          setState(() {
            _renderCompleteState = true;
          });

          /// set [_renderCompleteState] to false when controller.state become idle
        } else if (change.didChange(to: IndicatorState.idle)) {
          setState(() {
            _renderCompleteState = false;
          });
        }
      },
      builder: (
        BuildContext context,
        Widget child,
        IndicatorController controller,
      ) {
        return Stack(
          children: <Widget>[
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget? _) {
                if (controller.scrollingDirection == ScrollDirection.reverse &&
                    prevScrollDirection == ScrollDirection.forward) {
                  controller.stopDrag();
                }

                prevScrollDirection = controller.scrollingDirection;

                final containerHeight = controller.value * _indicatorSize;

                return Container(
                  alignment: Alignment.center,
                  height: containerHeight,
                  child: OverflowBox(
                    maxHeight: 40,
                    minHeight: 40,
                    maxWidth: 40,
                    minWidth: 40,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _renderCompleteState
                            ? Colors.greenAccent.shade100
                            : Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: _renderCompleteState
                          ? Image.asset('assets/images/main_logo.png')
                          : SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.white),
                                value:
                                    controller.isDragging || controller.isArmed
                                        ? controller.value.clamp(0.0, 1.0)
                                        : null,
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              builder: (context, _) {
                return Transform.translate(
                  offset: Offset(0.0, controller.value * _indicatorSize),
                  child: child,
                );
              },
              animation: controller,
            ),
          ],
        );
      },
      child: Container(
          child: ListView(
        children: [
          RecentScrollView(),
          ContinuteWatchingScrollView(),
        ],
      )),
    );
  }
}
