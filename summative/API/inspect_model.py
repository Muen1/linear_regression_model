import pickle

with open("best_model.pkl", "rb") as f:
    model = pickle.load(f)

print("Loaded model type:", type(model))

# Try printing attributes
print("\nModel attributes:")
print([attr for attr in dir(model) if not attr.startswith("_")])

# If the model has a preprocessor (common with ColumnTransformer pipelines)
if hasattr(model, "named_steps"):
    print("\nPipeline steps:")
    print(model.named_steps)

if hasattr(model, "preprocessor"):
    print("\nPreprocessor found:")
    print(model.preprocessor)
