import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../configue.dart';
import '../landing/widgets/animated_background_image.dart';
import '../landing/widgets/delayed_widget.dart';
import '../landing/widgets/social_media_buttons.dart';
import '../statics/data_values.dart';

const dividerColor = Color(0xFF464751);

class LandingHeader extends StatelessWidget {
  final ScrollController scrollController;

  const LandingHeader(
    this.scrollController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiagonalPathClipper(),
      child: Stack(
        fit: StackFit.loose,
        children: [
          // Widget that has animated background image while scrolling
          AnimatedBackgroundImage(scrollController),

          // The part that is on the "AnimatedBackgroundImage" widget.
          Align(
            alignment: Alignment.center,
            child: _buildSurface(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSurface(BuildContext context) {
    final titleSize = ResponsiveValue<double>(
      context,
      defaultValue: 24.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 24.0),
        const Condition.largerThan(name: TABLET, value: 40.0),
      ],
    ).value;

    final mottoSize = ResponsiveValue<double>(
      context,
      defaultValue: 14.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 14.0),
        const Condition.largerThan(name: TABLET, value: 16.0),
      ],
    ).value;

    final mottoTextAlignment =
        context.isDesktop ? TextAlign.start : TextAlign.center;

    final maxWidth = ResponsiveValue<double>(
      context,
      defaultValue: 602.0,
      valueWhen: [
        const Condition.equals(name: TABLET, value: 800.0),
        const Condition.largerThan(name: TABLET, value: 1200.0),
      ],
    ).value!;

    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: const EdgeInsets.symmetric(
        vertical: 96.0,
        horizontal: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('assets/images/logo.jpeg'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: DelayedWidget(
                  delayDuration: const Duration(milliseconds: 1000),
                  from: DelayFrom.right,
                  child: SelectableText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${DataValues.headerGreetings}\n',
                          style: TextStyle(
                            fontSize: ((titleSize ?? 30) - 10),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 4.0,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                        TextSpan(
                          text: DataValues.headerName,
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                            color: context.primaryColor,
                            letterSpacing: 4.0,
                            fontFamily: 'Ubuntu',
                          ),
                        )
                      ],
                    ),
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 4.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22.0),
          const DelayedWidget(
            delayDuration: Duration(milliseconds: 1400),
            from: DelayFrom.top,
            child: Divider(
              thickness: 1.75,
              color: dividerColor,
            ),
          ),
          const SizedBox(height: 30.0),
          DelayedWidget(
            delayDuration: const Duration(milliseconds: 1500),
            from: DelayFrom.top,
            child: SelectableText(
              DataValues.appDescription,
              textAlign: mottoTextAlignment,
              style: TextStyle(
                fontSize: mottoSize,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 1.8,
                fontFamily: 'Ubuntu',
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          const SocialMediaButtons()
        ],
      ),
    );
  }
}
