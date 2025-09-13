import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:savita_portfolio_main/configue.dart';
import 'package:savita_portfolio_main/landing/widgets/social_media_button.dart';

import '../../statics/data_values.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final alignment =
        context.isDesktop ? WrapAlignment.start : WrapAlignment.center;
    final wrapAlignment = context.isMobile ? Alignment.center : null;

    return Container(
      alignment: wrapAlignment,
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        alignment: alignment,
        children: [
          SocialMediaButton(
            index: 2,
            url: DataValues.githubURL,
            iconData: FontAwesomeIcons.github,
          ),
          SocialMediaButton(
            index: 3,
            url: DataValues.linkedinURL,
            iconData: FontAwesomeIcons.linkedin,
          ),
          SocialMediaButton(
            index: 1,
            url: DataValues.mediumURL,
            iconData: FontAwesomeIcons.medium,
          ),
          SocialMediaButton(
            index: 0,
            url: DataValues.devURL,
            iconData: FontAwesomeIcons.dev,
          ),
          SocialMediaButton(
            index: 1,
            url: DataValues.hashnodeURL,
            iconData: FontAwesomeIcons.hashnode,
          ),
          SocialMediaButton(
            index: 4,
            url: DataValues.youtubeURL,
            iconData: FontAwesomeIcons.youtube,
          )
        ],
      ),
    );
  }
}
