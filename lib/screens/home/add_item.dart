import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart'; 

class AddItemPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onItemAdded;

  const AddItemPage({super.key, required this.onItemAdded});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String? _selectedColor;
  String? _selectedSize;
  String? _selectedLocation;
  String? _selectedTag;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // Options for dropdowns
  final List<String> colorOptions = ['White', 'Black', 'Grey', 'Yellow', 'Pink', 'Purple', 'Blue', 'Red', 'Green', 'Brown'];
  final List<String> sizeOptions = ['XS', 'S', 'M', 'L', 'XL'];
  final List<String> locationOptions = ['Main Closet', 'Seasonal Storage', 'Travel Bag'];
  final List<String> tagOptions = ['Shirt', 'Pants', 'Shoes', 'Skirt', 'Dress', 'Necklace', 'Bracelet', 'Ring', 'Watch', 'Bag'];
  
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // Add these lines to save permanently:
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
        final savedImage = await File(pickedFile.path).copy('${appDir.path}/$fileName');
        
        setState(() {
          _imageFile = savedImage; // Now using the permanently saved file
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
      );
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && 
        _selectedColor != null && 
        _selectedSize != null && 
        _selectedLocation != null && 
        _selectedTag != null && 
        _imageFile != null) {
      final newItem = {
        'id': DateTime.now().millisecondsSinceEpoch,
        'name': _nameController.text,
        'color': _selectedColor,
        'size': _selectedSize,
        'location': [_selectedLocation!],
        'tag': [_selectedTag!], 
        'image': _imageFile!.path,
      };
      widget.onItemAdded(newItem);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields and select an image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter item name';
                  }
                  return null;
                }
              ),
              const SizedBox(height: 16),

              // Color Dropdown
              DropdownButtonFormField<String>(
                value: _selectedColor,
                decoration: const InputDecoration(
                  labelText: 'Color',
                  border: OutlineInputBorder(),
                ),
                items: colorOptions.map((color) {
                  return DropdownMenuItem(
                    value: color,
                    child: Text(color),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedColor = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a color';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Size Dropdown
              DropdownButtonFormField<String>(
                value: _selectedSize,
                decoration: const InputDecoration(
                  labelText: 'Size',
                  border: OutlineInputBorder(),
                ),
                items: sizeOptions.map((size) {
                  return DropdownMenuItem(
                    value: size,
                    child: Text(size),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSize = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a size';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Location Dropdown
              DropdownButtonFormField<String>(
                value: _selectedLocation,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                items: locationOptions.map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLocation = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Tag Dropdown
              DropdownButtonFormField<String>(
                value: _selectedTag,
                decoration: const InputDecoration(
                  labelText: 'Tag',
                  border: OutlineInputBorder(),
                ),
                items: tagOptions.map((tag) {
                  return DropdownMenuItem(
                    value: tag,
                    child: Text(tag),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTag = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a tag';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Image Upload
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text('Item Image', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Upload Image', 
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  if (_imageFile != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          Image.file(_imageFile!, height: 100,),
                          Text(
                            'Image selected: ${_imageFile!.path.split('/').last}',
                            style: const TextStyle(color: Colors.white, fontSize: 16 ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      minimumSize: const Size(120, 50),
                    ),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(120, 50),
                    ),
                    child: const Text('Create'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
