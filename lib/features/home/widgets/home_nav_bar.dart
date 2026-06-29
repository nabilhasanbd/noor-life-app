import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/constants/app_assets.dart';
import '../../../app/theme/app_colors.dart';

class _NavItem {
  const _NavItem(this.label, {this.asset, this.icon});
  final String label;
  final String? asset;
  final IconData? icon;
}

const List<_NavItem> _items = [
  _NavItem('Home', asset: AppAssets.mosqueLocation),
  _NavItem('Quran', asset: AppAssets.quran),
  _NavItem('AI Chat', asset: AppAssets.allah),
  _NavItem('Tasbih', asset: AppAssets.tasbih),
  _NavItem('More', icon: Icons.more_horiz),
];

/// Fixed teal bottom navigation bar for the home dashboard.
class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key, this.currentIndex = 0, this.onTap});

  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.teal900,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < _items.length; i++)
            Expanded(child: _buildItem(i)),
        ],
      ),
    );
  }

  Widget _buildItem(int index) {
    final item = _items[index];
    final active = index == currentIndex;
    final color = active ? AppColors.white : AppColors.navInactive;

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (item.asset != null)
          SvgPicture.asset(
            item.asset!,
            width: 22,
            height: 22,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          )
        else
          Icon(item.icon, size: 22, color: color),
        const SizedBox(height: 6),
        Text(
          item.label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );

    if (!active) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap?.call(index),
        child: content,
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.teal700,
        borderRadius: BorderRadius.circular(8),
      ),
      child: content,
    );
  }
}
