# Clone selected repositories into projects/

set -e

ROOT_DIR=$(cd "$(dirname "$0")" && pwd)/..
TARGET_DIR="$ROOT_DIR/projects"

mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

repos=(
  "https://github.com/tensorflow/tensorflow.git"
  "https://github.com/pytorch/pytorch.git"
  "https://github.com/huggingface/transformers.git"
  "https://github.com/ultralytics/ultralytics.git"
  "https://github.com/rasbt/LLMs-from-scratch.git"
  "https://github.com/mlabonne/llm-course.git"
  "https://github.com/microsoft/ML-For-Beginners.git"
  "https://github.com/eriklindernoren/ML-From-Scratch.git"
  "https://github.com/f/prompts.chat.git"
  "https://github.com/qdrant/qdrant.git"
)

for r in "${repos[@]}"; do
  name=$(basename "$r" .git)
  if [ -d "$name" ]; then
    echo "$name already exists — skipping"
  else
    echo "Cloning $r"
    git clone --depth 1 "$r" || echo "Failed to clone $r"
  fi
done

echo "Done. Cloned repositories are in $TARGET_DIR"
