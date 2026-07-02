import 'package:flutter/material.dart';

import '../../../app/constants/app_strings.dart';
import '../../../app/theme/app_colors.dart';

/// The pinned question input row (Figma "Frame 427320098"): a neumorphic
/// text field and a teal send button.
class ChatInputBar extends StatelessWidget {
  const ChatInputBar({
    super.key,
    required this.controller,
    this.onSend,
    this.onChanged,
  });

  final TextEditingController controller;
  final VoidCallback? onSend;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.rose50,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border(
          top: BorderSide(color: AppColors.rose200, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.searchFieldFill,
                borderRadius: BorderRadius.circular(8),
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
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => onSend?.call(),
                style: const TextStyle(
                  fontSize: 12,
                  height: 16 / 12,
                  color: Color(0xFF525252),
                ),
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  border: InputBorder.none,
                  hintText: AppStrings.aiInputHint,
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    height: 16 / 12,
                    color: Color(0xFF525252),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onSend,
            child: Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.teal700,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF235854),
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Color(0xFF143C39),
                    offset: Offset(-5, -5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Icon(
                Icons.send,
                color: AppColors.slate50,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
