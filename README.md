Disclaimer

This project is for portfolio and demonstration purposes only.
The data, scenarios, and insights presented herein are entirely synthetic and do not reflect any real-world operational data or confidential information from Apple Inc. The project is based on a hypothetical business challenge, informed by publicly available reports and a forward-looking analysis of industry trends as of late 2025. The material is intended solely to showcase data science skills, analytical competency, and project management capabilities. It should not be considered an accurate representation of Apple’s business, processes, or performance.

Portfolio Project: Mac Product Shipping Delay Prediction


Project Overview

This data science project addresses a critical business problem for Apple's Operations team: predicting shipping delays for Mac products. The project's central value lies in its ability to challenge initial assumptions and uncover counter-intuitive insights. The original hypothesis that custom, high-end products were the primary cause of delays was disproven through data exploration. This project demonstrates an adaptive, data-driven approach to problem-solving, providing a predictive model and actionable recommendations based on the actual relationships found in the data.

The Business Problem

Unpredictable shipping delays for Mac products can lead to customer dissatisfaction and increased support costs. The initial project aim was to confirm the assumption that custom-configured products were the main source of these delays. However, our analysis revealed a more complex reality: standard, high-volume products showed a higher average delay, and other factors were at play. The project's focus therefore shifted to a deeper investigation to identify these true drivers and build a model that reflects them.

CRISP-DM Project Workflow


Phase 1: Business & Data Understanding

Objective: Define the business problem and initial, testable hypotheses.
Key Questions: Why are delays occurring, and which factors are the primary drivers?
Outcome: A project charter that was later revised to reflect new, counter-intuitive findings from the data.

Phase 2: Data Exploration

Objective: Generate synthetic data and perform initial exploratory data analysis (EDA).
Deliverables: generate_synthetic_data.ipynb (Python script), eda_queries.sql (SQL), and data_exploration.ipynb (Python notebook with a corrected narrative).
Key Findings: Contrary to our hypothesis, standard-configured products and high-volume SKUs like the MacBook Air M4 were found to have higher average delays than their custom-configured and high-end counterparts.

Phase 3: Data Preparation

Objective: Clean, transform, and engineer features based on the new insights from EDA.
Deliverables: data_preparation.sql (BigQuery SQL script for feature engineering) and data_preparation.ipynb (Python notebook for final processing).
Key Features: Engineered features were created to capture the newly identified drivers, such as is_high_volume_product and the specific shipping route to Germany.

Phase 4: Modeling & Analysis

Objective: Train and evaluate a predictive model and interpret its results.
Deliverables: modeling_analysis.ipynb (Python notebook with code and analysis).
Model: XGBoost Classifier, chosen for its effectiveness with tabular data and imbalanced classes.
Key Results:
Model Performance: Achieved a ROC-AUC of 0.71 and an F1-score of 0.63 for the delayed class. This demonstrates a moderate, but not perfect, ability to predict delays.
Top Features: The top drivers of delay were is_custom_config (with standard orders showing more delays), product_sku_Mac Studio M3 Ultra, and shipping_country_Germany.

Phase 5: Evaluation & Recommendations

Objective: Translate the technical findings into actionable, business-focused recommendations.
Deliverables: This README.md and the executive_report.md.
Business Impact: The project provides a data-backed foundation for targeted operational improvements and proactive customer communication, moving the business from assumptions to evidence.

Strategic Recommendations

Based on our final analysis, we recommend the following:
Operational Audit for Standard Products: Investigate the fulfillment process for high-volume, standard products, as they were found to be the primary source of delays.
Targeted Logistics Investigation: Launch an immediate investigation into the shipping route to Germany to address the localized bottleneck identified by the model.
Proactive Customer Communication: Utilize the model's moderate predictive ability to flag high-risk orders for proactive communication by the AOS team, managing customer expectations and improving satisfaction.

Technical Stack

Cloud Platform: Google Cloud Platform (BigQuery, Cloud Storage)
Data Manipulation: SQL, Pandas
Modeling: Python (Scikit-learn, XGBoost)
Documentation: Jupyter Notebooks, Markdown
Version Control: Git / GitHub

Final Conclusion

This project demonstrates the power of a data-driven approach to business challenges. By being willing to abandon initial assumptions and follow the insights provided by the data, we were able to deliver a more robust, honest, and valuable solution than was originally envisioned.
