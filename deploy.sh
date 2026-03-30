#!/bin/bash
set -e

ENVIRONMENT=${1:-staging}
APP_VERSION=${2:-1.0.0}
DEPLOY_DIR="/tmp/teamcity-demo-${ENVIRONMENT}"

echo "========================================"
echo "  Deploying Python Demo App"
echo "  Environment : ${ENVIRONMENT}"
echo "  Version     : ${APP_VERSION}"
echo "  Deploy Dir  : ${DEPLOY_DIR}"
echo "========================================"

# Simulate deployment steps
echo "[1/4] Creating deployment directory..."
mkdir -p "${DEPLOY_DIR}"

echo "[2/4] Copying application files..."
cp app.py "${DEPLOY_DIR}/"
cp requirements.txt "${DEPLOY_DIR}/"

echo "[3/4] Installing dependencies..."
pip3 install -r requirements.txt -q --break-system-packages

echo "[4/4] Starting application..."
cd "${DEPLOY_DIR}"
python app.py

echo "========================================"
echo "  Deployment SUCCESSFUL"
echo "  Environment : ${ENVIRONMENT}"
echo "  Version     : ${APP_VERSION}"
echo "========================================"
