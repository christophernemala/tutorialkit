# 🔐 Setup Vercel Secrets for Automated Deployment

To enable automated deployment via GitHub Actions, you need to add Vercel credentials as GitHub secrets.

---

## 📋 **What You Need**

Three secrets are required:
1. **VERCEL_TOKEN** - Your Vercel authentication token
2. **VERCEL_ORG_ID** - Your Vercel organization ID
3. **VERCEL_PROJECT_ID** - Your Vercel project ID

---

## 🚀 **STEP-BY-STEP GUIDE**

### **Step 1: Get Your Vercel Token**

1. **Go to Vercel Tokens page**:
   👉 https://vercel.com/account/tokens

2. **Create a new token**:
   - Click **"Create Token"**
   - Name: `GitHub Actions` (or any name you prefer)
   - Scope: **Full Account**
   - Expiration: **No Expiration** (or set your preference)

3. **Copy the token**:
   - Click **"Create"**
   - **IMPORTANT**: Copy the token immediately
   - You won't be able to see it again!
   - Save it somewhere temporarily

**Example token**: `vercel_abc123def456ghi789...`

---

### **Step 2: Get Your Vercel Org ID and Project ID**

#### **Option A: Link Project First (Recommended)**

```bash
# Install Vercel CLI
npm install -g vercel

# Clone your repository (if not already)
git clone https://github.com/christophernemala/tutorialkit.git
cd tutorialkit

# Login to Vercel
vercel login

# Link the project
vercel link
```

**Follow the prompts**:
- Set up and deploy? → **Yes**
- Which scope? → Select your account
- Link to existing project? → **No**
- Project name? → `tutorialkit` (or your choice)
- Directory? → `./` (press Enter)

**Get the IDs**:
```bash
# View the project configuration
cat .vercel/project.json
```

**You'll see**:
```json
{
  "orgId": "team_xxxxxxxxxxxxx",
  "projectId": "prj_xxxxxxxxxxxxx"
}
```

**Copy these values**:
- `orgId` → This is your **VERCEL_ORG_ID**
- `projectId` → This is your **VERCEL_PROJECT_ID**

---

#### **Option B: Deploy First, Then Get IDs**

1. **Deploy to Vercel**:
   👉 https://vercel.com/new/clone?repository-url=https://github.com/christophernemala/tutorialkit

2. **After deployment, go to project settings**:
   - Go to your Vercel dashboard
   - Click on your project
   - Go to **Settings** → **General**

3. **Find the IDs**:
   - **Project ID**: In the URL or settings page
   - **Org ID**: In your account settings

---

### **Step 3: Add Secrets to GitHub**

1. **Go to your repository secrets page**:
   👉 https://github.com/christophernemala/tutorialkit/settings/secrets/actions

2. **Add the first secret**:
   - Click **"New repository secret"**
   - Name: `VERCEL_TOKEN`
   - Value: Paste your Vercel token from Step 1
   - Click **"Add secret"**

3. **Add the second secret**:
   - Click **"New repository secret"**
   - Name: `VERCEL_ORG_ID`
   - Value: Paste your org ID from Step 2
   - Click **"Add secret"**

4. **Add the third secret**:
   - Click **"New repository secret"**
   - Name: `VERCEL_PROJECT_ID`
   - Value: Paste your project ID from Step 2
   - Click **"Add secret"**

---

## ✅ **Verify Your Secrets**

After adding all three secrets, you should see:

```
Repository secrets (3)

VERCEL_TOKEN          Updated X minutes ago
VERCEL_ORG_ID         Updated X minutes ago
VERCEL_PROJECT_ID     Updated X minutes ago
```

**Note**: You can't view the secret values after adding them (for security).

---

## 🎯 **Test Automated Deployment**

Once secrets are added, test the deployment:

```bash
# Make a small change
echo "# Test deployment" >> README.md

# Commit and push
git add .
git commit -m "test: trigger automated deployment"
git push origin main
```

**What happens**:
1. GitHub Actions workflow triggers
2. Uses your secrets to authenticate with Vercel
3. Builds your project
4. Deploys to Vercel automatically
5. You get a deployment URL!

**Check progress**:
👉 https://github.com/christophernemala/tutorialkit/actions

---

## 🔧 **Troubleshooting**

### **Error: "VERCEL_TOKEN is not set"**

**Solution**: Make sure you added the secret with the exact name `VERCEL_TOKEN` (case-sensitive)

---

### **Error: "Invalid token"**

**Solution**: 
1. Token might have expired
2. Create a new token: https://vercel.com/account/tokens
3. Update the GitHub secret with the new token

---

### **Error: "Project not found"**

**Solution**: 
1. Verify `VERCEL_PROJECT_ID` is correct
2. Make sure you linked/deployed the project first
3. Check the project exists in your Vercel dashboard

---

### **Error: "Unauthorized"**

**Solution**:
1. Verify `VERCEL_ORG_ID` is correct
2. Make sure the token has correct permissions
3. Token scope should be "Full Account"

---

## 📊 **Complete Configuration Checklist**

- [ ] Vercel account created
- [ ] Vercel token generated
- [ ] Project linked or deployed to Vercel
- [ ] Org ID obtained
- [ ] Project ID obtained
- [ ] `VERCEL_TOKEN` added to GitHub secrets
- [ ] `VERCEL_ORG_ID` added to GitHub secrets
- [ ] `VERCEL_PROJECT_ID` added to GitHub secrets
- [ ] Test deployment triggered
- [ ] Deployment successful

---

## 🎉 **What You Get After Setup**

Once configured, every time you push to `main`:

1. ✅ **Automatic build** - GitHub Actions builds your project
2. ✅ **Automatic deployment** - Deploys to Vercel
3. ✅ **Live URL** - Get production URL instantly
4. ✅ **Zero manual work** - Just push code!

**Example workflow**:
```bash
# Edit your tutorial
vim docs/tutorialkit.dev/src/content/tutorial/my-lesson/content.md

# Commit and push
git add .
git commit -m "feat: add new lesson"
git push origin main

# Wait 5-10 minutes
# Your changes are LIVE automatically!
```

---

## 🔗 **Quick Links**

- **Create Vercel Token**: https://vercel.com/account/tokens
- **GitHub Secrets**: https://github.com/christophernemala/tutorialkit/settings/secrets/actions
- **Vercel Dashboard**: https://vercel.com/dashboard
- **GitHub Actions**: https://github.com/christophernemala/tutorialkit/actions

---

## 💡 **Alternative: Manual Deployment**

If you don't want to set up secrets, you can still deploy manually:

### **Option 1: One-Click Deploy**
👉 https://vercel.com/new/clone?repository-url=https://github.com/christophernemala/tutorialkit

### **Option 2: CLI Deploy**
```bash
npm install -g vercel
cd tutorialkit
vercel --prod
```

**No secrets needed for manual deployment!**

---

## 📝 **Summary**

**To enable automated deployment**:

1. Get Vercel token: https://vercel.com/account/tokens
2. Link project: `vercel link`
3. Get IDs from `.vercel/project.json`
4. Add 3 secrets to GitHub: https://github.com/christophernemala/tutorialkit/settings/secrets/actions
5. Push code → Auto-deploy! 🚀

**Secrets needed**:
```
VERCEL_TOKEN = [your token from vercel.com/account/tokens]
VERCEL_ORG_ID = [from .vercel/project.json]
VERCEL_PROJECT_ID = [from .vercel/project.json]
```

---

**Need help?** Check the troubleshooting section above or open an issue!

**Ready to deploy?** Follow the steps above! 🎉
