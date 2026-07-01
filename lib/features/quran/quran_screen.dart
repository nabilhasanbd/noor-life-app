import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/constants/app_assets.dart';
import '../../app/constants/app_strings.dart';
import '../../app/theme/app_colors.dart';
import '../home/widgets/home_nav_bar.dart';
import 'widgets/quran_app_bar.dart';
import 'widgets/surah_search_bar.dart';
import 'widgets/surah_tile.dart';

/// A single Surah entry shown in the "All Surah" list.
class _Surah {
  const _Surah({
    required this.number,
    required this.name,
    required this.meaning,
    required this.verses,
    required this.origin,
  });

  final int number;
  final String name;
  final String meaning;
  final String verses;
  final SurahFilter origin;
}

const List<_Surah> _surahs = [
  _Surah(
      number: 1,
      name: 'Al-Fatiha',
      meaning: 'The Opening',
      verses: '7 verses',
      origin: SurahFilter.meccan),
  _Surah(
      number: 2,
      name: 'Al-Baqarah',
      meaning: 'The Cow',
      verses: '286 verses',
      origin: SurahFilter.medinan),
  _Surah(
      number: 3,
      name: 'Al-Imran',
      meaning: 'Family of Imran',
      verses: '200 verses',
      origin: SurahFilter.medinan),
  _Surah(
      number: 4,
      name: 'An-Nisa',
      meaning: 'The Women',
      verses: '176 verses',
      origin: SurahFilter.medinan),
  _Surah(
      number: 5,
      name: 'Al-Ma\u2019idah',
      meaning: 'The Table Spread',
      verses: '120 verses',
      origin: SurahFilter.medinan),
  _Surah(
      number: 6,
      name: 'Al-An\u2019am',
      meaning: 'The Cattle',
      verses: '165 verses',
      origin: SurahFilter.meccan),
  _Surah(
      number: 7,
      name: 'Al-A\u2019raf',
      meaning: 'The Heights',
      verses: '206 verses',
      origin: SurahFilter.meccan),
  _Surah(
      number: 8,
      name: 'Al-Anfal',
      meaning: 'The Spoils of War',
      verses: '75 verses',
      origin: SurahFilter.medinan),
];

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  static const String routeName = '/quran';

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  SurahFilter _filter = SurahFilter.all;
  String _query = '';
  int _navIndex = 1;

  List<_Surah> get _filtered {
    return _surahs.where((s) {
      final bool matchesFilter =
          _filter == SurahFilter.all || s.origin == _filter;
      final bool matchesQuery = _query.isEmpty ||
          s.name.toLowerCase().contains(_query.toLowerCase()) ||
          s.meaning.toLowerCase().contains(_query.toLowerCase());
      return matchesFilter && matchesQuery;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      body: Column(
        children: [
          const QuranAppBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  SurahSearchBar(
                    filter: _filter,
                    onFilterChanged: (f) => setState(() => _filter = f),
                    onSearchChanged: (q) => setState(() => _query = q),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    AppStrings.allSurah,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildList(),
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

  Widget _buildHeader() {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.quran,
          width: 30,
          height: 30,
          colorFilter:
              const ColorFilter.mode(AppColors.quranTeal, BlendMode.srcIn),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                AppStrings.quranTitle,
                style: TextStyle(
                  fontFamily: 'Nulshock',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.quranTeal,
                ),
              ),
              SizedBox(height: 4),
              Text(
                AppStrings.quranSubtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildList() {
    final list = _filtered;
    if (list.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Text(
            'No surahs found',
            style: TextStyle(color: AppColors.mutedText, fontSize: 14),
          ),
        ),
      );
    }
    return Column(
      children: [
        for (int i = 0; i < list.length; i++) ...[
          SurahTile(
            number: list[i].number,
            name: list[i].name,
            meaning: list[i].meaning,
            verses: list[i].verses,
          ),
          if (i != list.length - 1) const SizedBox(height: 8),
        ],
      ],
    );
  }
}
