Disclaimer

This project is for portfolio and demonstration purposes only.
The data, scenarios, and insights presented herein are entirely synthetic and do not reflect any real-world operational data or confidential information from Apple Inc. The project is based on a hypothetical business challenge, informed by publicly available reports and a forward-looking analysis of industry trends as of late 2025. The material is intended solely to showcase data science skills, analytical competency, and project management capabilities. It should not be considered an accurate representation of Apple’s business, processes, or performance.

SQL


-- Disclaimer: This project uses synthetic data for demonstration purposes only.

-- This script creates a final, prepared dataset for our machine learning model.
-- It performs feature engineering and saves the result as a BigQuery view.

CREATE OR REPLACE VIEW `driiiportfolio.sds_project.project_ready_data` AS
SELECT
    -- Identifiers
    t1.order_id,
    t1.customer_id,

    -- Target Variable: 1 if delayed, 0 otherwise
    IF(t2.delay_in_days > 0, 1, 0) AS is_delayed,

    -- Original Features
    t1.product_sku,
    t1.ram_config_gb,
    t1.storage_config_gb,
    t1.is_custom_config,
    t1.shipping_country,
    t2.manufacturing_plant,

    -- Time-based Features from order_date
    EXTRACT(MONTH FROM t1.order_date) AS order_month,
    EXTRACT(DAYOFWEEK FROM t1.order_date) AS order_day_of_week,
    EXTRACT(WEEK FROM t1.order_date) AS order_week_of_year,

    -- Engineered Categorical Flags based on our new findings
    -- Flag for high-volume products that showed higher delays in EDA
    (t1.product_sku IN ('MacBook Air M4', 'iMac M4')) AS is_high_volume_product,
    
    -- Flag for the specific plant and country combination that the model might find important
    (t2.manufacturing_plant = 'China Plant A' AND t1.shipping_country = 'Germany') AS is_china_to_germany_route,

FROM
    `driiiportfolio.sds_project.orders` AS t1
JOIN
    `driiiportfolio.sds_project.shipment_logs` AS t2
ON
    t1.order_id = t2.order_id;
