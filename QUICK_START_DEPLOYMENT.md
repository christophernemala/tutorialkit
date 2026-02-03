# ⚡ QUICK START - Deploy TutorialKit in 5 Minutes

Choose the deployment method that works best for you!

---

## 🎯 **CHOOSE YOUR PATH**

### **Path A: Instant Deploy (No Setup)** ⭐ RECOMMENDED
- ✅ Fastest (2 minutes)
- ✅ No configuration needed
- ✅ No secrets required
- ✅ Works immediately

### **Path B: Automated Deploy (One-time Setup)**
- ✅ Auto-deploy on every push
- ✅ Requires 3 GitHub secrets
- ✅ 10 minutes setup
- ✅ Best for ongoing development

---

## 🚀 **PATH A: INSTANT DEPLOY** (2 Minutes)

### **Step 1: Click Deploy Button**

👉 **[DEPLOY TO VERCEL NOW](https://vercel.com/new/clone?repository-url=https://github.com/christophernemala/tutorialkit)** 👈

### **Step 2: Sign In**
- Use GitHub account (or create free Vercel account)
- No credit card needed

### **Step 3: Configure**
- Project name: `tutorialkit` (or your choice)
- Framework: Other (auto-detected)
- Click **"Deploy"**

### **Step 4: Wait**
- Build time: 5-10 minutes
- Don't close the browser
- You'll see a progress bar

### **Step 5: Success!**
- You get a URL: `https://tutorialkit-xyz.vercel.app`
- Your platform is LIVE! 🎉

**That's it! No secrets needed!**

---

## 🤖 **PATH B: AUTOMATED DEPLOY** (10 Minutes Setup)

This enables automatic deployment whenever you push code to GitHub.

### **Prerequisites**
- Vercel account (free)
- GitHub account (you have this)
- 10 minutes

---

### **Step 1: Install Vercel CLI**

```bash
npm install -g vercel
```

---

### **Step 2: Clone Repository**

```bash
git clone https://github.com/christophernemala/tutorialkit.git
cd tutorialkit
```

---

### **Step 3: Login to Vercel**

```bash
vercel login
```

This opens your browser to authenticate.

---

### **Step 4: Link Project**

```bash
vercel link
```

**Answer the prompts**:
- Set up and deploy? → **Yes**
- Which scope? → Select your account
- Link to existing project? → **No**
- Project name? → `tutorialkit`
- Directory? → `./` (press Enter)

---

### **Step 5: Get Your Credentials**

```bash
cat .vercel/project.json
```

**You'll see**:
```json
{
  "orgId": "team_xxxxxxxxxxxxx",
  "projectId": "prj_xxxxxxxxxxxxx"
}
```

**Save these values**:
- `orgId` = Your **VERCEL_ORG_ID**
- `projectId` = Your **VERCEL_PROJECT_ID**

---

### **Step 6: Create Vercel Token**

1. Go to: https://vercel.com/account/tokens
2. Click **"Create Token"**
3. Name: `GitHub Actions`
4. Scope: **Full Account**
5. Click **"Create"**
6. **Copy the token** (you won't see it again!)

**Save this as**: **VERCEL_TOKEN**

---

### **Step 7: Add GitHub Secrets**

1. **Go to secrets page**:
   👉 https://github.com/christophernemala/tutorialkit/settings/secrets/actions

2. **Add first secret**:
   - Click **"New repository secret"**
   - Name: `VERCEL_TOKEN`
   - Value: Paste your token from Step 6
   - Click **"Add secret"**

3. **Add second secret**:
   - Click **"New repository secret"**
   - Name: `VERCEL_ORG_ID`
   - Value: Paste `orgId` from Step 5
   - Click **"Add secret"**

4. **Add third secret**:
   - Click **"New repository secret"**
   - Name: `VERCEL_PROJECT_ID`
   - Value: Paste `projectId` from Step 5
   - Click **"Add secret"**

---

### **Step 8: Test Automated Deployment**

```bash
# Make a small change
echo "# Auto-deploy test" >> README.md

# Commit and push
git add .
git commit -m "test: automated deployment"
git push origin main
```

**What happens**:
1. GitHub Actions triggers
2. Builds your project
3. Deploys to Vercel
4. You get a URL!

**Check progress**: https://github.com/christophernemala/tutorialkit/actions

---

### **Step 9: Success!**

Now every time you push to `main`:
- ✅ Automatic build
- ✅ Automatic deployment
- ✅ Live in 5-10 minutes
- ✅ Zero manual work!

---

## 📊 **COMPARISON**

| Feature | Path A (Instant) | Path B (Automated) |
|---------|------------------|-------------------|
| **Setup Time** | 2 minutes | 10 minutes |
| **Secrets Needed** | None | 3 secrets |
| **Auto-Deploy** | No | Yes |
| **Best For** | Quick start | Ongoing development |
| **Difficulty** | Easy | Medium |

---

## 🎯 **WHICH PATH SHOULD YOU CHOOSE?**

### **Choose Path A (Instant) if**:
- ✅ You want to deploy NOW
- ✅ You don't need auto-deployment
- ✅ You're just testing
- ✅ You prefer simplicity

### **Choose Path B (Automated) if**:
- ✅ You'll update content regularly
- ✅ You want auto-deployment
- ✅ You're building a production platform
- ✅ You don't mind 10 min setup

---

## 🆘 **TROUBLESHOOTING**

### **Path A Issues**

**Build fails?**
- Wait for it to complete (takes 5-10 min)
- Check build logs in Vercel dashboard
- Usually resolves on retry

**Can't sign in?**
- Use GitHub authentication
- Or create free Vercel account
- No credit card needed

---

### **Path B Issues**

**"VERCEL_TOKEN is not set"**
- Check secret name is exactly `VERCEL_TOKEN`
- Case-sensitive!
- Re-add the secret if needed

**"Invalid token"**
- Token might have expired
- Create new token: https://vercel.com/account/tokens
- Update GitHub secret

**"Project not found"**
- Verify `VERCEL_PROJECT_ID` is correct
- Make sure you ran `vercel link`
- Check project exists in Vercel dashboard

**Workflow fails?**
- Check GitHub Actions logs
- Verify all 3 secrets are added
- Make sure secrets have correct values

---

## ✅ **VERIFICATION**

After deployment, verify it works:

### **1. Visit Your URL**
- Path A: Check Vercel dashboard for URL
- Path B: Check GitHub Actions output

### **2. Test WebContainer**
- Open a tutorial
- Try editing code
- Run in terminal
- Check preview works

### **3. Check Headers**
```bash
curl -I https://your-url.vercel.app | grep -i "cross-origin"
```

Should show:
```
cross-origin-embedder-policy: require-corp
cross-origin-opener-policy: same-origin
```

---

## 📚 **NEXT STEPS**

After deployment:

1. **Customize your platform**
   - Change site title
   - Add your logo
   - Update colors

2. **Create your first tutorial**
   - Add tutorial content
   - Write code examples
   - Test with users

3. **Share it**
   - Bookmark URL
   - Share with team
   - Post on social media

---

## 🔗 **QUICK LINKS**

### **Deployment**
- **Instant Deploy**: https://vercel.com/new/clone?repository-url=https://github.com/christophernemala/tutorialkit
- **Vercel Dashboard**: https://vercel.com/dashboard
- **GitHub Actions**: https://github.com/christophernemala/tutorialkit/actions

### **Setup Guides**
- **Vercel Secrets Guide**: [SETUP_VERCEL_SECRETS.md](./SETUP_VERCEL_SECRETS.md)
- **Complete Setup**: [SETUP_GUIDE.md](./SETUP_GUIDE.md)
- **Full Deployment**: [DEPLOYMENT.md](./DEPLOYMENT.md)

### **Credentials**
- **Create Token**: https://vercel.com/account/tokens
- **Add Secrets**: https://github.com/christophernemala/tutorialkit/settings/secrets/actions

---

## 💡 **RECOMMENDED WORKFLOW**

**For beginners**:
1. Start with Path A (Instant Deploy)
2. Test and explore
3. Later, set up Path B for auto-deployment

**For developers**:
1. Go straight to Path B
2. Set up automation from the start
3. Enjoy auto-deployment!

---

## 🎉 **SUMMARY**

### **Path A: Instant Deploy**
```
1. Click deploy button
2. Sign in to Vercel
3. Click "Deploy"
4. Wait 5-10 minutes
5. Done! ✨
```

### **Path B: Automated Deploy**
```
1. Install Vercel CLI
2. Link project
3. Get credentials
4. Add 3 GitHub secrets
5. Push code = auto-deploy! 🚀
```

---

## 🚀 **READY TO DEPLOY?**

### **Path A (Instant)**:
👉 **[DEPLOY NOW](https://vercel.com/new/clone?repository-url=https://github.com/christophernemala/tutorialkit)** 👈

### **Path B (Automated)**:
👉 **[Setup Guide](./SETUP_VERCEL_SECRETS.md)** 👈

---

**Questions?** Check the troubleshooting section or open an issue!

**Happy deploying! 🎉**
