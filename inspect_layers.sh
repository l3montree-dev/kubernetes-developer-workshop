#!/bin/bash

# Check if an image tar file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <image.tar>"
    exit 1
fi

IMAGE_TAR=$1
EXTRACT_DIR="extracted_image"
LAYERS_DIR="layers"
MERGED_FS="merged_fs"
MANIFEST_FILE="$EXTRACT_DIR/manifest.json"

# Cleanup old extraction (if exists)
rm -rf "$EXTRACT_DIR" "$LAYERS_DIR" "$MERGED_FS"
mkdir -p "$EXTRACT_DIR" "$LAYERS_DIR" "$MERGED_FS"

# Extract the main image tar
echo "[+] Extracting $IMAGE_TAR..."
tar -xf "$IMAGE_TAR" -C "$EXTRACT_DIR"

# Ensure manifest.json exists
if [ ! -f "$MANIFEST_FILE" ]; then
    echo "[!] Error: manifest.json not found!"
    exit 1
fi

# Read layer order from manifest.json
LAYER_PATHS=$(jq -r '.[0].Layers[]' "$MANIFEST_FILE")

echo "[+] Extracting and merging layers in correct order..."

# Function to safely extract layers
extract_layer() {
    local layer_tar="$EXTRACT_DIR/$1"
    local layer_id=$(basename "$layer_tar" .tar)
    local layer_path="$LAYERS_DIR/$layer_id"

    mkdir -p "$layer_path"

    # Try extracting and catch failures
    if tar -xf "$layer_tar" -C "$layer_path" 2>/dev/null; then
        rsync -a "$layer_path/" "$MERGED_FS/"
        echo "[+] Merged layer: $layer_id"
    else
        echo "[!] Skipping invalid layer: $layer_id"
    fi
}

# Process layers in correct order
for layer_rel_path in $LAYER_PATHS; do
    extract_layer "$layer_rel_path"
done

echo "[+] Done! Merged filesystem is in $MERGED_FS"
