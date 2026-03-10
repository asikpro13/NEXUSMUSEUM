import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexusmuseum/globals.dart';

class AppBarProject extends StatefulWidget {
  const AppBarProject({super.key});

  @override
  State<AppBarProject> createState() => _AppBarProjectState();
}

class _AppBarProjectState extends State<AppBarProject> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            slidableController.openStartActionPane();
          },
          child: SvgPicture.asset('assets/icons/driver.svg'),
        ),
        SizedBox(width: 25),
        GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/search.svg')),
        Spacer(),
        GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/profile.svg')),
      ],
    );
  }
}
