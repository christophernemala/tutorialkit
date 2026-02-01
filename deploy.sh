#!/bin/bash

# TutorialKit Automated Deployment Script
# This script automates the deployment process to Vercel

set -e

echo "🚀 TutorialKit Deployment Script"
echo "=================================="
echo ""

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "📦 Installing Vercel CLI..."
    npm install -g vercel
else
    echo "✅ Vercel CLI already installed"
fi

echo ""
echo "🔐 Vercel Authentication"
echo "------------------------"
echo "Please login to Vercel when prompted..."
echo ""

# Login to Vercel
vercel login

echo ""
echo "🔗 Linking Project to Vercel"
echo "----------------------------"
echo ""

# Link the project
vercel link

echo ""
echo "🏗️  Building Project"
echo "-------------------"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
pnpm install --frozen-lockfile

# Build the project
echo "🔨 Building packages..."
pnpm build

echo ""
echo "🚀 Deploying to Production"
echo "-------------------------"
echo ""

# Deploy to production
vercel --prod

echo ""
echo "✅ Deployment Complete!"
echo "======================"
echo ""
echo "Your TutorialKit platform is now live!"
echo ""
echo "Next steps:"
echo "1. Visit your deployment URL (shown above)"
echo "2. Verify WebContainer functionality"
echo "3. Start creating tutorials!"
echo ""
echo "📚 Documentation:"
echo "- Quick Start: README.DEPLOYMENT.md"
echo "- Full Guide: DEPLOYMENT.md"
echo "- Checklist: PRODUCTION_CHECKLIST.md"
echo ""
