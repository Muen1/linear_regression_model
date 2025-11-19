from fastapi import FastAPI
from pydantic import BaseModel
import numpy as np
import joblib

app = FastAPI()

model = joblib.load("best_model.pkl")

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

class CropInput(BaseModel):
    Rainfall_mm: float = 0
    Temperature_Celsius: float = 0
    Fertilizer_Used: float = 0
    Irrigation_Used: float = 0
    Days_to_Harvest: float = 0
    Region_North: int = 0
    Region_South: int = 0
    Region_West: int = 0
    Soil_Type_Clay: int = 0
    Soil_Type_Loam: int = 0
    Soil_Type_Peaty: int = 0
    Soil_Type_Sandy: int = 0
    Soil_Type_Silt: int = 0
    Crop_Cotton: int = 0
    Crop_Maize: int = 0
    Crop_Rice: int = 0
    Crop_Soybean: int = 0
    Crop_Wheat: int = 0
    Weather_Condition_Rainy: int = 0
    Weather_Condition_Sunny: int = 0


@app.post("/predict")
def predict_crop(data: CropInput):

    # Convert to dictionary
    data_dict = data.model_dump()

    # Create feature list
    filtered = [data_dict.get(f, 0) for f in EXPECTED_FEATURES]

    feature_array = np.array([filtered])

    prediction = model.predict(feature_array)[0]

    return {"Predicted_Yield": float(prediction)}

