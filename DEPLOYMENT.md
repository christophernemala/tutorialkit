# TutorialKit Production Deployment Guide

## 🚀 Quick Start

This repository is configured for **zero-configuration deployment** to Vercel with full WebContainer API support.

### Prerequisites

- Node.js 18.18.0 or higher
- pnpm 8.15.6
- Vercel account (free tier works)
- GitHub account

---

## 📋 Deployment Checklist

### ✅ Pre-Deployment

- [x] Repository forked and cloned
- [x] Dependencies installed (`pnpm install`)
- [x] Build successful (`pnpm build`)
- [x] Tests passing (`pnpm test`)
- [x] Vercel configuration created
- [x] CI/CD pipeline configured
- [x] Environment variables documented

### ✅ Production Requirements

- [x] HTTPS enforced
- [x] Cross-Origin Isolation enabled (COOP/COEP headers)
- [x] Service Workers enabled
- [x] WebAssembly support enabled
- [x] CDN caching configured
- [x] Security headers configured
- [x] Immutable asset caching
- [x] Zero-downtime deployment
- [x] Automatic rollback capability

---

## 🔧 Manual Deployment to Vercel

### Step 1: Install Vercel CLI

```bash
npm i -g vercel
```

### Step 2: Login to Vercel

```bash
vercel login
```

### Step 3: Link Project

```bash
vercel link
```

### Step 4: Deploy to Production

```bash
vercel --prod
```

---

## 🤖 Automated Deployment (CI/CD)

### GitHub Actions Pipeline

The repository includes a complete CI/CD pipeline that:

1. **Quality Checks** - Runs linting and tests
2. **Build** - Compiles all packages and documentation
3. **Deploy** - Pushes to Vercel production on main branch
4. **Preview** - Creates preview deployments for PRs

### Required GitHub Secrets

Add these secrets to your GitHub repository:

1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Add the following secrets:

| Secret Name | Description | How to Get |
|------------|-------------|------------|
| `VERCEL_TOKEN` | Vercel authentication token | [Create token](https://vercel.com/account/tokens) |
| `VERCEL_ORG_ID` | Your Vercel organization ID | Run `vercel link` and check `.vercel/project.json` |
| `VERCEL_PROJECT_ID` | Your Vercel project ID | Run `vercel link` and check `.vercel/project.json` |

### Trigger Deployment

```bash
git add .
git commit -m "feat: deploy to production"
git push origin main
```

The pipeline will automatically:
- Run quality checks
- Build the application
- Deploy to Vercel production
- Generate deployment summary

---

## 🏗️ Build Configuration

### Build Commands

```json
{
  "installCommand": "pnpm install --frozen-lockfile",
  "buildCommand": "pnpm install && pnpm build",
  "outputDirectory": "docs/tutorialkit.dev/dist",
  "devCommand": "pnpm docs"
}
```

### Build Process

1. **Install Dependencies**
   ```bash
   pnpm install --frozen-lockfile
   ```

2. **Build Core Packages**
   ```bash
   pnpm build
   ```
   Builds all packages in the monorepo:
   - `@tutorialkit/astro`
   - `@tutorialkit/react`
   - `@tutorialkit/runtime`
   - `@tutorialkit/theme`
   - `@tutorialkit/types`

3. **Build Documentation Site**
   ```bash
   pnpm docs:build
   ```
   Compiles the Astro-based documentation site with:
   - Type checking
   - Asset optimization
   - Static site generation
   - Header configuration

### Output Structure

```
docs/tutorialkit.dev/dist/
├── _astro/          # Optimized assets (CSS, JS)
├── assets/          # Static assets
├── guides/          # Documentation pages
├── reference/       # API reference
├── _headers         # Security headers
└── index.html       # Entry point
```

---

## 🔒 Security Configuration

### Cross-Origin Isolation

Required for WebContainer API:

```json
{
  "Cross-Origin-Embedder-Policy": "require-corp",
  "Cross-Origin-Opener-Policy": "same-origin"
}
```

### Additional Security Headers

```json
{
  "X-Content-Type-Options": "nosniff",
  "X-Frame-Options": "DENY",
  "X-XSS-Protection": "1; mode=block",
  "Referrer-Policy": "strict-origin-when-cross-origin"
}
```

---

## 💾 Caching Strategy

### Immutable Assets (1 year)

- `/assets/*` - Static assets
- `/_astro/*` - Astro build artifacts
- `*.js`, `*.css`, `*.woff2`, etc. - Static files

```
Cache-Control: public, max-age=31536000, immutable
```

### Service Worker (No cache)

```
Cache-Control: public, max-age=0, must-revalidate
Service-Worker-Allowed: /
```

---

## 🌐 Environment Variables

### Production Environment

```bash
NODE_VERSION=18.18.0
PNPM_VERSION=8.15.6
NODE_OPTIONS=--max-old-space-size=4096
ASTRO_TELEMETRY_DISABLED=1
ENABLE_EXPERIMENTAL_COREPACK=1
```

### WebContainer Configuration

```bash
CROSS_ORIGIN_EMBEDDER_POLICY=require-corp
CROSS_ORIGIN_OPENER_POLICY=same-origin
```

---

## 🧪 Testing Deployment

### Local Preview

```bash
# Build production version
pnpm build
pnpm docs:build

# Preview locally
pnpm --filter=tutorialkit.dev preview
```

### Verify WebContainer Support

1. Open browser DevTools
2. Check Console for errors
3. Verify headers:
   ```javascript
   fetch(window.location.href).then(r => {
     console.log(r.headers.get('cross-origin-embedder-policy'));
     console.log(r.headers.get('cross-origin-opener-policy'));
   });
   ```

### Test Service Workers

```javascript
navigator.serviceWorker.getRegistrations().then(registrations => {
  console.log('Service Workers:', registrations);
});
```

---

## 📊 Monitoring & Analytics

### Vercel Analytics

Automatically enabled for:
- Page views
- Performance metrics
- Web Vitals (LCP, FID, CLS)
- Error tracking

### Build Logs

Access via:
- Vercel Dashboard → Deployments → [Your Deployment] → Build Logs
- GitHub Actions → Workflow runs → Build job

---

## 🔄 Rollback Procedure

### Via Vercel Dashboard

1. Go to **Deployments**
2. Find previous successful deployment
3. Click **⋯** → **Promote to Production**

### Via CLI

```bash
vercel rollback
```

### Via GitHub

1. Revert the commit:
   ```bash
   git revert HEAD
   git push origin main
   ```
2. Pipeline will auto-deploy the reverted version

---

## 🐛 Troubleshooting

### Build Failures

**Issue**: Out of memory during build
```bash
# Solution: Increase Node.js memory
NODE_OPTIONS=--max-old-space-size=8192 pnpm build
```

**Issue**: pnpm version mismatch
```bash
# Solution: Use exact version
pnpm install -g pnpm@8.15.6
```

### WebContainer Issues

**Issue**: SharedArrayBuffer not available
```
Solution: Verify COOP/COEP headers are set correctly
```

**Issue**: Service Worker registration failed
```
Solution: Ensure HTTPS is enabled and SW cache headers are correct
```

### Deployment Issues

**Issue**: Vercel deployment timeout
```bash
# Solution: Increase function timeout in vercel.json
{
  "functions": {
    "maxDuration": 60
  }
}
```

---

## 📚 Additional Resources

- [TutorialKit Documentation](https://tutorialkit.dev)
- [Vercel Documentation](https://vercel.com/docs)
- [WebContainer API](https://webcontainers.io)
- [Astro Documentation](https://docs.astro.build)

---

## 🎯 Performance Targets

- **Lighthouse Score**: 95+ (all categories)
- **First Contentful Paint**: < 1.5s
- **Time to Interactive**: < 3.5s
- **Largest Contentful Paint**: < 2.5s
- **Cumulative Layout Shift**: < 0.1

---

## ✅ Production Readiness

- ✅ Zero-downtime deployment
- ✅ Automatic HTTPS
- ✅ Global CDN distribution
- ✅ Immutable builds
- ✅ Instant rollback
- ✅ Preview deployments
- ✅ Environment isolation
- ✅ Security headers
- ✅ Performance optimization
- ✅ Error tracking
- ✅ Analytics integration

---

**Status**: ✅ Production Ready

**Last Updated**: 2026-01-29

**Deployment Target**: Vercel

**Framework**: Astro + WebContainer API
