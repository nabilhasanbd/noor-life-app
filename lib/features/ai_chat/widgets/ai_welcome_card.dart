import 'package:flutter/material.dart';

import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';
import 'chat_input_bar.dart';

/// A rounded suggestion question chip (Figma "Button" under Frame 427320095).
class _SuggestionChip extends StatelessWidget {
  const _SuggestionChip({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.trueGray300, width: 1),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            height: 16 / 12,
            color: AppColors.secondaryText,
          ),
        ),
      ),
    );
  }
}

/// The main AI Chat welcome card (Figma "Button" frame): a magic-wand badge,
/// the "Bismillah" heading, suggestion chips and the pinned input bar.
class AiWelcomeCard extends StatelessWidget {
  const AiWelcomeCard({
    super.key,
    required this.inputController,
    this.onSend,
    this.onSuggestion,
  });

  final TextEditingController inputController;
  final VoidCallback? onSend;
  final ValueChanged<String>? onSuggestion;

  static const List<String> _suggestions = [
    AppStrings.suggestionWudu,
    AppStrings.suggestionIstikhara,
    AppStrings.suggestionMusic,
    AppStrings.suggestionPillars,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.rose200, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x80CCCCCC),
            offset: Offset(2, -4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildMagicBadge(),
                    const SizedBox(height: 24),
                    _buildHeading(),
                    const SizedBox(height: 32),
                    _buildSuggestions(),
                  ],
                ),
              ),
            ),
          ),
          ChatInputBar(
            controller: inputController,
            onSend: onSend,
          ),
        ],
      ),
    );
  }

  Widget _buildMagicBadge() {
    return Container(
      width: 56,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.rose100,
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
      child: const Icon(
        Icons.auto_fix_high,
        color: AppColors.quranRose800,
        size: 24,
      ),
    );
  }

  Widget _buildHeading() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          AppStrings.bismillahTitle,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          AppStrings.bismillahSubtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            height: 1.4,
            color: AppColors.mutedText,
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < _suggestions.length; i++) ...[
          _SuggestionChip(
            label: _suggestions[i],
            onTap: () => onSuggestion?.call(_suggestions[i]),
          ),
          if (i != _suggestions.length - 1) const SizedBox(height: 10),
        ],
      ],
    );
  }
}
