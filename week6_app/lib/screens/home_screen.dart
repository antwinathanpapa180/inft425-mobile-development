import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/storage_service.dart';
import '../data/item_repository.dart';
import 'detail_screen.dart';
import 'item_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StorageService _storageService = StorageService();
  List<Item> _items = [];
  String _searchQuery = '';
  String _selectedCategory = 'All';
  String _sortMode = 'Newest';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final loadedItems = await _storageService.getItems();
    setState(() {
      _items = loadedItems.isEmpty ? ItemRepository.getInitialItems() : loadedItems;
      _isLoading = false;
    });
    if (loadedItems.isEmpty) {
      await _storageService.saveItems(_items);
    }
  }

  Future<void> _saveAndRefresh(List<Item> updatedItems) async {
    setState(() {
      _items = updatedItems;
    });
    await _storageService.saveItems(_items);
  }

  @override
  Widget build(BuildContext context) {
    // 1. Filter by Search Query & Category
    List<Item> filteredList = _items.where((item) {
      final matchesSearch = item.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.subtitle.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.description.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'All' || item.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    // 2. Sort Logic
    filteredList.sort((a, b) {
      if (_sortMode == 'Newest') {
        return b.createdAt.compareTo(a.createdAt);
      } else if (_sortMode == 'Oldest') {
        return a.createdAt.compareTo(b.createdAt);
      } else if (_sortMode == 'Name A-Z') {
        return a.title.compareTo(b.title);
      } else {
        return b.title.compareTo(a.title);
      }
    });

    final categories = ['All', ..._items.map((e) => e.category).toSet()];
    final isWideScreen = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('INFT 425 — Antwi-Agyei Nathan Papa'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => setState(() => _sortMode = value),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'Newest', child: Text('Sort: Newest')),
              const PopupMenuItem(value: 'Oldest', child: Text('Sort: Oldest')),
              const PopupMenuItem(value: 'Name A-Z', child: Text('Sort: Name A-Z')),
              const PopupMenuItem(value: 'Name Z-A', child: Text('Sort: Name Z-A')),
            ],
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Search Bar & Filters Header
                Container(
                  padding: const EdgeInsets.all(12.0),
                  color: Colors.deepPurple.shade50,
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (val) => setState(() => _searchQuery = val),
                        decoration: InputDecoration(
                          hintText: 'Search items...',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: categories.map((cat) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ChoiceChip(
                                label: Text(cat),
                                selected: _selectedCategory == cat,
                                onSelected: (selected) {
                                  setState(() => _selectedCategory = cat);
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                // Item List / Grid
                Expanded(
                  child: filteredList.isEmpty
                      ? const Center(child: Text('No items found.'))
                      : RefreshIndicator(
                          onRefresh: _loadItems,
                          child: isWideScreen
                              ? GridView.builder(
                                  padding: const EdgeInsets.all(12),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 3 / 1.5,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                  ),
                                  itemCount: filteredList.length,
                                  itemBuilder: (context, index) => _buildCard(filteredList[index]),
                                )
                              : ListView.builder(
                                  padding: const EdgeInsets.all(12),
                                  itemCount: filteredList.length,
                                  itemBuilder: (context, index) => _buildCard(filteredList[index]),
                                ),
                        ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final newItem = await Navigator.push<Item>(
            context,
            MaterialPageRoute(builder: (context) => const ItemFormScreen()),
          );
          if (newItem != null) {
            _saveAndRefresh([newItem, ..._items]);
          }
        },
      ),
    );
  }

  Widget _buildCard(Item item) {
    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        final deletedItem = item;
        final deletedIndex = _items.indexOf(item);
        setState(() {
          _items.remove(item);
        });
        _storageService.saveItems(_items);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${item.title} deleted'),
            action: SnackBarAction(
              label: 'UNDO',
              onPressed: () {
                setState(() {
                  _items.insert(deletedIndex, deletedItem);
                });
                _storageService.saveItems(_items);
              },
            ),
          ),
        );
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Hero(
            tag: item.id,
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple.shade200,
              child: Text(item.title[0], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
          title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('${item.subtitle}\nCategory: ${item.category}', maxLines: 2),
          isThreeLine: true,
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(item: item)),
            );
            if (result == 'delete') {
              setState(() => _items.removeWhere((i) => i.id == item.id));
              _storageService.saveItems(_items);
            } else if (result is Item) {
              setState(() {
                final index = _items.indexWhere((i) => i.id == result.id);
                if (index != -1) _items[index] = result;
              });
              _storageService.saveItems(_items);
            }
          },
        ),
      ),
    );
  }
}
