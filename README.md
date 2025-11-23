# Crop Yield Prediction System 

## Mission and problem statement
My project **predicts crop yield based on environmental and agricultural inputs.** It solves the **problem of unpredictable harvests** by **using machine learning to deliver accurate yield forecasts.** The system includes a trained regression model, a FastAPI prediction endpoint, and a Flutter mobile app. The **goal is to support data‑driven farming and improve decision‑making.**

## Public API Endpoint (FastAPI-Deployed on Render)
**Base URL:** [https://linear-regression-model-4dyx.onrender.com](https://linear-regression-model-4dyx.onrender.com)
**Swagger UI:** [https://linear-regression-model-4dyx.onrender.com/docs](https://linear-regression-model-4dyx.onrender.com/docs)
**Prediction endpoint** [https://linear-regression-model-4dyx.onrender.com/predict](https://linear-regression-model-4dyx.onrender.com/predict)


The endpoint accepts crop/environment parameters and returns:
```bash
{
    "Predict yield": <float></float>
}
```
## Demo video
Youtube video: [https://youtu.be/276-aBRP6yE](https://youtu.be/276-aBRP6yE) 

## How to run the mobile app
1. Clone the repository
```bash
git clone https://github.com/Muen1/linear_regression_model.git
```
2. Get Dependencies
Run inside the /summative/FlutterApp folder:
```bash
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

## How to run the API locally
1. Create a virtual environment
```bash
python -m venv venv
source venv/bin/activate   # macOS/Linux
venv\Scripts\activate      # Windows
```
2. Start the FastAPI server 
Inside /summative/API
```bash
python -m uvicorn prediction:app --host 0.0.0.0 --port 8000 --reload
```
3. open swagger UI
```arduino
https://linear-regression-model-4dyx.onrender.com/docs
```

## requirements.txt
```nginx
fastapi
uvicorn
scikit-learn
pydantic
numpy
joblib
pandas
python-multipart
```

## Models Used
The notebook trains 3 models:
* Linear regression
* Decision tree regressor
* Random forest regressor 