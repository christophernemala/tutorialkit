# 🎯 Complete Setup Guide - Deploy TutorialKit in 10 Minutes

This guide will walk you through deploying your TutorialKit platform step-by-step.

---

## 📋 Prerequisites

Before starting, make sure you have:
- [ ] GitHub account (you already have this ✅)
- [ ] Vercel account (free) - [Sign up here](https://vercel.com/signup)
- [ ] Git installed on your computer
- [ ] Node.js 18.18.0+ installed

---

## 🚀 Method 1: One-Click Deploy (Easiest - 2 Minutes)

### Step 1: Click the Deploy Button

Click this button to deploy instantly:

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/christophernemala/tutorialkit&project-name=tutorialkit&repository-name=tutorialkit)

### Step 2: Configure on Vercel

1. **Sign in to Vercel** (or create account)
2. **Repository Name**: `tutorialkit` (or choose your own)
3. **Framework Preset**: Other
4. Click **"Deploy"**

### Step 3: Wait for Deployment

- Build time: ~5-10 minutes
- You'll see a progress bar
- Don't close the browser tab

### Step 4: Success! 🎉

Once complete, you'll see:
- ✅ Deployment URL (e.g., `https://tutorialkit-xyz.vercel.app`)
- ✅ Live platform ready to use
- ✅ Automatic HTTPS enabled

**You're done! Skip to "Verify Deployment" section below.**

---

## 🛠️ Method 2: Manual Deploy with CLI (5 Minutes)

### Step 1: Install Vercel CLI

Open your terminal and run:

```bash
npm install -g vercel
```

### Step 2: Clone the Repository

```bash
# Clone your repository
git clone https://github.com/christophernemala/tutorialkit.git

# Navigate into the directory
cd tutorialkit
```

### Step 3: Login to Vercel

```bash
vercel login
```

This will:
1. Open your browser
2. Ask you to confirm login
3. Return to terminal when done

### Step 4: Deploy to Production

```bash
# Deploy directly to production
vercel --prod
```

The CLI will ask you:
- **Set up and deploy?** → Yes
- **Which scope?** → Select your account
- **Link to existing project?** → No
- **Project name?** → tutorialkit (or your choice)
- **Directory?** → ./ (press Enter)
- **Override settings?** → No

### Step 5: Wait for Build

You'll see:
```
🔍 Inspect: https://vercel.com/...
✅ Production: https://tutorialkit-xyz.vercel.app
```

**Deployment complete!**

---

## 🤖 Method 3: Automated CI/CD (10 Minutes Setup)

This enables automatic deployment whenever you push code to GitHub.

### Step 1: Get Vercel Credentials

```bash
# First, link your project
cd tutorialkit
vercel link

# This creates .vercel/project.json
# Open it to get your credentials
cat .vercel/project.json
```

You'll see:
```json
{
  "orgId": "team_xxxxxxxxxxxxx",
  "projectId": "prj_xxxxxxxxxxxxx"
}
```

### Step 2: Create Vercel Token

1. Go to https://vercel.com/account/tokens
2. Click **"Create Token"**
3. Name: `GitHub Actions`
4. Scope: Full Account
5. Click **"Create"**
6. **Copy the token** (you won't see it again!)

### Step 3: Add GitHub Secrets

1. Go to: https://github.com/christophernemala/tutorialkit/settings/secrets/actions
2. Click **"New repository secret"**
3. Add these three secrets:

**Secret 1:**
- Name: `VERCEL_TOKEN`
- Value: (paste the token from Step 2)

**Secret 2:**
- Name: `VERCEL_ORG_ID`
- Value: (the `orgId` from Step 1)

**Secret 3:**
- Name: `VERCEL_PROJECT_ID`
- Value: (the `projectId` from Step 1)

### Step 4: Trigger Deployment

```bash
# Make a small change
echo "# Deployed!" >> README.md

# Commit and push
git add .
git commit -m "feat: enable automated deployment"
git push origin main
```

### Step 5: Watch the Magic

1. Go to: https://github.com/christophernemala/tutorialkit/actions
2. You'll see the workflow running
3. Wait ~10 minutes for completion
4. Check the deployment URL in the workflow summary

**Now every push to `main` automatically deploys!**

---

## ✅ Verify Deployment

After deployment, verify everything works:

### 1. Check the Website

Visit your deployment URL (e.g., `https://tutorialkit-xyz.vercel.app`)

You should see:
- ✅ TutorialKit homepage loads
- ✅ Navigation works
- ✅ No console errors

### 2. Verify WebContainer

Open browser DevTools (F12) and run:

```javascript
// Check for WebContainer requirements
console.log('SharedArrayBuffer:', typeof SharedArrayBuffer !== 'undefined');
console.log('Service Worker:', 'serviceWorker' in navigator);
console.log('WebAssembly:', typeof WebAssembly !== 'undefined');
```

All should return `true`.

### 3. Check Security Headers

```bash
# Replace with your actual URL
curl -I https://tutorialkit-xyz.vercel.app | grep -i "cross-origin"
```

You should see:
```
cross-origin-embedder-policy: require-corp
cross-origin-opener-policy: same-origin
```

### 4. Test a Tutorial

1. Click on any tutorial
2. Try editing code in the editor
3. Check if terminal works
4. Verify preview pane updates

---

## 🎨 Customize Your Platform

### Change Site Title

Edit `docs/tutorialkit.dev/astro.config.ts`:

```typescript
starlight({
  title: 'Your Custom Title Here',  // Change this
  // ...
})
```

### Add Your Logo

1. Add your logo to `docs/tutorialkit.dev/src/assets/`
2. Update `astro.config.ts`:

```typescript
logo: {
  dark: './src/assets/your-logo-dark.svg',
  light: './src/assets/your-logo-light.svg',
}
```

### Create Your First Tutorial

```bash
cd docs/tutorialkit.dev/src/content/tutorial

# Create a new tutorial directory
mkdir my-first-tutorial

# Create the lesson file
cat > my-first-tutorial/content.md << 'EOF'
---
type: lesson
title: My First Tutorial
focus: /index.js
---

# Welcome to My Tutorial

Let's build something awesome!

## Step 1: Write Some Code

Try editing the code in `index.js`:

```js
console.log('Hello, World!');
```
EOF

# Create the code file
mkdir -p my-first-tutorial/_files
echo "console.log('Hello, World!');" > my-first-tutorial/_files/index.js
```

### Deploy Your Changes

```bash
git add .
git commit -m "feat: add my first tutorial"
git push origin main
```

If you set up CI/CD, it will auto-deploy. Otherwise, run:

```bash
vercel --prod
```

---

## 🔧 Troubleshooting

### Build Fails with Memory Error

**Error:** `JavaScript heap out of memory`

**Solution:**
```bash
# Increase Node.js memory
export NODE_OPTIONS=--max-old-space-size=8192
pnpm build
```

### WebContainer Not Working

**Error:** `SharedArrayBuffer is not defined`

**Solution:** Check security headers are set correctly in `vercel.json`

### Deployment Timeout

**Error:** `Function execution timed out`

**Solution:** Already configured in `vercel.json` with 60s timeout. If still failing, contact Vercel support.

### pnpm Version Mismatch

**Error:** `This project requires pnpm version 8.15.6`

**Solution:**
```bash
npm install -g pnpm@8.15.6
```

---

## 📊 What's Next?

### Immediate Actions

- [ ] Bookmark your deployment URL
- [ ] Share with colleagues/friends
- [ ] Create your first tutorial
- [ ] Customize branding

### Advanced Setup

- [ ] Add custom domain (Vercel dashboard → Domains)
- [ ] Set up analytics (Vercel Analytics)
- [ ] Configure environment variables
- [ ] Add team members

### Content Creation

- [ ] Plan your tutorial series
- [ ] Write lesson content
- [ ] Add code examples
- [ ] Test with real users

---

## 🎓 Learning Resources

### Official Documentation
- **TutorialKit Docs**: https://tutorialkit.dev
- **Vercel Docs**: https://vercel.com/docs
- **Astro Docs**: https://docs.astro.build

### Your Repository Docs
- **Quick Deploy**: [QUICK_DEPLOY.md](./QUICK_DEPLOY.md)
- **Full Guide**: [DEPLOYMENT.md](./DEPLOYMENT.md)
- **Checklist**: [PRODUCTION_CHECKLIST.md](./PRODUCTION_CHECKLIST.md)

---

## 💡 Pro Tips

### Tip 1: Use Preview Deployments

Every pull request gets a preview URL automatically. Great for testing changes!

### Tip 2: Monitor Performance

Enable Vercel Analytics:
1. Go to Vercel dashboard
2. Select your project
3. Click "Analytics" → Enable

### Tip 3: Set Up Custom Domain

1. Buy a domain (Namecheap, Google Domains, etc.)
2. In Vercel dashboard → Domains
3. Add your domain
4. Update DNS records as instructed

### Tip 4: Backup Your Content

```bash
# Regularly commit your tutorials
git add .
git commit -m "content: update tutorials"
git push origin main
```

---

## ✅ Success Checklist

After completing this guide, you should have:

- [x] TutorialKit deployed and live
- [x] HTTPS enabled automatically
- [x] WebContainer API working
- [x] Security headers configured
- [x] CDN distribution active
- [x] Deployment URL accessible
- [x] (Optional) CI/CD pipeline active
- [x] (Optional) Custom domain configured

---

## 🎉 Congratulations!

You now have a **production-ready interactive coding platform**!

**Your deployment URL**: `https://your-project.vercel.app`

**What you can do now**:
- Create coding tutorials
- Build interactive documentation
- Onboard developers
- Showcase your projects
- Teach programming

**Need help?**
- Check [DEPLOYMENT.md](./DEPLOYMENT.md) for detailed info
- Open an issue: https://github.com/christophernemala/tutorialkit/issues
- Vercel support: https://vercel.com/support

---

**Happy teaching! 🚀**
