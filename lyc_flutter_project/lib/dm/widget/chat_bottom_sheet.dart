import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/common/const/assets.dart';
import 'package:lyc_flutter_project/dm/provider/chat_provider.dart';
import 'package:lyc_flutter_project/dm/widget/chat_add_schedule_bottom_sheet.dart';

class ChatBottomSheet extends StatelessWidget {
  final ChatProvider provider;

  const ChatBottomSheet({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 28.0).copyWith(top: 24.0, bottom: 28.0),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 16.0,
        runSpacing: 12.0,
        children: [
          ChatPlusButton(
            label: '사진',
            asset: Assets.photoButton,
            onTap: () async {
              final XFile? image = await picker.pickImage(source: ImageSource.gallery);
              provider.showImageToSend(image: image);
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
          ChatPlusButton(
            label: '카메라',
            asset: Assets.cameraButton,
            onTap: () async {
              final XFile? image = await picker.pickImage(source: ImageSource.camera);
              provider.showImageToSend(image: image);
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
          ChatPlusButton(
            label: '일정',
            asset: Assets.scheduleButton,
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                context: context,
                builder: (context) => ChatAddScheduleBottomSheet(provider: provider),
                enableDrag: false,
                isScrollControlled: true,
              );
            },
          ),
          ChatPlusButton(
            label: '의뢰',
            asset: Assets.commissionButton,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ChatPlusButton extends StatelessWidget {
  final String label;
  final String asset;
  final VoidCallback onTap;

  const ChatPlusButton({
    super.key,
    required this.label,
    required this.asset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: SvgPicture.asset(asset),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
