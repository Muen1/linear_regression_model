# prediction.py
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from fastapi.middleware.cors import CORSMiddleware
import numpy as np
import joblib
import os

app = FastAPI(title="Crop Yield Predictor")

# --- CORS (allow from anywhere for now; tighten in production if needed) ---
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Load model
MODEL_PATH = os.path.join(os.path.dirname(__file__), "best_model.pkl")
model = joblib.load(MODEL_PATH)

EXPECTED_FEATURES = [
    "Rainfall_mm",
    "Temperature_Celsius",
    "Fertilizer_Used",
    "Irrigation_Used",
    "Days_to_Harvest",
    "Region_North",
    "Region_South",
    "Region_West",
    "Soil_Type_Clay",
    "Soil_Type_Loam",
    "Soil_Type_Peaty",
    "Soil_Type_Sandy",
    "Soil_Type_Silt",
    "Crop_Cotton",
    "Crop_Maize",
    "Crop_Rice",
    "Crop_Soybean",
    "Crop_Wheat",
    "Weather_Condition_Rainy",
    "Weather_Condition_Sunny"
]

# --- Pydantic model with constraints (adjust ranges if needed) ---
class CropInput(BaseModel):
    Rainfall_mm: float = Field(..., ge=0, le=500)              # mm
    Temperature_Celsius: float = Field(..., ge=-10, le=60)     # °C
    Fertilizer_Used: float = Field(..., ge=0, le=10000)       # unit depends on dataset
    Irrigation_Used: int = Field(..., ge=0, le=1)             # 0/1 indicator
    Days_to_Harvest: float = Field(..., ge=1, le=365)
    Region_North: int = Field(..., ge=0, le=1)
    Region_South: int = Field(..., ge=0, le=1)
    Region_West: int = Field(..., ge=0, le=1)
    Soil_Type_Clay: int = Field(..., ge=0, le=1)
    Soil_Type_Loam: int = Field(..., ge=0, le=1)
    Soil_Type_Peaty: int = Field(..., ge=0, le=1)
    Soil_Type_Sandy: int = Field(..., ge=0, le=1)
    Soil_Type_Silt: int = Field(..., ge=0, le=1)
    Crop_Cotton: int = Field(..., ge=0, le=1)
    Crop_Maize: int = Field(..., ge=0, le=1)
    Crop_Rice: int = Field(..., ge=0, le=1)
    Crop_Soybean: int = Field(..., ge=0, le=1)
    Crop_Wheat: int = Field(..., ge=0, le=1)
    Weather_Condition_Rainy: int = Field(..., ge=0, le=1)
    Weather_Condition_Sunny: int = Field(..., ge=0, le=1)

@app.post("/predict")
def predict_crop(data: CropInput):
    # Convert to dictionary (pydantic v2)
    data_dict = data.model_dump()

    # Create feature list in expected order
    filtered = [data_dict.get(f, 0) for f in EXPECTED_FEATURES]
    feature_array = np.array([filtered])

    try:
        prediction = model.predict(feature_array)[0]
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

    return {"Predicted_Yield": float(prediction)}

@app.get("/")
def home():
    return {
        "message": "Crop Yield Prediction API is running.",
        "docs_url": "https://linear-regression-model-4dyx.onrender.com/docs"
    }
