import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(XFile) onImageSelected;
  final ImagePicker picker;
  final SvgPicture? icon;

  const ImagePickerWidget({
    required this.onImageSelected,
    required this.picker,
    this.icon,
  });

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  XFile? _image;

  Future<void> getImage(ImageSource source) async {
    final XFile? pickedFile = await widget.picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
        widget.onImageSelected(pickedFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                '사진 불러오기',
                style: TextStyle(
                    color: AppColor.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              content: Row(
                children: [
                  TextButton(
                    child: Text(
                      '카메라',
                      style: _pickerDialogTextStyle(),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      getImage(ImageSource.camera);
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    child: Text(
                      '갤러리',
                      style: _pickerDialogTextStyle(),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      getImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: widget.icon ??
          AspectRatio(
            aspectRatio: (3 / 4),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: (_image != null)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.file(
                        File(_image!.path),
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColor.grey,
                      size: 100,
                    ),
            ),
          ),
    );
  }

  TextStyle _pickerDialogTextStyle() {
    return const TextStyle(
      color: AppColor.brown,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }
}
