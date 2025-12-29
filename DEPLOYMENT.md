# Deployment Guide

Complete guide to deploying your Jekyll portfolio site to GitHub Pages.

## Prerequisites

- [x] GitHub account
- [x] Git installed locally
- [x] Ruby and Jekyll installed (for local testing)

## Step 1: Prepare Your Content

### Update Configuration

1. Edit `_config.yml`:
   ```yaml
   title: Your Name
   url: "https://yourusername.github.io"
   
   author:
     name: Your Name
     email: your.email@example.com
     github: yourgithub
     linkedin: yourlinkedin
   ```

2. Update navigation links in `_layouts/default.html` if needed

### Add Your Projects

1. Create project files in `_projects/`:
   ```bash
   cp _projects/transcripts.md _projects/your-project.md
   ```

2. Edit with your project details:
   ```yaml
   ---
   layout: project
   title: Your Project
   description: Brief description
   date: 2024-01-15
   status: production
   categories: [production, ml]
   tech: [Python, Rust]
   github: https://github.com/you/project
   ---
   ```

### Update About Page

Edit `about.html` with your:
- Background and experience
- Technical skills
- Timeline
- Contact information

## Step 2: Test Locally

```bash
# Install dependencies
bundle install

# Serve locally
bundle exec jekyll serve

# Visit http://localhost:4000
# Test all pages and links
# Check mobile responsiveness (DevTools)
```

## Step 3: Create GitHub Repository

### Option A: Via GitHub Website

1. Go to https://github.com/new
2. Repository name: `yourusername.github.io`
   - **IMPORTANT**: Must match your GitHub username exactly
3. Make it Public
4. Don't initialize with README (you already have one)
5. Click "Create repository"

### Option B: Via GitHub CLI

```bash
gh repo create yourusername.github.io --public --source=. --remote=origin --push
```

## Step 4: Initialize Git Repository

```bash
# Initialize git (if not already)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Jekyll portfolio site"

# Add remote (replace yourusername)
git remote add origin https://github.com/yourusername/yourusername.github.io.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 5: Configure GitHub Pages

### Method 1: Using GitHub Actions (Recommended)

This is already set up! The `.github/workflows/jekyll.yml` file will automatically:
1. Build your site when you push to main
2. Deploy to GitHub Pages

Just enable it:
1. Go to repository Settings > Pages
2. Source: **GitHub Actions**
3. Save

### Method 2: Using Jekyll Native

1. Go to repository Settings > Pages
2. Source: Deploy from a branch
3. Branch: `main` / `(root)`
4. Save

## Step 6: Wait for Deployment

1. Go to Actions tab in your repository
2. Watch the workflow run (1-2 minutes)
3. Once complete, visit: `https://yourusername.github.io`

## Step 7: Verify Deployment

### Check These Items:

- [ ] Homepage loads correctly
- [ ] All navigation links work
- [ ] Projects page displays projects
- [ ] Individual project pages load
- [ ] About page shows your information
- [ ] Blog page exists (even if empty)
- [ ] Mobile view works properly
- [ ] Fonts load correctly
- [ ] Colors match design system

## Troubleshooting

### Site Not Appearing

**Issue**: 404 error on yourusername.github.io

**Solutions**:
1. Verify repository name exactly matches: `yourusername.github.io`
2. Check Settings > Pages is enabled
3. Wait 2-5 minutes after first push
4. Clear browser cache
5. Try incognito/private browsing

### Build Failing

**Issue**: GitHub Actions shows red X

**Solutions**:
1. Check Actions tab for error details
2. Common issues:
   - Invalid YAML in front matter
   - Missing Gemfile
   - Ruby version mismatch
3. Test locally first: `bundle exec jekyll build`
4. Fix errors and push again

### Fonts Not Loading

**Issue**: Site uses system fonts instead of JetBrains Mono/Inter

**Solutions**:
1. Check browser console for errors
2. Verify Google Fonts link in `_layouts/default.html`
3. Check internet connection
4. Wait for CDN propagation (rare)

### CSS Not Applying

**Issue**: Site looks unstyled

**Solutions**:
1. Check `/assets/css/main.css` exists
2. Verify path in `_layouts/default.html`:
   ```html
   <link rel="stylesheet" href="{{ '/assets/css/main.css' | relative_url }}">
   ```
3. Clear browser cache
4. Check browser console for 404 errors

### Navigation Links Broken

**Issue**: Links lead to 404 pages

**Solutions**:
1. Verify files exist at expected paths
2. Check `_config.yml` baseurl setting (should be empty for username.github.io)
3. Use `relative_url` filter in links:
   ```liquid
   <a href="{{ '/projects/' | relative_url }}">Projects</a>
   ```

## Updating Your Site

### Making Changes

```bash
# Make your changes to files
# Test locally
bundle exec jekyll serve

# Commit and push
git add .
git commit -m "Update: describe your changes"
git push origin main
```

GitHub Actions will automatically rebuild and deploy!

### Adding Blog Posts

```bash
# Create new post file
touch _posts/2024-01-15-your-post-title.md

# Add front matter and content
---
layout: post
title: "Your Post Title"
date: 2024-01-15
categories: [tech, tutorial]
---

Your content here...

# Commit and push
git add _posts/
git commit -m "Add new blog post"
git push
```

## Custom Domain (Optional)

### Setup Custom Domain

1. Purchase domain (Namecheap, Google Domains, etc.)

2. Add DNS records:
   ```
   Type: A
   Host: @
   Value: 185.199.108.153
   
   Type: A
   Host: @
   Value: 185.199.109.153
   
   Type: A
   Host: @
   Value: 185.199.110.153
   
   Type: A
   Host: @
   Value: 185.199.111.153
   
   Type: CNAME
   Host: www
   Value: yourusername.github.io
   ```

3. In repository Settings > Pages:
   - Custom domain: yourdomain.com
   - Enforce HTTPS: ✓

4. Wait for DNS propagation (24-48 hours)

## Performance Optimization

### Enable Compression

Already configured in GitHub Pages!

### Optimize Images

```bash
# Install image optimization tools
npm install -g imagemin-cli

# Optimize images
imagemin assets/images/* --out-dir=assets/images
```

### Check Performance

Use these tools:
- [Google PageSpeed Insights](https://pagespeed.web.dev/)
- [GTmetrix](https://gtmetrix.com/)
- Chrome DevTools Lighthouse

Target scores:
- Performance: 90+
- Accessibility: 95+
- Best Practices: 95+
- SEO: 95+

## Security

### Enable Security Features

In repository Settings > Security:
- [x] Dependabot alerts
- [x] Dependabot security updates

### Update Dependencies

```bash
# Update gems periodically
bundle update

# Commit and push updates
git add Gemfile.lock
git commit -m "Update dependencies"
git push
```

## Backup Strategy

### Automatic Backup

GitHub is your backup! Your code is safe.

### Local Backup

```bash
# Clone to another location
git clone https://github.com/yourusername/yourusername.github.io.git backup/

# Or create archive
git archive --format=zip --output=backup.zip main
```

## Analytics (Optional)

### Google Analytics

1. Create GA4 property
2. Get tracking ID
3. Edit `_layouts/default.html`:
   ```html
   <!-- Uncomment and add your ID -->
   <script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
   <script>
     window.dataLayer = window.dataLayer || [];
     function gtag(){dataLayer.push(arguments);}
     gtag('js', new Date());
     gtag('config', 'G-XXXXXXXXXX');
   </script>
   ```

## Maintenance Schedule

### Weekly
- Check for broken links
- Review analytics (if enabled)
- Test site on mobile devices

### Monthly
- Update dependencies: `bundle update`
- Check for security alerts
- Review and update content

### Quarterly
- Review design and UX
- Update project portfolio
- Refresh about page
- Check performance scores

## Getting Help

### Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Jekyll Themes](https://jekyllthemes.io/)

### Community

- [Jekyll Forum](https://talk.jekyllrb.com/)
- [GitHub Community](https://github.community/)
- Stack Overflow: Tag `jekyll` or `github-pages`

## Next Steps

1. ✅ Deploy site
2. ✅ Verify everything works
3. Share your site:
   - Add to LinkedIn profile
   - Update resume
   - Share on social media
4. Start creating content:
   - Add more projects
   - Write technical blog posts
   - Document your work

---

**Congratulations! Your portfolio is live! 🎉**

Visit: `https://yourusername.github.io`
