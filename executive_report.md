Disclaimer

This project is for portfolio and demonstration purposes only.
The data, scenarios, and insights presented herein are entirely synthetic and do not reflect any real-world operational data or confidential information from Apple Inc. The project is based on a hypothetical business challenge, informed by publicly available reports and a forward-looking analysis of industry trends as of late 2025. The material is intended solely to showcase data science skills, analytical competency, and project management capabilities. It should not be considered an accurate representation of Apple’s business, processes, or performance.

Executive Summary: Predicting Mac Product Shipping Delays

Prepared for: Apple Operations & Strategic Planning Team
Date: August 4, 2025
Project Lead: Data Scientist, Daniel Rodriguez III

The Challenge

This project was initiated to address shipping delays for Mac products, with an initial hypothesis that high-end, custom configurations were the primary cause. However, our data exploration revealed a more complex and, in some cases, counter-intuitive reality. We found that standard configurations and high-volume products like the MacBook Air M4 and iMac M4 experienced higher average delays than their custom-configured counterparts. This necessitated a revised approach to uncover the true, underlying drivers of delay.

The Solution

Using an XGBoost predictive model, we successfully built a tool to identify orders at risk of delay. The model serves as a proof-of-concept, and its primary value lies not in perfect prediction, but in its ability to expose the previously unknown relationships within our supply chain data.

Key Findings & Model Performance

The model achieved a ROC-AUC score of 0.71 and an F1-score of 0.63 for the delayed class. While this performance indicates a moderate ability to predict delays, its true power is in the insights it provides. The model's feature importance analysis revealed the following key drivers:
Custom Configuration (is_custom_config): This was the single most influential factor. Our data shows that, contrary to initial assumptions, standard configurations are more likely to be delayed than custom ones. This suggests that the fulfillment process for standard, high-volume products may have an undiscovered bottleneck.
Product SKU (Mac Studio M3 Ultra): The model identified the Mac Studio M3 Ultra as a significant predictor, despite it having one of the lowest average delays. This indicates a complex, non-linear interaction with other factors that the model captured, suggesting its unique supply chain profile is still a key consideration.
Shipping Route (shipping_country_Germany): The model showed that orders being shipped to Germany were a major factor in predicting delays, suggesting a localized logistical or customs issue that is independent of manufacturing origin.

Strategic Recommendations

Based on our analysis, we recommend the following strategic actions:
Operational Process Audit: Conduct a full audit of the fulfillment process for standard, high-volume products (e.g., MacBook Air M4, iMac M4). The counter-intuitive finding that these products have higher delays suggests a systemic issue that needs to be identified and resolved.
Targeted Logistics Investigation: Launch an immediate investigation into the shipping and customs process for all orders destined for Germany. The model's findings indicate a consistent, location-specific bottleneck.
Proactive Communication: Leverage the model's output to flag orders with a high probability of delay for the AOS team. This enables early, proactive customer communication, which can mitigate dissatisfaction even if the model's predictions are not always perfect.

Conclusion

This project successfully challenged our initial assumptions and provided a data-backed foundation for future supply chain improvements. The model, while a work in progress, has delivered crucial insights that allow us to focus our resources on the true drivers of delay, moving us toward a more resilient and efficient operational strategy.
