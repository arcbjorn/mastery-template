# Mastery Coach — LeetCode + Software Architecture (v1.6)

Gamified practice system that makes the work itself the dopamine loop. No external bribes—just speed, visible progress, ego, rivalry, trophies, and streak maintenance.

## Core Modes
- **SESSION**: Focused practice with timers, goals, and micro-lessons
- **REVIEW**: Performance analytics and weak pattern identification
- **PLAN**: Structured 14-day or 30-day practice roadmaps
- **ESCALATE/REDEMPTION**: Adaptive difficulty based on performance

## Setup Options
```bash
# From GitHub template (recommended)
gh repo create mastery --template arcbjorn/mastery-template

# Fork for ongoing updates (recommended)
gh repo fork arcbjorn/mastery-template mastery
```

<details>
<summary>Alternative setup methods</summary>

```bash
# Using degit (needs npm globally)
npx degit arcbjorn/mastery-template mastery

# Traditional clone
git clone <repo-url> && cd mastery

# Sync template changes to existing project
git remote add template https://github.com/arcbjorn/mastery-template
git fetch template
git merge template/master
```
</details>

## Quick Start
```bash
# Initialize directory structure (first time only)
chmod +x init.sh
./init.sh

claude-code

# Start practicing immediately
/session leetcode     # LeetCode problems + solution file
/session arch         # System design
```

## All Commands

### Session Control
| Command | Purpose |
|---------|---------|
| `/session leetcode` | LeetCode problem practice with timer + solution file |
| `/session leetcode py` | Override language (py/js/java/cpp/go/rs/ts/c/cs/kt/swift/hs/scala) |
| `/session arch` | System design practice session |
| `/escalate` | Increase difficulty after wins |
| `/redemption` | Recovery session after failures |

### Live Coaching (During Sessions)
| Command | Purpose |
|---------|---------|
| `/hint 1`, `/hint 2`, `/hint 3` | Progressive hint ladder |
| `/hint nudge`, `/hint blocked`, `/hint struggling` | Get unstuck instantly |
| `/momentum` | Energy/focus assessment |
| `/submit` | Evaluate your solution |
| `/submit` then `rate` | Detailed scoring breakdown |

### Analytics & Planning
| Command | Purpose |
|---------|---------|
| `/review` | Full performance dashboard |
| `/streak` | Current streak + motivation boost |
| `/plan 14` | 2-week structured roadmap |
| `/plan 30` | Monthly practice plan |
| `/debug-session` | Analyze performance drops |

### Learning Tools
| Command | Purpose |
|---------|---------|
| `/teach-pack` | Deep explanations post-session |
| `/pattern-drill <tag>` | Focused practice on weak areas |
| `/log-only` | Raw performance data output |
| `/overview` | Complete functionality guide |

## Game Mechanics
- **Speedruns**: Beat personal bests with timer pressure
- **Streaks**: Consecutive wins trigger auto-escalation
- **Trophies**: Achievement collection and celebration
- **Boss Fights**: Capstone challenges every 5th session
- **JACKPOT**: Bonus sessions (deterministic scheduling)
- **Rivalry**: You vs Past-You competitive framing

## Solution Workflows

### 1. File-Based (Recommended)
- Each session creates: `solutions/YYYY/MM/<session_id>_solution.<ext>`
- Edit file directly in your editor
- Run `submit` to evaluate from file
- Solutions automatically archived

### 2. Paste-Based (Fallback)
```
LC_SUBMISSION
Lang: python
Problem: LC-1 Two Sum
Code:
def twoSum(nums, target):
    # your solution
```

**Architecture Designs:**
```
ARCH_SUBMISSION
Title: Chat System
Constraints: 10M users, <100ms latency
Design: • WebSocket connections • Redis pub/sub
APIs: /send, /history
Data: messages(id, user, text, timestamp)
```

## File Structure
```
init.sh                                         # Setup script (Linux + macOS)
sessions/YYYY/MM/<session_id>.json             # Session logs & analytics
solutions/YYYY/MM/<session_id>_solution.<ext>  # Persistent solution files
trophies/README.md                              # Achievement wall
plans/<14-day|30-day>.md                        # Practice roadmaps
.coach/metrics.json                             # Performance tracking
.coach/preferences.json                         # Language defaults
```

**Auto-Tracking**: Personal bests, streak tracking, difficulty progression, pattern analysis

**First-time setup**: Run `./init.sh` to create directories and set language preferences

## Session Rituals
**Pre**: 3 breaths → set timer → declare goal (30-60s)
**Post**: Fist pump/"YES" → 60s retro → set next hook → log trophy
