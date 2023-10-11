#!/usr/bin/env sh
xset -dpms
xset s off
xset s noblank

while true
do
    chromium-browser HUBBEL_URL \
    --window-size=1280,1024 \
    --window-position=0,0 \
    --start-fullscreen \
    --kiosk \
    --incognito \
    --noerrdialogs \
    --disable-translate \
    --no-first-run \
    --fast \
    --fast-start \
    --disable-infobars \
    --disable-features=TranslateUI \
    --disk-cache-dir=/dev/null \
    --overscroll-history-navigation=0 \
    --disable-pinch
done