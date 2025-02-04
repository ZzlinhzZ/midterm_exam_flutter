import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddEditScreen extends StatefulWidget {
  final String? productId;

  ProductAddEditScreen({this.productId});

  @override
  _ProductAddEditScreenState createState() => _ProductAddEditScreenState();
}

class _ProductAddEditScreenState extends State<ProductAddEditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  File? _image;
  String? imageUrl;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.productId != null) {
      FirebaseFirestore.instance.collection('products').doc(widget.productId).get().then((doc) {
        if (doc.exists) {
          setState(() {
            nameController.text = doc['name'];
            priceController.text = doc['price'].toString();
            imageUrl = doc['image'];
          });
        }
      });
    }
  }

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> uploadImage(File imageFile) async {
    String cloudinaryUrl = "https://api.cloudinary.com/v1_1/duk0r72ap/image/upload";
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(imageFile.path),
      "upload_preset": "fruit_image"
    });

    try {
      Response response = await Dio().post(cloudinaryUrl, data: formData);
      return response.data["secure_url"];
    } catch (e) {
      print("Upload failed: $e");
      return null;
    }
  }

  Future saveProduct() async {
    bool? confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Xác nhận"),
        content: Text(widget.productId == null ? "Bạn có chắc muốn thêm sản phẩm này không?" : "Bạn có chắc muốn cập nhật sản phẩm này không?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text("Hủy")),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Xác nhận", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      if (_image != null) {
        imageUrl = await uploadImage(_image!);
      }

      var data = {
        'name': nameController.text,
        'price': int.parse(priceController.text),
        'image': imageUrl ?? '',
      };

      if (widget.productId == null) {
        await FirebaseFirestore.instance.collection('products').add(data);
      } else {
        await FirebaseFirestore.instance.collection('products').doc(widget.productId).update(data);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.productId == null ? 'Thêm sản phẩm' : 'Chỉnh sửa sản phẩm')),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                GestureDetector(
                onTap: pickImage,
                child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                    ),
                    child: _image != null
                        ? ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.file(_image!, fit: BoxFit.cover))
                        : imageUrl != null
                            ? ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network(imageUrl!, fit: BoxFit.cover))
                            : Center(child: Icon(Icons.image, size: 100, color: Colors.grey)),
                ),
            ),
                SizedBox(height: 20),
                TextField(controller: nameController, decoration: InputDecoration(labelText: 'Tên sản phẩm')),
                TextField(controller: priceController, decoration: InputDecoration(labelText: 'Giá'), keyboardType: TextInputType.number),
                SizedBox(height: 20),
                ElevatedButton(onPressed: saveProduct, child: Text('Lưu sản phẩm')),
            ],
            ),
        ),
    ),
    );
  }
}
