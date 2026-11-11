import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemFormScreen extends StatefulWidget {
  final Item? itemToEdit;

  const ItemFormScreen({super.key, this.itemToEdit});

  @override
  State<ItemFormScreen> createState() => _ItemFormScreenState();
}

class _ItemFormScreenState extends State<ItemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _subtitle;
  late String _description;
  late String _category;

  final List<String> _categories = ['Gaming', 'Media', 'Development', 'General'];

  @override
  void initState() {
    super.initState();
    _title = widget.itemToEdit?.title ?? '';
    _subtitle = widget.itemToEdit?.subtitle ?? '';
    _description = widget.itemToEdit?.description ?? '';
    _category = widget.itemToEdit?.category ?? _categories.first;
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final resultItem = widget.itemToEdit == null
          ? Item(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: _title.trim(),
              subtitle: _subtitle.trim(),
              description: _description.trim(),
              category: _category,
              createdAt: DateTime.now(),
            )
          : widget.itemToEdit!.copyWith(
              title: _title.trim(),
              subtitle: _subtitle.trim(),
              description: _description.trim(),
              category: _category,
            );

      Navigator.pop(context, resultItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.itemToEdit != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Item' : 'Add New Item'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Title cannot be empty.';
                  }
                  if (value.trim().length < 3 || value.trim().length > 50) {
                    return 'Title must be between 3 and 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) => _title = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _subtitle,
                decoration: const InputDecoration(
                  labelText: 'Subtitle',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Subtitle cannot be empty.';
                  }
                  return null;
                },
                onSaved: (value) => _subtitle = value!,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: _categories.map((cat) {
                  return DropdownMenuItem(value: cat, child: Text(cat));
                }).toList(),
                onChanged: (val) => setState(() => _category = val!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _description,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Description cannot be empty.';
                  }
                  if (value.trim().length < 10) {
                    return 'Description must be at least 10 characters long.';
                  }
                  return null;
                },
                onSaved: (value) => _description = value!,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _saveForm,
                icon: const Icon(Icons.save),
                label: Text(isEditing ? 'Update Item' : 'Save Item', style: const TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
