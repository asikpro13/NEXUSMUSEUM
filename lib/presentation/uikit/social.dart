import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexusmuseum/domain/globals.dart';
import 'package:nexusmuseum/presentation/uikit/const.dart';

// Социальные сети
class SocialNetworks extends StatefulWidget {
  const SocialNetworks({super.key});

  @override
  State<SocialNetworks> createState() => _SocialNetworksState();
}

class _SocialNetworksState extends State<SocialNetworks> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottomSocial),
      child: Row(
        children: [
          Spacer(),
          GestureDetector(onTap: () => openUrl('https://vk.com/tretyakovgallery'), child: SvgPicture.asset('assets/icons/vk.svg', width: 20, height: 20)),
          SizedBox(width: 20),
          GestureDetector(onTap: () => openUrl('https://ok.ru/group/68885515403324'), child: SvgPicture.asset('assets/icons/classmates.svg', width: 20, height: 25)),
          SizedBox(width: 20),
          GestureDetector(onTap: () => openUrl('https://t.me/s/GT_Gallery'), child: SvgPicture.asset('assets/icons/telegram.svg', width: 20, height: 22)),
          SizedBox(width: 20),
          GestureDetector(onTap: () => openUrl('https://rutube.ru/channel/25592111/'), child: SvgPicture.asset('assets/icons/rutube.svg', width: 30, height: 30)),
          Spacer(),
        ],
      ),
    );
  }
}
