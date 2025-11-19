import pickle

model = pickle.load(open("best_model.pkl", "rb"))

print("Number of features:", model.n_features_in_)

# Check if model has attribute for feature names (LinearRegression won't have this)
if hasattr(model, "feature_names_in_"):
    print("Feature names:", model.feature_names_in_)
else:
    print("Model does not store feature names. Please check your notebook.")
