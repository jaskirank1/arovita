import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadBox extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onRemove;
  final FilePickerResult? uploadedFile;
  final double width;
  final double labelSize;
  final double subtitleSize;

  const FileUploadBox({
    super.key,
    required this.onTap,
    required this.onRemove,
    required this.uploadedFile,
    required this.width,
    required this.labelSize,
    required this.subtitleSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: DottedBorder(
        color: Colors.grey.shade400,
        strokeWidth: 1.5,
        dashPattern: const [6, 4],
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 45),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: width > 800 ? 55 : 45,
                color: const Color(0xFF7A3DF2),
              ),

              const SizedBox(height: 12),

              Text(
                width > 800
                    ? "Click to upload or drag files here"
                    : "Tap to upload or take photo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: labelSize,
                  color: Colors.grey.shade800,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "JPEG, PNG, PDF • Max 5MB",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: subtitleSize,
                ),
              ),

              if (uploadedFile != null) ...[
                const SizedBox(height: 20),

                // File Name
                Text(
                  uploadedFile!.files.first.name,
                  style: TextStyle(
                    fontSize: subtitleSize,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 8),

                // Remove Button
                TextButton.icon(
                  onPressed: onRemove,
                  icon: const Icon(Icons.close, size: 18, color: Colors.red),
                  label: Text(
                    "Remove file",
                    style: TextStyle(
                      fontSize: subtitleSize,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}