import 'package:flutter/material.dart';
import '../models/item.dart';
import 'item_form_screen.dart';

class DetailScreen extends StatelessWidget {
  final Item item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final updatedItem = await Navigator.push<Item>(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemFormScreen(itemToEdit: item),
                ),
              );
              if (updatedItem != null) {
                Navigator.pop(context, updatedItem);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Item'),
                  content: Text('Are you sure you want to delete "${item.title}"?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // close dialog
                        Navigator.pop(context, 'delete'); // return delete signal
                      },
                      child: const Text('Delete', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: item.id,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.deepPurple.shade200,
                  child: Text(
                    item.title[0],
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Chip(
              label: Text(item.category, style: const TextStyle(color: Colors.white)),
              backgroundColor: Colors.deepPurple,
            ),
            const SizedBox(height: 12),
            Text(
              item.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              item.subtitle,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700, fontStyle: FontStyle.italic),
            ),
            const Divider(height: 30),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              item.description,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
            const Spacer(),
            Text(
              'Created: ${item.createdAt.toLocal().toString().split('.').first}',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
