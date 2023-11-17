
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/screens/home/widgets/story_widget.dart';
import 'package:instagram_clone/themes/dark_theme.dart';
import 'package:instagram_clone/widgets/avatar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ViewStory extends StatefulWidget{
  final Map user;
  const ViewStory({super.key, required this.user});
  @override
  State<ViewStory> createState() => ViewStoryState();
}

class ViewStoryState extends State<ViewStory>{

  List stories = [];
  TextEditingController messageController = TextEditingController();
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final StreamController<int> _controller = StreamController<int>();
  late Timer _timer;
  int _start = 0;
  bool showBackground = false;
  bool skipTimer = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stories = widget.user['stories'];
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
        if(!skipTimer){
          if (_start == 5) {
            if(currentIndex == stories.length - 1) {
              Navigator.of(context).pop();
            }else{
              await carouselController.nextPage(duration: const Duration(milliseconds: 10));
              _start = 0;
              _controller.add(_start);
            }
          } else {
            _controller.add(++_start);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Dismissible(
        key: const Key("dismiss_key"),
        onDismissed: (_) {
          // messageController.dispose();
          _controller.close();
          _timer.cancel();
          Navigator.of(context).pop();
        },
        direction: DismissDirection.down,
        background: Container(
          color: darkTheme.scaffoldBackgroundColor,
        ),
        child: Container(
          color: darkTheme.scaffoldBackgroundColor,
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                        carouselController: carouselController,
                        items: stories.map((story) => StoryWidget(
                          key: UniqueKey(),
                          padding: padding,
                          url: story['url'],
                        )).toList(),
                        options: CarouselOptions(
                            height: size.height - padding.top - padding.bottom - size.height*0.09,
                            viewportFraction: 1,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason){
                              setState(() {
                                currentIndex = index;
                              });
                            }
                        )
                    ),
                    Container(
                      width: size.width,
                      height: size.height*0.8,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.00)],
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                          )
                      ),
                    ),
                    SizedBox(
                      height: size.height - padding.top - padding.bottom - size.height*0.09,
                      width: size.width,
                      child: GestureDetector(
                        onTapUp: (details){
                          if(details.localPosition.dx < size.width*0.3){
                            if(currentIndex != 0){
                              carouselController.previousPage(duration: const Duration(milliseconds: 10));
                              _start = 0;
                              _controller.add(_start);
                            }
                          }else{
                            if(currentIndex != stories.length - 1){
                              carouselController.nextPage(duration: const Duration(milliseconds: 10));
                              _start = 0;
                              _controller.add(_start);
                            }else{
                              Navigator.of(context).pop();
                            }
                          }
                        },
                        onLongPressStart: (details){
                          skipTimer = true;
                        },
                        onLongPressEnd: (details){
                          skipTimer = false;
                        },
                        onLongPressDown: (details){
                          skipTimer = true;
                        },
                      ),
                    ),
                    Container(
                      width: size.width - 16,
                      height: 10,
                      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: StreamBuilder<int>(
                        stream: _controller.stream,
                        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                          return ListView.separated(
                            itemCount: stories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index){
                              return LinearPercentIndicator(
                                width: ((size.width - 16)/stories.length) - 4,
                                lineHeight: 2,
                                animation: true,
                                animationDuration: currentIndex == index && _start != 0?1000:1,
                                animateFromLastPercent: true,
                                percent: currentIndex > index? 1:currentIndex < index?0: 0.2 * (snapshot.data ?? 0),
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.white54,
                                progressColor: Colors.white,
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 4 / ((stories.length ~/ 10) + 1).toInt(),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Positioned(
                        top: 24,
                        child:SizedBox(
                          width: size.width,
                          child:  Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 12,),
                                  Avatar(url: widget.user['avatar'], size: 30),
                                  const SizedBox(width: 12,),
                                  Text(
                                    widget.user['name'],
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                  right: 12,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/more.svg',
                                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                        height: 32,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).pop();
                                        },
                                        child:  const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 36,
                                        ),
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height*0.09,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width*0.9 - 94,
                        child: CupertinoTextField(
                            controller: messageController,
                            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Colors.grey
                              ),

                            ),
                            placeholder: 'Send Message',
                            placeholderStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                            ),
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                color: Colors.white
                            )
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      SizedBox(
                        width: 76,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/heart-outline.svg',
                              height: 29,
                              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            SvgPicture.asset(
                              'assets/icons/share.svg',
                              height: 29,
                              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    messageController.dispose();
    _controller.close();
    _timer.cancel();
    super.dispose();
  }
}