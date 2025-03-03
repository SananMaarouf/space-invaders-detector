# Space Invaders Detector

This Ruby application is my submission for an take home assignment by Marketer Real Estate.
It takes a radar sample in a text file as an argument and reveals possible locations of space invaders.


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

## Testing

Run the tests with:

```bash
rspec
```

## License

My code? No. Our code, comrade. Do as you please.