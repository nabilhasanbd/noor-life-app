import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/constants/app_assets.dart';
import '../../app/constants/app_strings.dart';
import '../../app/theme/app_colors.dart';
import '../home/widgets/home_nav_bar.dart';
import '../quran/widgets/quran_app_bar.dart';
import 'widgets/ai_welcome_card.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  static const String routeName = '/ai-chat';

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _inputController = TextEditingController();
  int _navIndex = 2;

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _handleSend() {
    final text = _inputController.text.trim();
    if (text.isEmpty) return;
    _inputController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      body: Column(
        children: [
          const QuranAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  Expanded(
                    child: AiWelcomeCard(
                      inputController: _inputController,
                      onSend: _handleSend,
                      onSuggestion: (q) => setState(() => _inputController.text = q),
                    ),
                  ),
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
          AppAssets.bubbleChatSpark,
          width: 36,
          height: 36,
          colorFilter:
              const ColorFilter.mode(AppColors.teal700, BlendMode.srcIn),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                AppStrings.aiAssistantTitle,
                style: TextStyle(
                  fontFamily: 'Nulshock',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.quranTeal,
                ),
              ),
              SizedBox(height: 4),
              Text(
                AppStrings.aiAssistantSubtitle,
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
}
