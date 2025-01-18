import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ears_app/utils/color.dart';

void showImageSourceDialog(
  BuildContext context, {
  required void Function()? onGalleryTap,
  required void Function()? onCameraTap,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          "Select Image Source",
          style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.h1Colors),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.blue),
                title: const Text("Camera"),
                onTap: onGalleryTap),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.blue),
                title: const Text("Gallery"),
                onTap: onCameraTap),
          ],
        ),
      );
    },
  );
}
