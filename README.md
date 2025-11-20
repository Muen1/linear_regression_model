# Crop Yield Prediction System 

## Mission and problem statement
My project **predicts crop yield based on environmental and agricultural inputs.** It solves the **problem of unpredictable harvests** by **using machine learning to deliver accurate yield forecasts.** The system includes a trained regression model, a FastAPI prediction endpoint, and a Flutter mobile app. The **goal is to support data‑driven farming and improve decision‑making.**

## Public API Endpoint (FastAPI-Deployed on Render)
**Base URL:** [https://your-api.onrender.com](https://your-api.onrender.com)
**Swagger UI:**
The endpoint accepts crop/environment parameters and returns:
```bash
{
    "Predict yield": <float></float>
}
```
## Demo video
Youtube video: 

## Mobile App (Flutter)-How to run
1. Clone the repository
```bash
git clone https://github.com/Muen1/linear_regression_model.git
```
2. Install Dependencies
```
flutter pub get
```
3. Set the API endpoint
Edit the *lib/api-constants.dart*
```bash
class ApiConstants {
static const String PREDICT_URL = "https://YOUR_PUBLIC_API_URL.onrender.com/predict";
}
```
4. Run the Mobile App
```bash
flutter run
```
5.How to use 
* Fill the form with crop/environment details.
* Tap Predict Yield.
* The app sends a POST request to the Render API.
* Predicted yield displays instantly.
