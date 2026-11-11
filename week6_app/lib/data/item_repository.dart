import '../models/item.dart';

class ItemRepository {
  static List<Item> getInitialItems() {
    return [
      Item(
        id: '1',
        title: 'Elden Ring',
        subtitle: 'FromSoftware Action RPG',
        description: 'An expansive open-world fantasy action RPG with deep tactical combat and exploration.',
        category: 'Gaming',
        createdAt: DateTime.now().subtract(const Duration(days: 4)),
      ),
      Item(
        id: '2',
        title: 'Band of Brothers',
        subtitle: 'Historical WWII Masterpiece',
        description: 'An acclaimed miniseries following Easy Company through historic European campaigns.',
        category: 'Media',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      Item(
        id: '3',
        title: 'Rust & Tauri Security',
        subtitle: 'Local Desktop App Framework',
        description: 'Building high-performance, secure localized utility tools with low-level encryption cores.',
        category: 'Development',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Item(
        id: '4',
        title: 'Flutter Mobile Architecture',
        subtitle: 'Cross-Platform UI Engineering',
        description: 'Constructing robust multi-screen CRUD workflows with local state management and persistence.',
        category: 'Development',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Item(
        id: '5',
        title: 'Demon Slayer Hinokami',
        subtitle: 'High-Speed Arena Fighter',
        description: 'Intense tactical combat simulator showcasing clean animation assets and combo mechanics.',
        category: 'Gaming',
        createdAt: DateTime.now(),
      ),
    ];
  }
}
