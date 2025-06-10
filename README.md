# Like Jitsumu Code

## 概要

実務で経験した様々な技術や開発手法を実装し、スキルをアピールするためのDjangoベースのポートフォリオサイトです。
各機能は実際のプロジェクトで培った経験を基に設計・実装されており、コピーアンドペーストではなく自身でカスタマイズした実装を行っています

## 技術スタック

- **Backend**: Django 4.0.10
- **Frontend**: HTML/CSS/JavaScript
- **Database**: SQLite (開発環境) / PostgreSQL (本番環境)
- **Infrastructure**: Docker, Google Cloud Run, Artifact Registry
- **Static Files**: WhiteNoise
- **WSGI Server**: Gunicorn


## 開発環境セットアップ

### 前提条件

- Docker
- Python 3.8+
- Git

### ローカル開発

```bash
# リポジトリクローン
git clone <repository-url>
cd like_jitsumu_code

# Dockerビルド
docker build -t django-app .

# ローカルサーバー起動
docker run -p 8000:8000 django-app
```

アプリケーションは http://localhost:8000 で確認できます。

### 本番デプロイ (Google Cloud Run)

```bash
# マルチプラットフォーム対応ビルド
docker build --platform=linux/amd64 -t asia-northeast1-docker.pkg.dev/like-jitsumu-code/like-jitsumu-code-repo/like_jitsumu_code .

# Artifact Registryにプッシュ
docker push asia-northeast1-docker.pkg.dev/like-jitsumu-code/like-jitsumu-code-repo/like_jitsumu_code

# Cloud Runデプロイ
gcloud run deploy like-jitsumu-code-service \
  --image asia-northeast1-docker.pkg.dev/like-jitsumu-code/like-jitsumu-code-repo/like_jitsumu_code:latest \
  --platform managed \
  --region asia-northeast1 \
  --allow-unauthenticated
```

## 開発方針

- **実務経験の反映**: 各機能は実際のプロジェクトで使用した技術・手法を採用
- **セキュリティ重視**: 情報漏洩のリスクを排除した安全な実装
- **スケーラビリティ**: 拡張性を考慮した設計
- **保守性**: 可読性と保守性を重視したコード品質

## ライセンス

このプロジェクトは個人のポートフォリオ目的で作成されています。
