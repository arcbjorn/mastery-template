---
description: Start a LeetCode or architecture practice session
arguments:
  - name: mode
    description: Practice mode (leetcode or arch)
    required: true
  - name: language
    description: Programming language override (py/js/java/cpp/go/rs/ts/c/cs/kt/swift/hs/scala)
    required: false
  - name: difficulty
    description: Difficulty level (easy/medium/hard/expert)
    required: false
  - name: tag
    description: Focus tag (array, two-pointers, etc.)
    required: false
---

Start a focused practice session with timer, goals, and micro-lessons.

## Usage Examples
- `start a session leetcode` - Start LeetCode practice
- `start a session leetcode py` - LeetCode with Python
- `start a session arch` - System design practice
- `start a session leetcode medium array` - Medium array problems

## Output
- SESSION_SCRIPT with timebox, goals, checkpoints
- Solution file in ./solutions/YYYY/MM/
- COACH_LOG_JSON for tracking