#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="kernel-source"

try_clone() {
  local repo="$1"
  local branch="$2"

  echo "[INFO] mencoba clone: $repo (branch: $branch)"
  rm -rf "$TARGET_DIR"

  if git clone --depth 1 --single-branch --branch "$branch" "$repo" "$TARGET_DIR"; then
    echo "[OK] berhasil clone $repo#$branch"
    return 0
  fi

  echo "[WARN] gagal clone $repo#$branch"
  return 1
}

# Manual mode: bash script.sh <repo> <branch>
if [[ "${1-}" != "" && "${2-}" != "" ]]; then
  try_clone "$1" "$2"
  exit 0
fi

repos=(
  "https://github.com/LineageOS/android_kernel_xiaomi_ginkgo.git"
  "https://github.com/PixelOS-AOSP/kernel_xiaomi_ginkgo.git"
  "https://github.com/ProjectMatrixx/android_kernel_xiaomi_ginkgo.git"
)

branches=(
  "android-16"
  "android16"
  "16.0"
  "lineage-23.0"
  "lineage-22.2"
  "aosp-16"
)

for repo in "${repos[@]}"; do
  for branch in "${branches[@]}"; do
    if try_clone "$repo" "$branch"; then
      echo "[INFO] selesai: source ada di ./$TARGET_DIR"
      exit 0
    fi
  done
done

echo "[ERROR] semua kandidat repo/branch gagal di-clone."
echo "[INFO] jalankan manual: bash $0 <repo_url> <branch>"
exit 1
