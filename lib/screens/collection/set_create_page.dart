import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:stylishcloset/utils/model.dart';

class SetCreatePage extends StatefulWidget {
  const SetCreatePage({super.key});

  @override
  State<SetCreatePage> createState() => _SetCreatePageState();
}

class _SetCreatePageState extends State<SetCreatePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();

  String? selectedColor;
  String? selectedTag;
  File? imageFile;

  final List<String> colors = ['Pink', 'Blue', 'Black', 'White'];
  final List<String> tags = ['Wedding', 'Office', 'Party', 'Relax'];

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        imageFile = File(result.files.single.path!);
      });
    }
  }

  void resetForm() {
    nameController.clear();
    sizeController.clear();
    setState(() {
      selectedColor = null;
      selectedTag = null;
      imageFile = null;
    });
  }

  void createSet() {
    if (nameController.text.isEmpty ||
        sizeController.text.isEmpty ||
        selectedColor == null ||
        selectedTag == null ||
        imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields.')),
      );
      return;
    }

    userCreatedItems.add(CollectionItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      imagePath: imageFile!.path,
      isFileImage: true,
      tag: selectedTag!,
    ));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Set Created Successfully!')),
    );
    resetForm();
  }

  Widget _buildCollectionItemCard(CollectionItem item) {
    return Card(
      child: item.isFileImage
          ? Image.file(File(item.imagePath), height: 100)
          : Image.asset(item.imagePath, height: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F0F2),
      appBar: AppBar(
        title: const Text('Create Set'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.local_offer_outlined, size: 50),
                const SizedBox(height: 10),
                const Text('Set', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                const SizedBox(height: 20),
                const Text('Create', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 30),

                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'T-shirt...',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Color',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  value: selectedColor,
                  items: colors.map((color) => DropdownMenuItem(value: color, child: Text(color))).toList(),
                  onChanged: (value) => setState(() => selectedColor = value),
                ),
                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Tag',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  value: selectedTag,
                  items: tags.map((tag) => DropdownMenuItem(value: tag, child: Text(tag))).toList(),
                  onChanged: (value) => setState(() => selectedTag = value),
                ),
                const SizedBox(height: 15),

                TextField(
                  controller: sizeController,
                  decoration: InputDecoration(
                    labelText: 'Input Size',
                    hintText: 'size L',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const SizedBox(height: 15),

                ElevatedButton.icon(
                  onPressed: pickImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[300],
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  icon: const Icon(Icons.image),
                  label: const Text("Input Image"),
                ),
                if (imageFile != null) ...[
                  const SizedBox(height: 10),
                  Image.file(imageFile!, height: 100),
                ],

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: createSet,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                      ),
                      child: const Text('Create'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
