# ⚡ Quick Deploy Reference

## 🚀 Deploy in 3 Steps

### Step 1: Choose Deployment Method

**A) One-Click Deploy** (Easiest - 2 minutes)
```
Click: https://vercel.com/new/clone?repository-url=https://github.com/christophernemala/tutorialkit
```

**B) CLI Deploy** (Fast - 5 minutes)
```bash
npm i -g vercel
git clone https://github.com/christophernemala/tutorialkit.git
cd tutorialkit
vercel --prod
```

**C) Automated CI/CD** (Best for teams - 10 minutes setup)
```bash
# 1. Add GitHub secrets
# 2. Push to main
git push origin main
```

---

## 📋 Required Information

### For Vercel Deployment
- GitHub account
- Vercel account (free tier works)

### For CI/CD (Optional)
- `VERCEL_TOKEN` - [Create here](https://vercel.com/account/tokens)
- `VERCEL_ORG_ID` - Run `vercel link`, check `.vercel/project.json`
- `VERCEL_PROJECT_ID` - Run `vercel link`, check `.vercel/project.json`

---

## 🔧 Build Configuration

```json
{
  "buildCommand": "pnpm install && pnpm build",
  "outputDirectory": "docs/tutorialkit.dev/dist",
  "installCommand": "pnpm install --frozen-lockfile",
  "nodeVersion": "18.18.0"
}
```

---

## ✅ Pre-Flight Checklist

- [ ] Node.js 18.18.0+ installed
- [ ] pnpm 8.15.6 installed
- [ ] GitHub account connected
- [ ] Vercel account created

---

## 🎯 What Gets Deployed

```
Source: docs/tutorialkit.dev/
Output: docs/tutorialkit.dev/dist/
URL: https://your-project.vercel.app
```

**Features Enabled**:
- ✅ WebContainer API
- ✅ HTTPS
- ✅ CDN
- ✅ Service Workers
- ✅ Cross-origin isolation

---

## 🐛 Quick Troubleshooting

**Build fails?**
```bash
NODE_OPTIONS=--max-old-space-size=8192 pnpm build
```

**WebContainer not working?**
```bash
# Check headers
curl -I https://your-domain.vercel.app | grep -i "cross-origin"
```

**Need help?**
- [Full Guide](./DEPLOYMENT.md)
- [Checklist](./PRODUCTION_CHECKLIST.md)
- [Issues](https://github.com/christophernemala/tutorialkit/issues)

---

## 📊 Expected Timeline

| Method | Setup Time | Deploy Time | Total |
|--------|------------|-------------|-------|
| One-Click | 0 min | 2 min | **2 min** |
| CLI | 2 min | 3 min | **5 min** |
| CI/CD | 10 min | 5 min | **15 min** |

---

## 🎉 Success Indicators

After deployment, verify:
- [ ] Site loads at Vercel URL
- [ ] HTTPS certificate active
- [ ] WebContainer initializes
- [ ] Code editor works
- [ ] Terminal functional

---

## 📞 Quick Links

- **Repository**: https://github.com/christophernemala/tutorialkit
- **Deploy Button**: https://vercel.com/new/clone?repository-url=https://github.com/christophernemala/tutorialkit
- **Full Docs**: [DEPLOYMENT.md](./DEPLOYMENT.md)
- **Checklist**: [PRODUCTION_CHECKLIST.md](./PRODUCTION_CHECKLIST.md)

---

**Status**: ✅ Ready to Deploy

**Last Updated**: 2026-01-29
