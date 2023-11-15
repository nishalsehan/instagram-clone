

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/widgets/avatar.dart';

class BottomNavigation extends StatelessWidget {
  final int index;
  final void Function(int)? onClick;
  static const List activeIcons = [
    "assets/icons/home-filled.svg",
    "assets/icons/search-filled.svg",
    "assets/icons/create.svg",
    "assets/icons/reels-filled.svg",
    "assets/icons/navigation/active/profile.svg"
  ];

  static const List inactiveIcons = [
    "assets/icons/home-outline.svg",
    "assets/icons/search-outline.svg",
    "assets/icons/create.svg",
    "assets/icons/reels-outline.svg",
    "assets/icons/navigation/inactive/profile.svg"
  ];

  const BottomNavigation({
    super.key,
    required this.index, required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final padding = MediaQuery.of(context).padding;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(
                color: Colors.black12,
                width:  0.5
            )
        )
      ),
      child: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Colors.white,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
        items: [
          getIcon(context, 0, size),
          getIcon(context, 1, size),
          getIcon(context, 2, size),
          getIcon(context, 3, size),
          getIcon(context, 4, size),
        ],
        currentIndex: index,
        onTap: onClick,
      ),
    );
  }

  getIcon(BuildContext context, int i, Size size) {
    return BottomNavigationBarItem(
        icon: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: i != 4?SvgPicture.asset(
              inactiveIcons[i],
              height: 28,
              colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
            ):const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              child: Image(
                image: AssetImage(
                  'assets/images/profile-image.jpg',
                ),
                height: 28,
              ),
            )
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: i != 4?SvgPicture.asset(
            activeIcons[i],
            height: 28,
            colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
          ):Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).iconTheme.color!,
                      width: 0.5
                  ),
                  shape: BoxShape.circle
              ),
              child: const Avatar(
                url: 'https://instagram.fcmb1-2.fna.fbcdn.net/v/t51.2885-19/385796460_340793611680426_8122083031362328578_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fcmb1-2.fna.fbcdn.net&_nc_cat=106&_nc_ohc=kWtNem0dSwcAX9kTFt5&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfBAk7O7mTjJ01lzJr6PszNw5ZHl6vKOm46tyzLG7xbQ5Q&oe=655A36AC&_nc_sid=ee9879',
                size: 28,
              )
          ),
        ),
        label: ""
    );
  }
}