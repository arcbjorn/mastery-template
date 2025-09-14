#!/bin/bash
# Mastery Coach Session Initializer
# Creates directory structure and preferences for first-time setup

set -euo pipefail

YEAR=$(date +%Y)
MONTH=$(date +%m)
COACH_DIR=".coach"
SESSIONS_DIR="sessions/$YEAR/$MONTH"
SOLUTIONS_DIR="solutions/$YEAR/$MONTH"
TROPHIES_DIR="trophies"
PLANS_DIR="plans"

# Cross-platform timezone detection
get_timezone() {
    if command -v timedatectl >/dev/null 2>&1; then
        # Linux with systemd
        timedatectl show --property=Timezone --value 2>/dev/null || echo "UTC"
    elif [[ -f /etc/timezone ]]; then
        # Linux fallback
        cat /etc/timezone 2>/dev/null || echo "UTC"
    elif [[ -L /etc/localtime ]]; then
        # macOS and some Linux
        readlink /etc/localtime | sed 's|.*/zoneinfo/||' 2>/dev/null || echo "UTC"
    else
        # Ultimate fallback
        echo "UTC"
    fi
}

# Cross-platform ISO date
get_iso_date() {
    if date --iso-8601=seconds >/dev/null 2>&1; then
        # GNU date (Linux)
        date --iso-8601=seconds
    else
        # BSD date (macOS)
        date -Iseconds 2>/dev/null || date "+%Y-%m-%dT%H:%M:%S%z"
    fi
}

TIMEZONE=$(get_timezone)
ISO_DATE=$(get_iso_date)

echo "🚀 Initializing Mastery Coach directory structure..."

# Create directory structure
mkdir -p "$SESSIONS_DIR" "$SOLUTIONS_DIR" "$TROPHIES_DIR" "$PLANS_DIR" "$COACH_DIR"

# Initialize preferences file if it doesn't exist
PREFERENCES_FILE="$COACH_DIR/preferences.json"
if [[ ! -f "$PREFERENCES_FILE" ]]; then
    echo "🎯 Setting up language preferences..."
    echo "Available languages: py js java cpp go rs ts c cs kt swift hs scala md"
    read -p "Enter your default coding language [py]: " default_lang
    default_lang=${default_lang:-py}

    cat > "$PREFERENCES_FILE" << EOF
{
  "default_language": "$default_lang",
  "created_at": "$ISO_DATE",
  "timezone": "$TIMEZONE"
}
EOF
    echo "✅ Saved preference: $default_lang (timezone: $TIMEZONE)"
fi

# Initialize metrics file if it doesn't exist
METRICS_FILE="$COACH_DIR/metrics.json"
if [[ ! -f "$METRICS_FILE" ]]; then
    cat > "$METRICS_FILE" << EOF
{
  "total_sessions": 0,
  "current_streak": 0,
  "best_streak": 0,
  "difficulty_stats": {
    "easy": {"count": 0, "avg_time_min": 0},
    "medium": {"count": 0, "avg_time_min": 0},
    "hard": {"count": 0, "avg_time_min": 0}
  },
  "tag_performance": {},
  "personal_bests": {},
  "last_session": null,
  "initialized_at": "$ISO_DATE",
  "timezone": "$TIMEZONE"
}
EOF
    echo "✅ Initialized performance tracking"
fi

# Initialize trophy wall if it doesn't exist
TROPHY_FILE="$TROPHIES_DIR/README.md"
if [[ ! -f "$TROPHY_FILE" ]]; then
    cat > "$TROPHY_FILE" << EOF
# 🏆 Trophy Wall

*Your achievements will appear here as you crush problems and build systems.*

## Recent Victories
<!-- Auto-populated by coach -->

## Streak Milestones
<!-- Auto-populated by coach -->

## Epic Moments
<!-- Auto-populated by coach -->

---
*Trophy system initialized $(date)*
EOF
    echo "✅ Created trophy wall"
fi

echo ""
echo "🎉 Setup complete! Directory structure:"
echo "   sessions/     - Session logs & analytics"
echo "   solutions/    - Persistent solution files"
echo "   trophies/     - Achievement wall"
echo "   plans/        - Practice roadmaps"
echo "   .coach/       - Metrics & preferences"
echo ""
echo "🔥 Ready to start your first session!"
echo "   claude-code"
echo '   > start a session leetcode'
echo ""