# Michael Donovan - Jekyll Portfolio Site

A distinctive, high-performance Jekyll-based GitHub Pages website showcasing technical expertise in AI/ML, systems programming, and accessibility technology.

## Features

- **Industrial Design System**: Dark theme with performance-red accents and monospace typography
- **Project Portfolio**: Filterable showcase of production systems and research projects
- **Responsive Layout**: Mobile-first design that works on all devices
- **Fast Performance**: Optimized CSS, minimal JavaScript, excellent Core Web Vitals
- **SEO Optimized**: Built-in sitemap, meta tags, and OpenGraph support
- **Zero Dependencies**: Pure CSS animations, no external frameworks required

## Tech Stack

- **Jekyll 4.3**: Static site generator
- **Liquid Templates**: Dynamic content rendering
- **CSS Variables**: Maintainable design system
- **Google Fonts**: JetBrains Mono + Inter
- **GitHub Pages**: Free hosting with automatic deployment

## Quick Start

### Prerequisites

- Ruby 2.7+ and RubyGems
- Jekyll 4.3+
- Git

### Local Development

```bash
# Clone repository
git clone https://github.com/yourusername/yourusername.github.io.git
cd yourusername.github.io

# Install dependencies
bundle install

# Serve locally
bundle exec jekyll serve

# View at http://localhost:4000
```

### Deployment to GitHub Pages

1. **Create GitHub Repository**
   ```bash
   # Repository must be named: yourusername.github.io
   ```

2. **Enable GitHub Pages**
   - Go to repository Settings > Pages
   - Source: Deploy from a branch
   - Branch: main / (root)
   - Save

3. **Push Your Code**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

4. **Site will be live at**: `https://yourusername.github.io`

## Configuration

### Update Site Information

Edit `_config.yml`:

```yaml
title: Your Name
subtitle: Your Title/Tagline
description: Your description

author:
  name: Your Name
  email: your.email@example.com
  location: Your Location
  github: yourgithub
  linkedin: yourlinkedin

url: "https://yourusername.github.io"
```

### Customize Colors

Edit `/assets/css/main.css` CSS variables:

```css
:root {
  /* Change accent color */
  --color-accent: #ff3366;  /* Performance Red */
  
  /* Or use your own color scheme */
  --color-accent: #00d4aa;  /* Teal */
  --color-accent: #ff8833;  /* Orange */
}
```

### Add Your Projects

Create files in `_projects/` directory:

```markdown
---
layout: project
title: Project Name
description: Brief description
date: 2024-01-15
status: production  # or: active, research
categories: [production, ml]  # for filtering
tech: [Python, Rust, FastAPI]
github: https://github.com/you/project
demo: https://demo-url.com  # optional
metrics:
  - value: "10K+"
    label: "Lines of Code"
---

## Your Project Content

Write your project documentation here in Markdown.
```

## Directory Structure

```
.
├── _config.yml           # Jekyll configuration
├── _layouts/             # Page templates
│   ├── default.html      # Base layout
│   ├── project.html      # Project detail layout
│   └── post.html         # Blog post layout
├── _projects/            # Project collection
│   └── your-project.md
├── assets/
│   └── css/
│       └── main.css      # Main stylesheet
├── index.html            # Homepage
├── projects/
│   └── index.html        # Projects index
├── about.html            # About page
├── blog/                 # Blog posts (optional)
└── Gemfile               # Ruby dependencies
```

## Customization Guide

### Adding New Pages

1. Create HTML file in root: `contact.html`
2. Add front matter:
   ```yaml
   ---
   layout: default
   title: Contact
   ---
   ```
3. Add to navigation in `_layouts/default.html`

### Custom Sections

Add new sections to homepage (`index.html`):

```html
<section id="custom-section">
  <h2>Your Section Title</h2>
  <!-- Your content -->
</section>
```

### Blog Posts

Create posts in `_posts/` directory:

```markdown
---
layout: post
title: "Your Post Title"
date: 2024-01-15
categories: [tech, tutorial]
---

Your post content...
```

## Performance Optimization

- **CSS**: Single stylesheet, no preprocessors
- **Fonts**: Preconnect to Google Fonts
- **Images**: Use WebP format, lazy loading
- **JavaScript**: Minimal, inline when possible
- **Caching**: Leverage GitHub Pages CDN

## Browser Support

- Chrome/Edge (last 2 versions)
- Firefox (last 2 versions)
- Safari (last 2 versions)
- Mobile Safari
- Chrome Mobile

## Troubleshooting

### Build Errors

```bash
# Clear Jekyll cache
bundle exec jekyll clean

# Rebuild
bundle exec jekyll build
```

### Dependency Issues

```bash
# Update gems
bundle update

# Or reinstall
rm Gemfile.lock
bundle install
```

### GitHub Pages Not Updating

1. Check repository Settings > Pages
2. Verify branch is set correctly
3. Wait 1-2 minutes for build
4. Check Actions tab for build logs

## Design Philosophy

This site follows these principles:

- **Performance First**: Fast loading, optimized assets
- **Distinctive Design**: Avoid generic AI aesthetics
- **Technical Precision**: Monospace fonts, clean spacing
- **Accessibility**: Semantic HTML, proper contrast
- **Mobile-First**: Responsive, touch-friendly

## Typography

- **Display/Headings**: JetBrains Mono (monospace)
- **Body Text**: Inter (sans-serif)
- **Code**: JetBrains Mono

## Color System

- **Background**: Dark navy (#0a0e14)
- **Surface**: Elevated dark (#1a2332)
- **Accent**: Performance red (#ff3366)
- **Text**: Off-white (#e6edf3)
- **Muted**: Gray-blue (#8b949e)

## Animation System

- **Fast**: 150ms (hover states)
- **Base**: 250ms (transitions)
- **Slow**: 400ms (page elements)
- **Easing**: cubic-bezier(0.4, 0, 0.2, 1)

## License

MIT License - feel free to use this template for your own portfolio.

## Credits

Built with:
- [Jekyll](https://jekyllrb.com/)
- [GitHub Pages](https://pages.github.com/)
- [Google Fonts](https://fonts.google.com/)

Design inspired by developer tooling aesthetics and terminal interfaces.

## Contact

- Email: m.donovan28@gmail.com
- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [yourlinkedin](https://linkedin.com/in/yourlinkedin)

---

**Note**: Remember to update all placeholder content (URLs, names, links) before deploying.
