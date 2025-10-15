# 🔍 Visual Product Matcher

> An AI-powered visual search platform that helps users discover similar products through intelligent image analysis using Google's Gemini 2.0 Flash vision model.

[![Python](https://img.shields.io/badge/Python-3.9+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-3.1.2-000000?style=for-the-badge&logo=flask&logoColor=white)](https://flask.palletsprojects.com/)
[![Gemini AI](https://img.shields.io/badge/Gemini-2.0%20Flash-4285F4?style=for-the-badge&logo=google&logoColor=white)](https://ai.google.dev/)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

---

## 📖 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Demo](#-demo)
- [Technology Stack](#-technology-stack)
- [Quick Start](#-quick-start)
- [Installation](#-installation)
- [Configuration](#-configuration)
- [Usage](#-usage)
- [API](#-api)
- [Deployment](#-deployment)
- [Project Structure](#-project-structure)
- [How It Works](#-how-it-works)
- [Contributing](#-contributing)
- [Testing](#-testing)
- [Support](#-support)
- [Project Stats](#-project-stats)
- [Acknowledgments](#-acknowledgments)
- [License](#-license)

---

## 🎯 Overview

Visual Product Matcher is a production-ready web application that leverages advanced AI vision models to perform visual similarity searches across a product catalog. Users can upload images or provide URLs, and the system intelligently analyzes visual features to return ranked similar products with confidence scores.

Key capabilities:
- 🖼️ Multi-source input: upload files or provide image URLs
- 🤖 AI vision analysis: Google Gemini 2.0 Flash Experimental
- 🎯 Smart matching: semantic similarity with category-aware boosting
- 📊 Real-time results: ranked results with similarity percentages
- 🎨 Responsive UI: accessible, mobile-first, theme toggle
- 🔒 Production-ready: error handling, validation, health checks

---

## ✨ Features

- Dual upload: drag-and-drop file upload and image URL input
- AI-powered visual analysis with structured attributes
- Filters: by category and similarity threshold
- Product DB: 65 curated items across 6 categories
- Accessibility: ARIA roles, keyboard navigation, focus-visible
- Performance: lazy-loaded images, reduced motion, caching
- CI: validation script for products, linters, secret scan

---

## 🧱 Technology Stack

- Backend: Python 3.9+, Flask 3.1.2, Flask-Cors 4.0.0
- AI: google-generativeai 0.8.3 (Gemini 2.0 Flash)
- Imaging: Pillow 11.3.0
- HTTP/Networking: requests 2.32.x
- Frontend: HTML5, CSS3 (Grid/Flexbox), Vanilla JavaScript
- Deployment: Gunicorn, Procfile/runtime.txt (Heroku/Render compatible)
- CI: GitHub Actions (product validator + linting)

---

## 🚀 Demo

Run locally then open http://localhost:5000

Demo video: [Watch on Google Drive](https://drive.google.com/file/d/1NMxgkngfhFAvjE3W319q_ecPjdBGqK9d/view?usp=sharing)

Workflow:
1) Upload an image or paste a URL
2) AI extracts visual features
3) Similar products are ranked
4) Use filters (category/threshold)
5) Explore details and images

---

## ⚡ Quick Start

Windows PowerShell (copy-paste):

```powershell
# 1) Clone and enter folder
git clone https://github.com/priyanshusingh017/Visual_Product_Matcher.git; cd Visual_Product_Matcher

# 2) Create & activate venv
python -m venv .venv; .\.venv\Scripts\Activate.ps1

# 3) Install dependencies
pip install -r requirements.txt

# 4) Configure API key
Copy-Item .env.example .env; notepad .env  # add GEMINI_API_KEY=<your_key>

# 5) Run the app
python app.py
```

Then open http://localhost:5000

Mac/Linux (copy-paste):

```bash
# 1) Clone and enter folder
git clone https://github.com/priyanshusingh017/Visual_Product_Matcher.git
cd Visual_Product_Matcher

# 2) Create & activate venv
python3 -m venv .venv
source .venv/bin/activate

# 3) Install dependencies
pip3 install -r requirements.txt

# 4) Configure API key
cp .env.example .env
nano .env  # add GEMINI_API_KEY=<your_key>

# 5) Run the app
python3 app.py
```

Then open http://localhost:5000

---

## 🛠 Installation

Prerequisites:
- Python 3.9+
- Git
- Gemini API Key (https://makersuite.google.com/app/apikey)

Steps (Windows PowerShell):
1) Clone repo
  git clone https://github.com/priyanshusingh017/Visual_Product_Matcher.git; cd Visual_Product_Matcher
2) Create venv and activate
   python -m venv .venv; .\.venv\Scripts\Activate.ps1
3) Install dependencies
   pip install -r requirements.txt
4) Configure environment
   Copy .env.example to .env and set GEMINI_API_KEY
5) Validate products
   python validate_products.py  # expects success
6) Start the app
   python app.py  # visit http://localhost:5000

Dependencies (from requirements.txt):
- Flask 3.1.2
- Flask-Cors 4.0.0
- google-generativeai 0.8.3
- Pillow 11.3.0
- gunicorn 21.2.0
- python-dotenv 1.0.1
- requests 2.32.3

---

## ⚙️ Configuration

Environment variables:
- GEMINI_API_KEY (required)
- PORT (optional, default 5000)

App settings (in app.py):
- MAX_CONTENT_LENGTH: 16MB
- UPLOAD_FOLDER: ./uploads
- ALLOWED_EXTENSIONS: png, jpg, jpeg, gif, webp

---

## 💻 Usage

Web:
- Open http://localhost:5000
- Upload a file, or switch tab and paste an image URL
- Results show similarity percent; filter by category/threshold

Supported images: PNG/JPG/JPEG/GIF/WEBP, up to 16MB.

---

## 📡 API

**Base URL:** `http://localhost:5000/api`

### Endpoints

#### 1. Health Check
```http
GET /api/health
```

**Response (200 OK):**
```json
{
  "status": "healthy",
  "products_count": 65,
  "gemini_configured": true
}
```

---

#### 2. Image Search
```http
POST /api/search
```

**Request Options:**

**Option A: File Upload**
```bash
curl -X POST -F "image=@photo.jpg" http://localhost:5000/api/search
```

**Option B: Image URL**
```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"image_url":"https://example.com/image.jpg"}' \
  http://localhost:5000/api/search
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "analysis": {
    "summary": "A pair of black wireless headphones on a yellow background",
    "category": "Electronics",
    "colors": ["black", "yellow"],
    "materials": ["plastic", "metal", "foam"],
    "style": ["minimalist", "modern"],
    "objects": ["headphones"],
    "suggested_tags": ["headphones", "audio", "music", "wireless"]
  },
  "results": [
    {
      "product": {
        "id": 1,
        "name": "Sony WH-1000XM5",
        "category": "Electronics",
        "price": 399.00,
        "image_url": "https://...",
        "description": "Industry-leading noise cancelling headphones"
      },
      "similarity": 0.8542
    }
  ],
  "total_results": 20
}
```

**Error Response (400/500):**
```json
{
  "error": "Error message describing what went wrong"
}
```

---

#### 3. Get Products
```http
GET /api/products?category=Electronics
```

**Query Parameters:**
- `category` (optional): Filter by category name

**Response (200 OK):**
```json
{
  "products": [
    {
      "id": 1,
      "name": "Sony WH-1000XM5",
      "category": "Electronics",
      "price": 399.00,
      "image_url": "https://...",
      "description": "Industry-leading noise cancelling headphones"
    }
  ],
  "count": 65
}
```

---

#### 4. Get Categories
```http
GET /api/categories
```

**Response (200 OK):**
```json
{
  "categories": [
    "Accessories",
    "Clothing",
    "Electronics",
    "Footwear",
    "Furniture",
    "Home"
  ]
}
```

---

## 🌐 Deployment

### Option 1: Render (Recommended - Free Tier)

**Steps:**
1. Sign up at [render.com](https://render.com)
2. Click **"New +"** → **"Web Service"**
3. Connect your GitHub repository
4. Configure:
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `gunicorn app:app`
5. Add environment variable:
   - **Key:** `GEMINI_API_KEY`
   - **Value:** Your Gemini API key
6. Click **"Create Web Service"**
7. Wait 3-5 minutes for deployment

**Your URL:** `https://visual-product-matcher.onrender.com`

**Free Tier Notes:**
- ⚠️ Service spins down after 15 min of inactivity
- ⚠️ Cold starts take 30-60 seconds
- ✅ 750 hours/month free
- ✅ Automatic HTTPS

---

### Option 2: Railway (Free Tier)

**Steps:**
1. Sign up at [railway.app](https://railway.app)
2. Click **"New Project"** → **"Deploy from GitHub repo"**
3. Select your repository
4. Add environment variable:
   - **Variable:** `GEMINI_API_KEY`
   - **Value:** Your API key
5. Railway auto-detects Python and deploys
6. Generate domain in Settings

**Your URL:** `https://visual-product-matcher-production.up.railway.app`

**Free Tier Notes:**
- ⚠️ $5 credit per month (~500 hours)
- ✅ No sleep/spin-down
- ✅ Fast deployments

---

### Option 3: Heroku (Requires Credit Card)

**Steps:**
1. Install Heroku CLI:
   ```powershell
   winget install Heroku.HerokuCLI
   ```

2. Login and create app:
   ```bash
   heroku login
  cd path\to\Visual_Product_Matcher
   heroku create visual-product-matcher
   ```

3. Set environment variable:
   ```bash
   heroku config:set GEMINI_API_KEY=your_api_key
   ```

4. Deploy:
   ```bash
   git push heroku main
   ```

5. Open app:
   ```bash
   heroku open
   ```

**Your URL:** `https://visual-product-matcher.herokuapp.com`

---

### Post-Deployment Checklist

After deploying, verify:

- [ ] Homepage loads without errors
- [ ] File upload works
- [ ] URL input works
- [ ] Results display correctly
- [ ] Filters work (category & similarity)
- [ ] Mobile responsive
- [ ] `/api/health` returns healthy status
- [ ] `/api/products` lists all products
- [ ] No console errors in browser DevTools

**Troubleshooting:**
- **500 Error:** Check logs for missing `GEMINI_API_KEY`
- **Slow Response:** Gemini API takes 2-5 seconds (normal)
- **Images Not Loading:** Check CORS and image URL accessibility

---

## 📂 Project Structure

```
Visual_Product_Matcher/
│
├── 📄 Core Application
│   ├── app.py                    # Flask API server (594 lines)
│   ├── products.json             # Product database (65 items)
│   ├── validate_products.py      # Database validator
│   └── requirements.txt          # Python dependencies (8 packages)
│
├── 🎨 Frontend (Static Files)
│   └── static/
│       ├── index.html            # UI structure (106 lines)
│       ├── styles.css            # Styling & responsive design (570 lines)
│       └── script.js             # Client logic & API calls (500+ lines)
│
├── ⚙️ Configuration
│   ├── .env                      # Environment variables (git-ignored)
│   ├── .env.example              # Environment template
│   ├── .gitignore                # Git ignore rules
│   ├── runtime.txt               # Python version (3.9)
│   └── Procfile                  # Deployment config (Heroku/Render)
│
├── 📁 Storage
│   └── uploads/                  # Temporary image uploads
│       └── .gitkeep
│
├── 🔄 CI/CD
│   └── .github/
│       └── workflows/
│           └── ci.yml            # GitHub Actions pipeline
│
└── 📖 Documentation
  └── README.md                 # This file (comprehensive guide)
```

**Key Files Explained:**

- **app.py**: Flask REST API with 5 endpoints, Gemini AI integration, similarity algorithm
- **products.json**: 65 curated products across 6 categories with metadata
- **static/script.js**: Handles uploads, API calls, rendering, filters, and UI state
- **static/styles.css**: Responsive design with CSS Grid, Flexbox, theme toggle
- **validate_products.py**: Ensures product data integrity (used in CI)
- **.env**: Stores `GEMINI_API_KEY` (never commit this file!)
- **Procfile**: Tells deployment platforms how to start the app (`gunicorn app:app`)

---

## 🎯 How It Works

### System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                      User Browser                            │
│  ┌────────────┐  ┌────────────┐  ┌──────────────┐          │
│  │ index.html │──│ styles.css │  │  script.js   │          │
│  │   (UI)     │  │ (Design)   │  │   (Logic)    │          │
│  └────────────┘  └────────────┘  └──────┬───────┘          │
└─────────────────────────────────────────┼──────────────────┘
                                           │ HTTP/JSON
                                           ▼
┌─────────────────────────────────────────────────────────────┐
│                   Flask Server (app.py)                      │
│  ┌──────────────┐  ┌──────────────┐  ┌─────────────────┐  │
│  │   Routes     │──│   Business   │──│  Product Cache  │  │
│  │  /api/search │  │    Logic     │  │   (in-memory)   │  │
│  └──────────────┘  └──────┬───────┘  └─────────────────┘  │
└────────────────────────────┼────────────────────────────────┘
                             │
                             ▼
                  ┌──────────────────────┐
                  │  Google Gemini API   │
                  │  (Vision Analysis)   │
                  └──────────────────────┘
```

### Request Flow

**Step 1: User uploads image**
- Frontend validates file type/size
- Creates preview

**Step 2: Send to backend**
- POST to `/api/search` with image file or URL
- Flask receives and validates

**Step 3: AI Analysis**
- Image sent to Gemini 2.0 Flash
- Returns structured analysis:
  - Summary (description)
  - Category (Electronics, Clothing, etc.)
  - Colors, Materials, Style
  - Objects detected
  - Suggested tags

**Step 4: Build Query Embedding**
- Concatenate analysis fields into search text
- Example: "wireless headphones black yellow plastic metal minimalist modern audio music"

**Step 5: Calculate Similarity**
- For each product in catalog:
  - Get product embedding (name + category + description)
  - Calculate Jaccard similarity: `|intersection| / |union|`
  - Apply category boost if categories match (+30%)
  - Cap score at 1.0

**Step 6: Rank & Return**
- Sort by similarity score (highest first)
- Return top 20 matches
- Include analysis object for frontend

**Step 7: Frontend Display**
- Parse analysis and render professional prose
- Display chips for colors, materials, style, etc.
- Show product grid with similarity scores
- Enable filters

---

### Similarity Algorithm

**Formula:**
```python
# Base similarity (Jaccard coefficient)
base_score = len(query_words ∩ product_words) / len(query_words ∪ product_words)

# Category boost
if same_category:
    score = base_score * 1.3
else:
    score = base_score

# Cap at 1.0
final_score = min(score, 1.0)
```

**Example:**
```
Query: "blue running shoes with white sole"
Product: "athletic footwear in blue and white colors"

Intersection: {blue, white}
Union: {blue, running, shoes, with, white, sole, athletic, footwear, in, and, colors}

Base: 2/11 ≈ 0.18
Category match: 0.18 * 1.3 ≈ 0.23
```

**Why This Works:**
- Semantic matching via natural language
- Category-aware for better results
- No ML training required
- Fast (O(n) where n = product count)

---

### Performance Considerations

**Bottlenecks:**
- Gemini API: 2-5 seconds per request
- Similarity calculation: ~1ms for 65 products

**Optimizations:**
- Product embeddings cached in memory
- Lazy-loaded images in UI
- Client-side filtering (no re-fetch)

**Scalability:**
- Current: handles 65 products easily
- Future: use vector DB (Pinecone/Weaviate) for 1000+ products

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

### Getting Started

1. **Fork the repository**
2. **Create a feature branch:**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**
4. **Test thoroughly:**
   ```bash
   python validate_products.py
   python app.py  # Manual testing
   ```
5. **Commit with clear messages:**
   ```bash
   git commit -m "Add: feature description"
   ```
6. **Push and create a Pull Request**

### Guidelines

- Follow existing code style and conventions
- Add comments for complex logic
- Update documentation if needed
- Test on multiple browsers (Chrome, Firefox, Safari, Edge)
- Ensure mobile responsiveness
- Run the product validator before committing

### Ideas for Contributions

**Features:**
- [ ] User authentication and favorites
- [ ] Price comparison across products
- [ ] Advanced filtering (price range, brand)
- [ ] Image compression before upload
- [ ] Batch image search
- [ ] Export results to CSV/JSON
- [ ] Product recommendations

**Improvements:**
- [ ] Better similarity algorithm (embeddings)
- [ ] Redis caching for API responses
- [ ] Database migration (SQLite/PostgreSQL)
- [ ] UI/UX enhancements
- [ ] Dark mode improvements
- [ ] Accessibility audit

**Documentation:**
- [ ] Video tutorial
- [ ] Architecture diagrams
- [ ] More usage examples
- [ ] API client libraries (Python, JS)

### Bug Reports

When reporting bugs, include:
- Description of the issue
- Steps to reproduce
- Expected vs actual behavior
- Screenshots (if applicable)
- Browser/OS information
- Console errors (if any)

### Questions?

Open an issue with the "question" label or reach out via email.

---

## 🧪 Testing

### Automated Testing

**Validate Product Database:**
```bash
python validate_products.py
```

Expected output:
```
✅ Products database is valid!
Total products: 65
Categories: 6
```

**Health Check:**
```bash
curl http://localhost:5000/api/health
```

Expected response:
```json
{
  "status": "healthy",
  "products_count": 65,
  "gemini_configured": true
}
```

---

### Manual Testing Checklist

#### ✅ Image Upload
- [ ] Drag and drop image works
- [ ] Click to upload works
- [ ] Preview displays correctly
- [ ] PNG, JPG, JPEG, GIF, WEBP all work
- [ ] File size limit enforced (16MB)
- [ ] Invalid file types rejected with error

#### ✅ URL Input
- [ ] Tab switching works
- [ ] Valid image URL loads and searches
- [ ] Invalid URL shows error
- [ ] Non-image URL rejected
- [ ] Sample URLs work:
  ```
  https://images.unsplash.com/photo-1542291026-7eec264c27ff
  https://images.unsplash.com/photo-1511707171634-5f897ff02aa9
  ```

#### ✅ Search Results
- [ ] Loading spinner appears during search
- [ ] Results display within 5 seconds
- [ ] Similarity scores show (0-100%)
- [ ] Products sorted by similarity (high to low)
- [ ] Product cards show: image, name, category, price, description
- [ ] Product images lazy-load
- [ ] Clicking product opens image in new tab

#### ✅ Filters
- [ ] Category dropdown populates with all categories
- [ ] Category filter updates results instantly
- [ ] Similarity slider adjusts threshold
- [ ] Percentage updates as slider moves
- [ ] "No results" message when filters too strict
- [ ] Filters work together (category + similarity)

#### ✅ Image Analysis Display
- [ ] Professional prose paragraph displays
- [ ] Category pill shows (not raw JSON)
- [ ] Colors, Materials, Style chips render
- [ ] Objects and Tags chips display
- [ ] No code fences (```json) visible
- [ ] Analysis updates with each search

#### ✅ UI/UX
- [ ] Clear button resets everything
- [ ] Tab switching clears previous upload
- [ ] Error messages are user-friendly
- [ ] Error messages can be dismissed
- [ ] Theme toggle works (dark/light)
- [ ] Theme preference persists (localStorage)

#### ✅ Responsive Design
- [ ] Desktop (1920x1080): 4+ column grid
- [ ] Tablet (768x1024): 2-3 column grid
- [ ] Mobile (375x667): single column
- [ ] No horizontal scrolling
- [ ] Touch targets adequate (44x44px minimum)
- [ ] Text readable at all sizes

#### ✅ Accessibility
- [ ] Keyboard navigation works (Tab, Enter, Space)
- [ ] Focus-visible styles show
- [ ] ARIA roles present
- [ ] Screen reader announces loading/results
- [ ] Alt text on images
- [ ] Color contrast passes WCAG AA

#### ✅ Browser Compatibility
- [ ] Chrome (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Edge (latest)
- [ ] Mobile Safari (iOS)
- [ ] Chrome Mobile (Android)

#### ✅ Performance
- [ ] Page loads in < 2 seconds
- [ ] Search completes in 2-5 seconds
- [ ] No console errors
- [ ] No memory leaks after multiple searches
- [ ] Images load progressively

#### ✅ Error Handling
- [ ] Missing API key: graceful fallback
- [ ] Network error: clear message
- [ ] Invalid image: specific error
- [ ] Server error: user-friendly message
- [ ] Timeout: recoverable state

---

### API Testing with cURL

**Test Search (File):**
```bash
curl -X POST -F "image=@test.jpg" http://localhost:5000/api/search
```

**Test Search (URL):**
```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"image_url":"https://images.unsplash.com/photo-1542291026-7eec264c27ff"}' \
  http://localhost:5000/api/search
```

**Test Get Products:**
```bash
curl http://localhost:5000/api/products
```

**Test Get Categories:**
```bash
curl http://localhost:5000/api/categories
```

---

### Testing with Postman

1. Import these requests:
   - **GET** `http://localhost:5000/api/health`
   - **GET** `http://localhost:5000/api/products`
   - **GET** `http://localhost:5000/api/categories`
   - **POST** `http://localhost:5000/api/search`
     - Body: form-data, key: `image`, type: File

2. Save as collection for regression testing

---

### Performance Testing

**Measure Response Times:**
```bash
# Health check (should be < 100ms)
time curl http://localhost:5000/api/health

# Product list (should be < 200ms)
time curl http://localhost:5000/api/products

# Search (should be 2-5 seconds due to Gemini API)
time curl -X POST -F "image=@test.jpg" http://localhost:5000/api/search
```

**Expected Benchmarks:**
- Health Check: < 100ms
- Get Products: < 200ms
- Search: 2-5 seconds (Gemini API call)
- Page Load: < 2 seconds
- Time to Interactive: < 3 seconds

---

### Edge Cases to Test

- [ ] Empty file upload
- [ ] Corrupted image file
- [ ] Extremely large image (> 16MB)
- [ ] Extremely small image (1x1 pixel)
- [ ] Image with no recognizable objects
- [ ] Duplicate successive searches
- [ ] Rapid filter changes
- [ ] Search with Gemini API offline
- [ ] Search with invalid API key

---

## 💬 Support

Need help? Here's how to get support:

- 📧 **Email:** singhpriyanshu661930@gmail.com
- 🐛 **Bug Reports:** Open an issue on GitHub
- 💡 **Feature Requests:** Open an issue with "enhancement" label
- ❓ **Questions:** Open an issue with "question" label

---

## 📊 Project Stats

- **Lines of Code:** ~1,500 (Python + JavaScript + CSS)
- **Products:** 65 curated items
- **Categories:** 6 (Accessories, Clothing, Electronics, Footwear, Furniture, Home)
- **API Endpoints:** 5 RESTful routes
- **Dependencies:** 8 Python packages
- **AI Model:** Google Gemini 2.0 Flash Experimental
- **Response Time:** 2-5 seconds (AI analysis)
- **Deployment:** Production-ready (Render/Railway/Heroku)

---

## 🙏 Acknowledgments

- **Google Gemini AI:** For powerful vision analysis
- **Flask:** For elegant Python web framework
- **Unsplash:** For high-quality product images
- **Community:** For feedback and contributions

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">

**Made with ❤️ using Flask and Gemini AI**

⭐ Star this repo if you found it helpful!

</div>