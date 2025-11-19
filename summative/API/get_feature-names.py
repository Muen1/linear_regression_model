import pickle
import pandas as pd

# load your CSV
df = pd.read_csv("../linear_regression/crop_yield.csv")

# recreate encoding exactly as your notebook
df_encoded = pd.get_dummies(df, drop_first=True)

print("Number of features:", len(df_encoded.columns))
print("Feature names:")
print(list(df_encoded.columns))
