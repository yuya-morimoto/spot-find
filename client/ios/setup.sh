#!/bin/bash
set -euxo pipefail

# ローカルでのコミットメッセージチェックを追加する
cp ./config/commit-msg ./.git/hooks/commit-msg