Disclaimer

This project is for portfolio and demonstration purposes only.
The data, scenarios, and insights presented herein are entirely synthetic and do not reflect any real-world operational data or confidential information from Apple Inc. The project is based on a hypothetical business challenge, informed by publicly available reports and a forward-looking analysis of industry trends as of late 2025. The material is intended solely to showcase data science skills, analytical competency, and project management capabilities. It should not be considered an accurate representation of Apple’s business, processes, or performance.

SQL


-- Disclaimer: This project uses synthetic data for demonstration purposes only.

-- Query 1: Calculate the average delay by product SKU
SELECT
  t1.product_sku,
  AVG(t2.delay_in_days) AS avg_delay_days,
  COUNT(t1.order_id) AS total_orders
FROM
  `driiiportfolio.sds_project.orders` AS t1
JOIN
  `driiiportfolio.sds_project.shipment_logs` AS t2
ON
  t1.order_id = t2.order_id
GROUP BY
  t1.product_sku
ORDER BY
  avg_delay_days DESC;

-- Query 2: Analyze the average delay by custom configuration
SELECT
  t1.is_custom_config,
  AVG(t2.delay_in_days) AS avg_delay_days,
  COUNT(t1.order_id) AS total_orders
FROM
  `driiiportfolio.sds_project.orders` AS t1
JOIN
  `driiiportfolio.sds_project.shipment_logs` AS t2
ON
  t1.order_id = t2.order_id
GROUP BY
  t1.is_custom_config
ORDER BY
  avg_delay_days DESC;

-- Query 3: Analyze the delay rate by shipping country and manufacturing plant
SELECT
  t1.shipping_country,
  t2.manufacturing_plant,
  COUNT(t1.order_id) AS total_orders,
  SUM(CASE WHEN t2.delay_in_days > 0 THEN 1 ELSE 0 END) AS delayed_orders,
  SAFE_DIVIDE(SUM(CASE WHEN t2.delay_in_days > 0 THEN 1 ELSE 0 END), COUNT(t1.order_id)) AS delay_rate
FROM
  `driiiportfolio.sds_project.orders` AS t1
JOIN
  `driiiportfolio.sds_project.shipment_logs` AS t2
ON
  t1.order_id = t2.order_id
GROUP BY
  t1.shipping_country,
  t2.manufacturing_plant
ORDER BY
  delay_rate DESC;
