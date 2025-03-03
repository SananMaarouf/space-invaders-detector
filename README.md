# Space Invaders Detector

This Ruby application takes a radar sample as an argument and reveals possible locations of space invaders.

## Features

- Detects known invader patterns in a noisy radar sample
- Handles false positives and false negatives in the radar data
- Configurable similarity threshold for pattern matching
- Well-structured OOP architecture following SOLID design principles
- Fully tested with RSpec

## Installation

1. Clone the repository
2. Install dependencies:

```bash
bundle install
```

## Usage

```bash
ruby bin/invader_detector path/to/radar_sample.txt
```

## Examples

```bash
ruby bin/invader_detector radar_sample.txt
```

Output:
```
Detected X potential invader locations:
1. Invader type 1 at position (row, col) with 85.5% similarity
...
```

## Architecture

The application follows the SOLID principles:

- **Single Responsibility Principle**: Each class has a single responsibility
  - `Pattern`: Handles the representation of invader patterns
  - `Radar`: Handles the representation of radar data
  - `Detector`: Implements the pattern matching algorithm
  - `SpaceInvadersDetector`: Coordinates the overall detection process

- **Open/Closed Principle**: The code is open for extension but closed for modification
  - New pattern matching algorithms can be added without modifying existing code
  - Additional invader patterns can be easily added

- **Liskov Substitution Principle**: Subtypes must be substitutable for their base types
  - The code uses composition over inheritance to avoid LSP violations

- **Interface Segregation Principle**: Clients should not depend on interfaces they don't use
  - Each class has a focused interface with minimal methods

- **Dependency Inversion Principle**: High-level modules don't depend on low-level modules
  - Dependencies are injected rather than created internally

## Testing

Run the tests with:

```bash
rspec
```

## License

This project is licensed under the MIT License.