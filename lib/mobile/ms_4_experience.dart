import 'package:flutter/material.dart';

import '../statics/data_values.dart';
import '../statics/key_holders.dart';
import '../theme/app_theme.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class MS4Experience extends StatelessWidget {
  const MS4Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        key: KeyHolders.experienceKey,
        color: AppThemeData.backgroundGrey,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FrameTitle(
                title: DataValues.experienceTitle,
                description: DataValues.experienceDescription,
              ),
              const SizedBox(height: 30.0),
              ...DataValues.experiences.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  // extra gap between cards
                  child: ContainerCard().type3(
                    image: e.image,
                    title: e.companyName,
                    role: e.position,
                    years: e.workingPeriod,
                    values: '',
                    message: e.description,
                    url: DataValues.linkedinURL,
                    isButtonEnabled: true,
                    skills: e.gainSkills,
                    skillTitle: 'Skills -',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
