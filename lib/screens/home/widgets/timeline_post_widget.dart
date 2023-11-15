
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../themes/theme_barrel.dart';
import '../../../utils/util_barrel.dart';
import '../../../widgets/widgets_barrel.dart';
import 'image_widget.dart';

class TimelinePostWidget extends StatefulWidget{
  final Map post;
  const TimelinePostWidget({super.key, required this.post});

  @override
  State<TimelinePostWidget> createState() => TimelinePostWidgetState();
}

class TimelinePostWidgetState extends State<TimelinePostWidget> with SingleTickerProviderStateMixin{
  final oCcy = NumberFormat("#,##0", "en_US");
  bool liked = false;
  bool saved = false;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.8).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
               Row(
                 children: [
                   const Avatar(url: profileAvatar, size: 33),
                   const SizedBox(width: 12),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      Row(
                        children: [
                          Text(
                            '${widget.post['user']['username']}',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                height: 1
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          if(widget.post['user']['verified']??false)SvgPicture.asset(
                            'assets/icons/verified.svg',
                            height: 12,
                          )
                        ],
                      ),
                      if(widget.post['location'] != null)Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Consumer<ThemeNotifier>(
                          builder: (BuildContext context, ThemeNotifier theme, Widget? child) {
                            return Text(
                                '${widget.post['location']}',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w300,
                                  height: 1,
                                  color: theme.isDark()?Colors.white:Colors.black
                                )
                            );
                          },
                        ),
                      )
                    ],
                  )
                 ],
               ),
              Positioned(
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/icons/more.svg'
                  )
              )
            ],
          ),
        ),
        ImageWidget(
          onLiked: (){
            setState(() {
              if(!liked){
                widget.post['likes']++;
              }
              liked = true;
            });
            _animate();
          },
          images: widget.post['images'],
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: _animation.value,
                    child: InkWell(
                      onTap: () {
                        if(liked){
                          widget.post['likes']--;
                        }else{
                          widget.post['likes']++;
                        }
                        setState(() {
                          liked = !liked;
                        });
                        _animate();
                      },
                      child: SvgPicture.asset(
                        liked?'assets/icons/heart-filled.svg':'assets/icons/heart-outline.svg',
                        height: 29,
                        colorFilter: ColorFilter.mode(liked?Colors.redAccent:Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  SvgPicture.asset(
                    'assets/icons/comments.svg',
                    height: 29,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  SvgPicture.asset(
                    'assets/icons/share.svg',
                    height: 29,
                  ),
                ],
              ),
              Positioned(
                  right: 0,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        saved = !saved;
                      });
                    },
                    child: SvgPicture.asset(
                      saved?'assets/icons/save-filled.svg':'assets/icons/save-outline.svg',
                      height: 29,
                    ),
                  )
              )
            ],
          ),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${oCcy.format(widget.post['likes'])} likes',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 2),
              ReadMore(
                text: ' ${widget.post['caption']}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: DefaultTextStyle.of(context).style.fontFamily
                ),
                prefix: TextSpan(
                  text: '${widget.post['user']['username']}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),
                ),
                maxLines: 2,
                collapsedText: 'more',
                expandedText: '',
                readMoreTextColor: Colors.black54,
              ),
              const SizedBox(height: 2),
              Text(
                '${widget.post['create_at']}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          )
        ),
        const SizedBox(height: 12)
      ],
    );
  }

  void _animate() {
    _animation.addStatusListener((AnimationStatus status) {
      if (_controller.value == 1) {
        _controller.reverse();
      }
    });
    _controller.forward();
  }
}

