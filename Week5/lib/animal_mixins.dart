// Mixin for flying capability
mixin Flyable {
  String fly() => ' soaring through the skies!';
}

// Mixin for swimming capability
mixin Swimmable {
  String swim() => ' gliding smoothly through the water!';
}

// Custom Mixin: Walkable capability
mixin Walkable {
  String walk() => ' walking steadily on the ground.';
}

// Base Animal class
abstract class Animal {
  final String name;
  Animal(this.name);

  String makeGeneralSound();
}

// Duck uses Flyable, Swimmable, and Walkable
class Duck extends Animal with Flyable, Swimmable, Walkable {
  Duck(super.name);

  @override
  String makeGeneralSound() => 'Quack! Quack!';
}

// Fish uses Swimmable only
class Fish extends Animal with Swimmable {
  Fish(super.name);

  @override
  String makeGeneralSound() => 'Blub blub!';
}

// Eagle uses Flyable and Walkable
class Eagle extends Animal with Flyable, Walkable {
  Eagle(super.name);

  @override
  String makeGeneralSound() => 'Screech!';
}

// Penguin uses Swimmable and Walkable (cannot fly!)
class Penguin extends Animal with Swimmable, Walkable {
  Penguin(super.name);

  @override
  String makeGeneralSound() => 'Honk honk!';
}
