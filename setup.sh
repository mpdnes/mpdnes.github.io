#!/bin/bash

# Jekyll Portfolio Quick Start Script
# This script helps you set up and test your Jekyll site

set -e

echo "🚀 Jekyll Portfolio Setup"
echo "========================="
echo ""

# Check if Ruby is installed
if ! command -v ruby &> /dev/null; then
    echo "❌ Ruby is not installed"
    echo "   Please install Ruby 2.7+ first:"
    echo "   https://www.ruby-lang.org/en/documentation/installation/"
    exit 1
fi

echo "✅ Ruby version: $(ruby -v)"

# Check if Bundler is installed
if ! command -v bundle &> /dev/null; then
    echo "📦 Installing Bundler..."
    gem install bundler
fi

echo "✅ Bundler installed"

# Install dependencies
echo ""
echo "📦 Installing Jekyll and dependencies..."
bundle install

echo ""
echo "✅ Dependencies installed"
echo ""

# Prompt for user information
echo "📝 Let's customize your site!"
echo ""

read -p "Your name: " USER_NAME
read -p "Your email: " USER_EMAIL
read -p "Your GitHub username: " GITHUB_USER
read -p "Your LinkedIn username (optional): " LINKEDIN_USER

# Update _config.yml
echo ""
echo "📝 Updating configuration..."

sed -i.bak "s/title: Michael Donovan/title: $USER_NAME/" _config.yml
sed -i.bak "s/name: Michael Donovan/name: $USER_NAME/" _config.yml
sed -i.bak "s/email: m.donovan28@gmail.com/email: $USER_EMAIL/" _config.yml
sed -i.bak "s/github: yourusername/github: $GITHUB_USER/" _config.yml
sed -i.bak "s/yourusername.github.io/$GITHUB_USER.github.io/" _config.yml

if [ -n "$LINKEDIN_USER" ]; then
    sed -i.bak "s/linkedin: yourlinkedin/linkedin: $LINKEDIN_USER/" _config.yml
fi

# Clean up backup files
rm _config.yml.bak

echo "✅ Configuration updated"
echo ""

# Test build
echo "🔨 Testing site build..."
bundle exec jekyll build

if [ $? -eq 0 ]; then
    echo "✅ Site builds successfully!"
else
    echo "❌ Build failed. Check errors above."
    exit 1
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "1. Test locally: bundle exec jekyll serve"
echo "2. Visit: http://localhost:4000"
echo "3. Edit content:"
echo "   - Update about.html with your info"
echo "   - Add projects to _projects/"
echo "   - Customize colors in assets/css/main.css"
echo "4. Deploy:"
echo "   - Create GitHub repo: $GITHUB_USER.github.io"
echo "   - Push code: git push origin main"
echo "   - See DEPLOYMENT.md for full instructions"
echo ""
echo "📚 Documentation:"
echo "   - README.md - Overview and features"
echo "   - DEPLOYMENT.md - Detailed deployment guide"
echo ""

# Offer to start server
read -p "Start local server now? (y/n) " START_SERVER

if [ "$START_SERVER" = "y" ] || [ "$START_SERVER" = "Y" ]; then
    echo ""
    echo "🚀 Starting Jekyll server..."
    echo "   Visit http://localhost:4000"
    echo "   Press Ctrl+C to stop"
    echo ""
    bundle exec jekyll serve
fi
