import 'package:flutter/material.dart';

import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';

/// A single surah origin filter chip (All / Meccan / Medinan).
class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool active = selected;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        decoration: BoxDecoration(
          color: active ? AppColors.quranRose800 : AppColors.chipFill,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: active
                ? AppColors.quranRose800
                : AppColors.chipFill,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x80CCCCCC),
              offset: Offset(2, -4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            height: 16 / 14,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            color: active ? AppColors.cardSurface : AppColors.mutedText,
          ),
        ),
      ),
    );
  }
}

/// The search input + origin filter row (Figma "Frame 427320088").
class SurahSearchBar extends StatelessWidget {
  const SurahSearchBar({
    super.key,
    this.filter = SurahFilter.all,
    this.onFilterChanged,
    this.onSearchChanged,
  });

  final SurahFilter filter;
  final ValueChanged<SurahFilter>? onFilterChanged;
  final ValueChanged<String>? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 7, 3, 7),
            decoration: BoxDecoration(
              color: AppColors.searchFieldFill,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x80C4C4C4),
                  offset: Offset(5, 5),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, -5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: onSearchChanged,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      hintText: AppStrings.searchSurahsHint,
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.searchFieldFill,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x80030316),
                        offset: Offset(5, 5),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, -5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.search,
                    size: 16,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 4),
        _FilterChip(
          label: AppStrings.filterAll,
          selected: filter == SurahFilter.all,
          onTap: () => onFilterChanged?.call(SurahFilter.all),
        ),
        const SizedBox(width: 4),
        _FilterChip(
          label: AppStrings.filterMeccan,
          selected: filter == SurahFilter.meccan,
          onTap: () => onFilterChanged?.call(SurahFilter.meccan),
        ),
        const SizedBox(width: 4),
        _FilterChip(
          label: AppStrings.filterMedinan,
          selected: filter == SurahFilter.medinan,
          onTap: () => onFilterChanged?.call(SurahFilter.medinan),
        ),
      ],
    );
  }
}

/// Surah origin filters.
enum SurahFilter { all, meccan, medinan }
