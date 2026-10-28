Prompt Customization Log — Nathan Papa Antwi-Agyei

Week 5

Prompt 1: AI Code Review (Weak vs Strong Prompt Comparison)
• Tool used: Gemini / AI Collaborator
• What I changed: Tested a generic review prompt versus a role-constrained, structured senior reviewer prompt targeting security, encapsulation, and edge cases on the BankAccount class.
• What the AI produced: The weak prompt gave a generic code rewrite; the strong prompt pinpointed exact security and validation checks on private fields (_balance, _owner).
• What I fixed: Ensured proper exception throwing on negative amounts and verified encapsulation rules.
• What I learned: Constrained expert roles with strict negative constraints ("Do NOT rewrite the code") produce significantly higher quality code reviews.

Prompt 2: Student Management System Challenge
• Tool used: Gemini / AI Collaborator
• What I changed: Designed a structured prompt leveraging the 4 elements (Context, Task, Constraints, Format) to build an academic hierarchy (Person abstract class, Student, Lecturer, Course, and Evaluable mixin).
• What the AI produced: Clean implementation of inheritance, polymorphism, and modular mixins.
• What I fixed: Verified that credit validation and course enrollment logic prevent duplicate list entries.
• What I learned: Combining abstract base classes with mixins allows clean code sharing across separate class hierarchies in Dart.