This project is for portfolio and demonstration purposes only.
The data, scenarios, and insights presented herein are entirely synthetic and do not reflect any real-world operational data or confidential information from Apple Inc. The project is based on a hypothetical business challenge, informed by publicly available reports and a forward-looking analysis of industry trends as of late 2025. The material is intended solely to showcase data science skills, analytical competency, and project management capabilities. It should not be considered an accurate representation of Apple’s business, processes, or performance.

SQL


-- Project ID: driiiportfolio
-- Dataset Name: sds_project

-- Create the sds_project dataset
-- NOTE: This step should be done via the UI or `bq mk` command line tool if the dataset already exists.
-- CREATE SCHEMA `driiiportfolio.sds_project`
-- OPTIONS(location = 'US');

-- Load the orders data from a GCS bucket
LOAD DATA INTO `driiiportfolio.sds_project.orders`
FROM FILES (
  format = 'CSV',
  uris = ['gs://driiiportfolio-sds-data/orders.csv'] -- <<-- UPDATE BUCKET NAME HERE
)
WITH PARTITION BY order_date
CLUSTER BY product_sku, shipping_country
OPTIONS (
  header_rows = 1 -- Assumes the CSV file has a header row
);

-- Load the shipment logs data
LOAD DATA INTO `driiiportfolio.sds_project.shipment_logs`
FROM FILES (
  format = 'CSV',
  uris = ['gs://driiiportfolio-sds-data/shipment_logs.csv'] -- <<-- UPDATE BUCKET NAME HERE
)
WITH PARTITION BY ship_date
OPTIONS (
  header_rows = 1
);

-- Load the supply chain constraints data
LOAD DATA INTO `driiiportfolio.sds_project.supply_chain_constraints`
FROM FILES (
  format = 'CSV',
  uris = ['gs://driiiportfolio-sds-data/supply_chain_constraints.csv'] -- <<-- UPDATE BUCKET NAME HERE
)
WITH PARTITION BY log_date
OPTIONS (
  header_rows = 1
);
