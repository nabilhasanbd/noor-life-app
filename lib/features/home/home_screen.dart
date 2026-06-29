import 'package:flutter/material.dart';

import '../../app/constants/app_assets.dart';
import '../../app/constants/app_strings.dart';
import '../../app/theme/app_colors.dart';
import 'widgets/daily_hadith_card.dart';
import 'widgets/dhikr_card.dart';
import 'widgets/feature_card.dart';
import 'widgets/home_header.dart';
import 'widgets/home_nav_bar.dart';
import 'widgets/section_title.dart';
import 'widgets/verse_of_day_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      body: Column(
        children: [
          const HomeHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCoreFeatures(),
                  const SizedBox(height: 40),
                  _buildAiAssistant(),
                  const SizedBox(height: 40),
                  _buildFeatures(),
                  const SizedBox(height: 40),
                  _buildDailyDhikr(),
                  const SizedBox(height: 40),
                  const VerseOfDayCard(),
                  const SizedBox(height: 40),
                  _buildIslamicKnowledge(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: HomeNavBar(
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
      ),
    );
  }

  Widget _buildCoreFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(AppStrings.coreFeatures),
        const SizedBox(height: 16),
        Row(
          children: const [
            Expanded(
              child: FeatureCard(
                icon: AppAssets.quran,
                label: 'Quran\nLearning',
                color: AppColors.rose800,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FeatureCard(
                icon: AppAssets.mosqueLocation,
                label: 'Find\nMosque',
                color: AppColors.rose800,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FeatureCard(
                icon: AppAssets.prophetsMosque,
                label: 'Mosque\nMood',
                color: AppColors.rose800,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FeatureCard(
                icon: AppAssets.scan,
                label: 'Halal\nScanner',
                color: AppColors.rose800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Expanded(
              child: FeatureCard(
                icon: AppAssets.haji,
                label: 'Hajj And\nUmrah',
                color: AppColors.rose800,
              ),
            ),
            SizedBox(width: 8),
            Expanded(child: SizedBox()),
            SizedBox(width: 8),
            Expanded(child: SizedBox()),
            SizedBox(width: 8),
            Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _buildAiAssistant() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(AppStrings.aiAssistant),
        const SizedBox(height: 16),
        const DailyHadithCard(),
      ],
    );
  }

  Widget _buildFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(AppStrings.features),
        const SizedBox(height: 16),
        Row(
          children: const [
            Expanded(
              child: FeatureCard(
                icon: AppAssets.quran,
                label: 'Quran',
                color: AppColors.teal700,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FeatureCard(
                icon: AppAssets.bookOpenText,
                label: 'Hadith',
                color: AppColors.teal700,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FeatureCard(
                icon: AppAssets.tasbih,
                label: 'Tasbe',
                color: AppColors.teal700,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FeatureCard(
                icon: AppAssets.kaaba,
                label: 'Qibla',
                color: AppColors.teal700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Expanded(
              child: FeatureCard(
                icon: AppAssets.dua,
                label: 'Dua',
                color: AppColors.teal700,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FeatureCard(
                icon: AppAssets.allah,
                label: '99 Name',
                color: AppColors.teal700,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FeatureCard(
                icon: AppAssets.baby,
                label: 'Islamic Name',
                color: AppColors.teal700,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 8),
            Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _buildDailyDhikr() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(AppStrings.dailyDhikr),
        const SizedBox(height: 16),
        const DhikrCardPair(
          first: DhikrCard(
            arabic: '\u{0623}\u{064E}\u{0633}\u{0652}\u{062A}\u{064E}\u{063A}\u{0652}\u{0641}\u{0650}\u{0631}\u{064F} \u{0627}\u{0644}\u{0644}\u{0651}\u{064E}\u{0647}\u{064E}',
            transliteration: 'Astaghfirullah',
            count: '0/100',
          ),
          second: DhikrCard(
            arabic: '\u{0633}\u{064F}\u{0628}\u{0652}\u{062D}\u{064E}\u{0627}\u{0646}\u{064E} \u{0627}\u{0644}\u{0644}\u{0651}\u{064E}\u{0647}\u{0650}',
            transliteration: 'SubhanAllah',
            count: '0/33',
          ),
        ),
        const SizedBox(height: 8),
        const DhikrCardPair(
          first: DhikrCard(
            arabic: '\u{0627}\u{0644}\u{0652}\u{062D}\u{064E}\u{0645}\u{0652}\u{062F}\u{064F} \u{0644}\u{0650}\u{0644}\u{0651}\u{064E}\u{0647}\u{0650}',
            transliteration: 'Alhamdulillah',
            count: '0/100',
          ),
          second: DhikrCard(
            arabic: '\u{0627}\u{0644}\u{0644}\u{0651}\u{064E}\u{0647}\u{064F} \u{0623}\u{064E}\u{0643}\u{0652}\u{0628}\u{064E}\u{0631}\u{064F}',
            transliteration: 'Allahu Akbar',
            count: '0/33',
          ),
        ),
      ],
    );
  }

  Widget _buildIslamicKnowledge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(AppStrings.islamicKnowledge),
        const SizedBox(height: 16),
        Row(
          children: const [
            Expanded(
              child: FeatureCard(
                icon: AppAssets.bookOpen,
                label: 'NOBIDER KAHINI',
                color: AppColors.teal700,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FeatureCard(
                icon: AppAssets.fileStar,
                label: 'SAHABIDER KAHINI',
                color: AppColors.teal700,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FeatureCard(
                icon: AppAssets.bookOpenText,
                label: 'ISLAMIC ARTICLE',
                color: AppColors.teal700,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: FeatureCard(
                icon: AppAssets.allah,
                label: 'QUIZ',
                color: AppColors.teal700,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
