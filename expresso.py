import streamlit as st
import pandas as pd
import numpy as np
import pickle

# Load the trained model
with open("expresso_churn_model.pkl", "rb") as file:
    model = pickle.load(file)

# Page title
st.set_page_config(page_title="Expresso Churn Predictor")
st.title("📱 Expresso Customer Churn Prediction")
st.write("Fill in the customer details to predict whether they'll churn or stay loyal.")

# Input fields (change/add fields based on your actual model features)
TENURE = st.slider("Tenure (months)", 0, 100, 12)
MONTANT = st.number_input("Montant (Total recharge amount)", 0.0, 500000.0, 10000.0)
FREQUENCE_RECH = st.slider("Recharge Frequency", 0, 150, 10)
REVENUE = st.number_input("Revenue", 0.0, 500000.0, 8000.0)
FREQUENCE = st.slider("Call Frequency", 0, 100, 12)
DATA_VOLUME = st.number_input("Data Volume (MB)", 0.0, 2000000.0, 10000.0)
ON_NET = st.slider("On-Net Calls", 0, 50000, 1000)
ORANGE = st.slider("Orange Calls", 0, 20000, 500)
TIGO = st.slider("Tigo Calls", 0, 5000, 100)
REGULARITY = st.slider("Days active", 0, 100, 30)
FREQ_TOP_PACK = st.slider("Top Pack Frequency", 0, 100, 5)

# Features collected into a DataFrame
input_data = pd.DataFrame({
    "TENURE": [TENURE],
    "MONTANT": [MONTANT],
    "FREQUENCE_RECH": [FREQUENCE_RECH],
    "REVENUE": [REVENUE],
    "FREQUENCE": [FREQUENCE],
    "DATA_VOLUME": [DATA_VOLUME],
    "ON_NET": [ON_NET],
    "ORANGE": [ORANGE],
    "TIGO": [TIGO],
    "REGULARITY": [REGULARITY],
    "FREQ_TOP_PACK": [FREQ_TOP_PACK]
})

# Prediction
if st.button("🔍 Predict"):
    prediction = model.predict(input_data)[0]
    prob = model.predict_proba(input_data)[0][1]

    if prediction == 1:
        st.error(f"⚠️ Likely to Churn with {prob*100:.2f}% probability.")
    else:
        st.success(f"✅ Likely to Stay with {prob*100:.2f}% probability.")
