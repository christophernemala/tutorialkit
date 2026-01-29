# 🚀 TutorialKit - Production Deployment

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/christophernemala/tutorialkit)

## ⚡ Quick Deploy (1-Click)

Click the button above to deploy to Vercel in under 2 minutes.

---

## 📦 What's Included

This repository is **production-ready** with:

✅ **Full WebContainer API Support**
- Cross-origin isolation configured
- Service Workers enabled
- WebAssembly support
- SharedArrayBuffer available

✅ **Enterprise-Grade Security**
- HTTPS enforced
- Security headers configured
- CORS policies optimized
- XSS protection enabled

✅ **Performance Optimized**
- CDN distribution
- Immutable asset caching
- Code splitting
- Asset optimization

✅ **CI/CD Pipeline**
- Automated testing
- Build validation
- Auto-deployment on push
- Preview deployments for PRs

✅ **Zero-Downtime Deployment**
- Instant rollback
- Versioned releases
- Environment isolation

---

## 🎯 Deployment Options

### Option 1: One-Click Deploy (Recommended)

1. Click the "Deploy with Vercel" button above
2. Connect your GitHub account
3. Configure project settings (auto-filled)
4. Click "Deploy"
5. Done! ✨

### Option 2: Manual Deploy

```bash
# Install Vercel CLI
npm i -g vercel

# Clone repository
git clone https://github.com/christophernemala/tutorialkit.git
cd tutorialkit

# Install dependencies
pnpm install

# Deploy to production
vercel --prod
```

### Option 3: Automated CI/CD

1. Fork this repository
2. Add GitHub secrets:
   - `VERCEL_TOKEN`
   - `VERCEL_ORG_ID`
   - `VERCEL_PROJECT_ID`
3. Push to `main` branch
4. GitHub Actions deploys automatically

---

## 🔧 Configuration

### Build Settings

```json
{
  "buildCommand": "pnpm install && pnpm build",
  "outputDirectory": "docs/tutorialkit.dev/dist",
  "installCommand": "pnpm install --frozen-lockfile",
  "nodeVersion": "18.18.0"
}
```

### Environment Variables

```bash
NODE_VERSION=18.18.0
PNPM_VERSION=8.15.6
NODE_OPTIONS=--max-old-space-size=4096
ASTRO_TELEMETRY_DISABLED=1
```

---

## 📚 Documentation

- **[Complete Deployment Guide](./DEPLOYMENT.md)** - Detailed instructions
- **[Production Checklist](./PRODUCTION_CHECKLIST.md)** - Validation steps
- **[Environment Variables](./.env.example)** - Configuration template

---

## 🏗️ Architecture

```
TutorialKit Platform
├── WebContainer API (Interactive coding environment)
├── Astro Framework (Static site generation)
├── React Components (UI layer)
├── Vercel Edge Network (Global CDN)
└── GitHub Actions (CI/CD pipeline)
```

---

## ✅ Production Requirements Met

- ✅ Node.js 18.18.0+
- ✅ pnpm 8.15.6
- ✅ HTTPS enforced
- ✅ Cross-origin isolation
- ✅ Service Workers enabled
- ✅ WASM support
- ✅ CDN caching
- ✅ Security headers
- ✅ Zero-downtime deployment
- ✅ Automatic rollback

---

## 🎨 Features

### Interactive Tutorial Platform
- **Live Code Editor** - Monaco-based editor with syntax highlighting
- **Integrated Terminal** - Full terminal access in browser
- **File System** - Virtual file system with WebContainer
- **Live Preview** - Real-time preview of changes
- **Multi-Language Support** - JavaScript, TypeScript, HTML, CSS, and more

### Developer Experience
- **Hot Module Replacement** - Instant updates during development
- **Type Safety** - Full TypeScript support
- **Component Library** - Pre-built React components
- **Theming System** - Customizable UI themes
- **Markdown Support** - Write tutorials in Markdown

---

## 📊 Performance Targets

| Metric | Target | Status |
|--------|--------|--------|
| Lighthouse Score | 95+ | ✅ |
| First Contentful Paint | < 1.5s | ✅ |
| Time to Interactive | < 3.5s | ✅ |
| Largest Contentful Paint | < 2.5s | ✅ |
| Cumulative Layout Shift | < 0.1 | ✅ |

---

## 🔒 Security

### Headers Configured
```
Cross-Origin-Embedder-Policy: require-corp
Cross-Origin-Opener-Policy: same-origin
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Referrer-Policy: strict-origin-when-cross-origin
```

### Caching Strategy
- **Static Assets**: 1 year immutable cache
- **Service Worker**: No cache, always fresh
- **HTML Pages**: CDN cached with revalidation

---

## 🚦 Deployment Status

![Build Status](https://github.com/christophernemala/tutorialkit/workflows/Production%20Deployment/badge.svg)

**Current Status**: ✅ Production Ready

**Last Deployment**: Auto-deployed on push to `main`

**Deployment Time**: ~5-10 minutes

---

## 🆘 Troubleshooting

### Build Fails
```bash
# Increase Node.js memory
NODE_OPTIONS=--max-old-space-size=8192 pnpm build
```

### WebContainer Not Working
- Verify HTTPS is enabled
- Check COOP/COEP headers
- Ensure Service Workers are registered

### Deployment Timeout
- Increase function timeout in `vercel.json`
- Optimize build process
- Check for memory leaks

---

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details

---

## 🙏 Credits

- **TutorialKit** by [StackBlitz](https://stackblitz.com)
- **WebContainer API** by [StackBlitz](https://webcontainers.io)
- **Astro Framework** by [Astro](https://astro.build)
- **Deployment** by [Vercel](https://vercel.com)

---

## 📞 Support

- **Documentation**: https://tutorialkit.dev
- **Issues**: https://github.com/christophernemala/tutorialkit/issues
- **Discussions**: https://github.com/christophernemala/tutorialkit/discussions

---

**Ready to deploy? Click the button at the top! 🚀**

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/christophernemala/tutorialkit)
