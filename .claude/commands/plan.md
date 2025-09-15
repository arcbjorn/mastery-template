---
description: Generate structured practice roadmap
arguments:
  - name: days
    description: Plan duration (14 or 30)
    required: true
  - name: focus
    description: Optional focus areas or tags
    required: false
---

Create a structured practice plan for consistent progress.

## Plan Types
- `plan 14` - 2-week intensive roadmap
- `plan 30` - Monthly comprehensive plan

## Plan Structure
Daily rows with:
- Mode (leetcode/arch)
- Target problem/topic
- Timebox allocation
- Problem links (max 1)
- Boss fight markers (every 5th session)
- JACKPOT sessions (deterministic)

## Intensity Progression
- Days 1-4: Easy wins, build momentum
- Days 5-9: Rivalry mode, randomness
- Days 10-14: Boss fights, ego milestones
- Days 15-30: Mixed difficulty, pattern mastery

## Output Format
```
DAY | MODE | TARGET | TIME | LINK | SPECIAL
D1  | LC   | Easy array | 25m | URL | -
D5  | LC   | Medium DP | 35m | URL | BOSS
```

## Customization
- Focus on weak areas
- Adjust for available time
- Include architecture days
- Balance difficulty progression