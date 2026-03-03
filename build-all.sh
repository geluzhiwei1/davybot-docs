#!/bin/bash
set -e
echo "📚 Building DavyBot Documentation"
echo ""
echo "1️⃣  Chinese..."
cd zh && mdbook build -d ../book && cd ..
echo "2️⃣  English..."
cd en && mdbook build -d ../book-en && cd ..
echo ""
echo "✅ Done!"
