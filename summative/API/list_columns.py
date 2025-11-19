import pickle

with open("best_model.pkl", "rb") as f:
    model = pickle.load(f)

try:
    print("n_features:", model.n_features_in_)
    print("Feature names:", model.feature_names_in_)
except:
    print("Model does not store feature names. They came from df_encoded.columns.")
