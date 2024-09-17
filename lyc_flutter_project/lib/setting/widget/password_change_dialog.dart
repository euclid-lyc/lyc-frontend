import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/custom_text_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/setting/provider/setting_provider.dart';
import 'package:lyc_flutter_project/setting/widget/info_text_form_field.dart';
import 'package:provider/provider.dart';

class PasswordChangeDialog extends StatefulWidget {
  const PasswordChangeDialog({super.key});

  @override
  State<PasswordChangeDialog> createState() => _PasswordChangeDialogState();
}

class _PasswordChangeDialogState extends State<PasswordChangeDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 30.0,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 30.0,
            ),
            child: Consumer<SettingProvider>(
              builder: (context, value, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "비밀번호 변경",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const _SubTitle(label: "비밀번호 입력"),
                    const SizedBox(height: 8.0),
                    InfoTextFormField(
                      fillColor: AppColor.lightGrey,
                      hint: "기존 비밀번호를 입력해주세요",
                      borderRadius: 10.0,
                      onChanged: (pw) => value.setOldPassword(pw),
                    ),
                    const SizedBox(height: 16.0),
                    const _SubTitle(label: "새 비밀번호 입력"),
                    const SizedBox(height: 8.0),
                    InfoTextFormField(
                      fillColor: AppColor.lightGrey,
                      hint: "새로운 비밀번호를 입력해주세요",
                      borderRadius: 10.0,
                      onChanged: (pw) => value.setNewPassword(pw),
                    ),
                    const SizedBox(height: 16.0),
                    const _SubTitle(label: "새 비밀번호 확인"),
                    const SizedBox(height: 8.0),
                    InfoTextFormField(
                      fillColor: AppColor.lightGrey,
                      hint: "새 비밀번호를 다시 입력해주세요",
                      borderRadius: 10.0,
                      onChanged: (pw) => value.setConfirmPassword(pw),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      height: 50.0,
                      width: double.infinity,
                      child: CustomTextButton(
                        label: "저장",
                        fontSize: 16.0,
                        onPressed: () {
                          save();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> save() async {
    await context.read<SettingProvider>().saveNewPassword();
  }
}

class _SubTitle extends StatelessWidget {
  final String label;

  const _SubTitle({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        color: Colors.black,
      ),
    );
  }
}
