PROMPT_LOG.md — Week 4: Dart Data Collections & Unit Testing
Course: INFT 425: Mobile Application Development

Topic: Dart Data Collections (Lists, Maps, Sets, Higher-Order Functions) and Unit Testing

Environment: DartPad & Visual Studio Code

1. Context & Objectives

    Core Topics Covered:

        Lists & Maps: Creation, key-value manipulation, and iteration.

        Sets: Set theory methods (.union(), .intersection(), .difference()).

        Higher-Order Methods: Data transformation and filtering (.map(), .where(), .reduce(), .firstWhere()).

        Unit Testing: Setting up unit tests using the test package in a standard Dart project layout.

2. Iterative Workflow & Debugging Log
Phase A: DartPad Execution (Collections & Higher-Order Functions)

    Action: Executed code blocks demonstrating Lists, Maps, Sets, and higher-order iteration methods.

    Result: All collection transformations, filtering operations, and set comparisons ran successfully in DartPad with output verified in the console log.

Phase B: VS Code Project Architecture & Configuration

    Action: Transitioned from DartPad to local setup in VS Code.

    Challenge: Facing directory alignment issues where pubspec.yaml and test/ were nested inside lib/.

    Resolution: Re-architected project hierarchy so that lib/, test/, screenshots/, and pubspec.yaml sat as direct siblings under the project root (project_folder/).

Plaintext

project_folder/
├── lib/
│   └── main.dart
├── test/
│   └── calculations_operator_test.dart
├── screenshots/
└── pubspec.yaml

Phase C: Dependency Management & Test Execution

    Challenge: Running dart test failed initially due to missing name in pubspec.yaml and an unresolvable package:test/test.dart URI error.

    Resolution:

        Updated pubspec.yaml with explicit metadata (name: collection_test_app) and the test dependency under dev_dependencies.

        Executed dart pub get to download and link packages locally.

        Re-ran dart test in the terminal.

3. Terminal Execution Result
Bash

PS C:\Users\HP\Downloads\project_folder> dart pub get
+ webkit_inspection_protocol 1.2.1
+ yaml 3.1.4
Changed 49 dependencies!

PS C:\Users\HP\Downloads\project_folder> dart test
Building package executable... (9.6s)
Built test:test.
00:01 +3: All tests passed!

4. Key Takeaways

    Directory Convention: In Dart/Flutter, configuration files (pubspec.yaml) and test folders (test/) must sit at the project root alongside lib/.

    Package Resolution: Adding dependencies in pubspec.yaml must be followed by dart pub get before URI imports in Dart test files can resolve properly.

    Automated Testing: Grouping related test cases (group()) and asserting outcomes (expect()) ensures functional correctness across collection operations.

