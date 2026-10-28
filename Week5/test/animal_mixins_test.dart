import 'package:test/test.dart';
import '../lib/animal_mixins.dart';

void main() {
  group('Mixins & Animal Behavior Tests', () {
    test('Duck exhibits flying, swimming, and walking traits', () {
      var duck = Duck('Donald');
      expect(duck.name, equals('Donald'));
      expect(duck.makeGeneralSound(), equals('Quack! Quack!'));
      expect(duck.fly(), contains('soaring'));
      expect(duck.swim(), contains('gliding'));
      expect(duck.walk(), contains('walking'));
    });

    test('Fish only swims and does not fly or walk', () {
      var fish = Fish('Nemo');
      expect(fish.swim(), contains('gliding'));
    });

    test('Penguin swims and walks but lacks flight mixin', () {
      var penguin = Penguin('Pingu');
      expect(penguin.swim(), contains('gliding'));
      expect(penguin.walk(), contains('walking'));
    });
  });
}
