# Khyber — KPK City Services Super App

A full-stack super app for Khyber Pakhtunkhwa, Pakistan. Built with Flutter (mobile + desktop) and a Node.js/Express REST API backend.

---

## Modules

| Category | Modules |
|---|---|
| **Daily Services** | Food, Grocery, Shopping, Pharmacy, Water & Gas |
| **Transport & Logistics** | Transport, Courier, Logistics |
| **Health** | Hospitals, Home Nursing, Emergency |
| **Accommodation** | Hotels, Real Estate |
| **Commerce** | Businesses, Jobs, Crafts & Artisans |
| **Lifestyle** | Tourism, Parks, Amusement, Events, News |
| **Civic** | Government Services, Education, Support |
| **Platform** | Home, Auth, Admin, Wallet, Notifications, Profile |

---

## Tech Stack

### Mobile (`khyber_mobile/`)
- **Flutter 3.x** — Android, iOS, Web, Desktop (responsive up to 1100px+)
- **GetX** — state management, navigation, dependency injection
- **Dio** — HTTP client with JWT interceptor
- **Hive + GetStorage** — local caching
- **flutter_map** — OpenStreetMap integration
- **google_fonts** (Poppins), shimmer, lottie, carousel_slider

### Backend (`khyber_backend/`)
- **Node.js + Express**
- **MongoDB + Mongoose**
- **JWT** authentication (access + refresh tokens)
- **Socket.IO** — real-time order/delivery tracking
- **Helmet, CORS, express-rate-limit** — security hardening
- **Winston** — structured logging
- **Multer** — file/image uploads
- **Nodemailer** — email notifications

---

## Project Structure

```
khyber/
├── khyber_mobile/
│   ├── lib/
│   │   ├── core/
│   │   │   ├── theme/          # AppColors, AppTheme
│   │   │   ├── widgets/        # Shared widgets
│   │   │   └── bindings/       # GetX bindings
│   │   ├── data/
│   │   │   ├── providers/      # ApiClient (Dio)
│   │   │   └── models/         # Data models
│   │   └── modules/            # One folder per module
│   │       └── <module>/
│   │           ├── controllers/
│   │           ├── views/
│   │           └── bindings/
│   └── pubspec.yaml
│
└── khyber_backend/
    ├── server.js
    └── src/
        ├── controllers/
        ├── routes/
        ├── models/
        ├── middleware/
        └── services/
```

---

## Getting Started

### Prerequisites
- Flutter SDK >= 3.1.0
- Node.js >= 18
- MongoDB (local or Atlas)

### Backend

```bash
cd khyber_backend
npm install
cp .env.example .env      # fill in MONGO_URI, JWT_SECRET, etc.
npm run dev               # nodemon on port 5000
```

### Mobile

```bash
cd khyber_mobile
flutter pub get
flutter run               # connect a device or emulator
```

For desktop (Windows/macOS/Linux):

```bash
flutter run -d windows
```

### Environment Variables (backend)

| Key | Description |
|---|---|
| `MONGO_URI` | MongoDB connection string |
| `JWT_SECRET` | JWT signing secret |
| `JWT_EXPIRES_IN` | Token expiry (e.g. `7d`) |
| `PORT` | Server port (default `5000`) |
| `NODE_ENV` | `development` or `production` |

---

## Design System

All modules share a single design language:

- **Primary color**: Terracotta `#C0392B` / Slate `#2C3E50`
- **Font**: Poppins (via google_fonts)
- **Pattern**: `SliverAppBar` with gradient header -> filter chips -> responsive grid/list
- **Responsive breakpoints**: 1-col < 600px, 2-col < 900px, 3-col < 1100px, 4-col >= 1100px (product grids); 1-col < 800px, 2-col >= 800px (card lists)
- **Max content width**: 1100px centered on very wide screens

---

## License

Private — all rights reserved.
