import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/core/constant/app_colors.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({super.key});

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _image;
  bool _isUploading = false;

  Future<void> _pickImage() async {
    try {
      final XFile? pickedImage =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _image = pickedImage;
        });
        await _uploadImage(); 
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    try {
      setState(() {
        _isUploading = true;
      });

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images/${user.uid}/${_image!.name}');

      await storageRef.putFile(File(_image!.path));

      final downloadUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({'profileImageUrl': downloadUrl}, SetOptions(merge: true));

      print('Image uploaded: $downloadUrl');
    } catch (e) {
      print("Error uploading image: $e");
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: 110,
            width: 110,
            child: CircleAvatar(
              backgroundImage: _image != null
                  ? FileImage(File(_image!.path)) as ImageProvider
                  : const AssetImage('assets/images/p.png'),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 3,
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.backGroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: _isUploading
                      ? const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.add_a_photo_outlined, size: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
