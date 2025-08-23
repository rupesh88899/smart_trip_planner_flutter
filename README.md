# Smart Trip Planner (Flutter + Firebase Gemini AI)

An AI-powered Flutter app that helps travellers plan trips through natural language.
Built with **Flutter, Firebase, Riverpod, Hive, and Gemini AI**.

---

## ✨ Features

- 🗣️ **Chat-based trip creation** using Firebase Gemini AI  
- 🔄 **Refine itineraries** via follow-up messages (diff-style updates)  
- 💾 **Offline support**: Save & revisit trips locally with Hive
- 🗺️ **Maps integration**: Tap activities to open Google/Apple Maps  
- 📊 **Debug overlay** showing tokens per request/response (cost awareness)  
- 🌐 **Web search integration** for live info on hotels, restaurants, POIs (pending)

---


## ⚙️ Setup

### Prerequisites
- sdk: '>=3.0.3 <4.0.0' 
- version: 1.0.0+1
- Firebase project with Gemini AI enabled  
- Android Studio / Xcode / VS Code  
- Firebase project with **Gemini AI enabled**
- Installed tools:  
  - macOS/Linux: `brew install flutter firebase-cli`  
  - Windows: install [Flutter](https://docs.flutter.dev/get-started/install) + [Firebase CLI](https://firebase.google.com/docs/cli)

### Installation
```bash
# Clone repo
git clone https://github.com/rupesh88899/smart_trip_planner_flutter.git
cd smart_trip_planner_flutter

# Install dependencies
flutter pub get

# Configure Firebase
flutterfire configure

# Run app
flutter run
```

### Firebase Setup
- Add `google-services.json` in `android/app/`  
- Add `GoogleService-Info.plist` in `ios/Runner/`  
- For Web/Desktop: enable Firebase web config  

---

## 🏗️ Architecture

```
lib/
 ├── data/           # APIs, local DB (Hive)
 ├── domain/         # Entities, use-cases
 ├── presentation/   # Riverpod state + UI
 ├── services/       # Gemini AI, search, maps
 └── widgets/        # Reusable UI components
```

- **Clean Architecture** → data → domain → presentation  
- **Riverpod 3** for state management  
- **Repository pattern** for persistence


### Architecture Diagram
<img width="1024" height="1536" alt="image" src="https://github.com/user-attachments/assets/1566e57a-a8fb-460f-922c-c92b6bd8c96e" />



- **Data Layer** → APIs, Hive DB (local storage)  
- **Domain Layer** → Core entities (Trip, Itinerary) + business rules  
- **Presentation Layer** → UI (Flutter widgets) + Riverpod state  
- **Services** → Gemini AI agent, search integration, maps  

---

## 🤖 Agent Chain (How It Works)

1. User enters trip prompt in chat (e.g., *“5 days in Kyoto, solo, mid-range budget”*).  
2. Agent (Cloud Function or isolate) sends prompt + previous itinerary JSON + history to Gemini.  
3. Gemini responds with **validated itinerary JSON schema**. 
4. Flutter client renders structured cards & stores locally.  
5. Diff-style updates when user refines plan.  
6. (optional)Web-search tool fetches real-time info (restaurants, hotels, events).  

---

## 📊 Token Cost Metrics

| Action                  | Avg. Tokens Req | Avg. Tokens Resp | Notes                  |
|--------------------------|-----------------|------------------|------------------------|
| New trip (5-day plan)    | ~500            | ~900             | Full itinerary         |
| Small refinement         | ~200            | ~300             | Swap/change activities |
| With web search enabled  | +100            | +200             | Adds fetched context   |


---

## 🧪 Testing

- Unit tests for repositories & Gemini wrapper  
- Widget tests for chat + itinerary view  
- Mock HTTP with `http_mock_adapter`  
- Target: **≥60% coverage**  

Run tests:
```bash
flutter test
```

---

## 🚀 Nice-to-Haves (Optional)

- 🎙️ Voice input + TTS for itineraries(pending)  
- 🌦️ Weather & currency API integration(pending)
- 📍 Pathfinding to reorder POIs by walking distance(pending)  

---

## 🤝 Contributing

1. Fork this repo  
2. Create a feature branch  
3. Commit with clear messages  
4. Push & open a Pull Request  

---

## 📄 License
MIT License  
