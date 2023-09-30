CREATE OR REPLACE TABLE keepcoding.ivr_summary AS
SELECT
    ivc.calls_ivr_id AS ivr_id,
    ivc.calls_phone_number AS phone_number,
    ivc.calls_ivr_result AS ivr_result,
    CASE
        WHEN ivc.calls_vdn_label LIKE 'ATC%' THEN 'FRONT'
        WHEN ivc.calls_vdn_label LIKE 'TECH%' THEN 'TECH'
        WHEN ivc.calls_vdn_label = 'ABSORPTION' THEN 'ABSORPTION'
        ELSE 'RESTO'
    END AS vdn_aggregation,
    FORMAT_TIMESTAMP('%Y%m%d', ivc.calls_start_date) AS start_date_id,
    FORMAT_TIMESTAMP('%Y%m%d', ivc.calls_end_date) AS end_date_id,
    ivc.calls_start_date AS start_date,
    ivc.calls_end_date AS end_date,
    TIMESTAMP_DIFF(ivc.calls_end_date, ivc.calls_start_date, SECOND) AS total_duration,
    ivc.calls_customer_segment AS customer_segment,
    ivc.calls_ivr_language AS ivr_language,
    ivc.calls_steps_module AS steps_module,
    ivc.calls_module_aggregation AS module_aggregation,
    CASE WHEN ivc.module_name = 'AVERIA_MASIVA' THEN 1 ELSE 0 END AS masiva_lg,
    CASE WHEN ivc.step_name = 'CUSTOMERINFOBYPHONE.TX' AND IFNULL(ivc.step_description_error, 'NULL') = 'NULL' THEN 1 ELSE 0 END AS info_by_phone_lg,
    CASE WHEN ivc.step_name = 'CUSTOMERINFOBYDNI.TX' AND IFNULL(ivc.step_description_error, 'NULL') = 'NULL' THEN 1 ELSE 0 END AS info_by_dni_lg,
    ivc.customer_phone AS customer_phone,
    ivc.step_description_error AS step_description_error,
    ivc.document_type AS document_type,
    ivc.document_identification AS document_identification,
    ivc.billing_account_id AS billing_account_id,
    IF(
        EXISTS (
            SELECT 1
            FROM `keepcoding.ivr_detail` AS ivc2
            WHERE ivc2.calls_phone_number = ivc.calls_phone_number
              AND ivc2.calls_ivr_id <> ivc.calls_ivr_id
              AND ivc2.calls_start_date >= TIMESTAMP_SUB(ivc.calls_start_date, INTERVAL 24 HOUR)
        ), 1, 0
    ) AS repeated_phone_24H,
    IF(
        EXISTS (
            SELECT 1
            FROM `keepcoding.ivr_detail` AS ivc3
            WHERE ivc3.calls_phone_number = ivc.calls_phone_number
              AND ivc3.calls_ivr_id <> ivc.calls_ivr_id
              AND ivc3.calls_start_date <= TIMESTAMP_ADD(ivc.calls_end_date, INTERVAL 24 HOUR)
        ), 1, 0
    ) AS cause_recall_phone_24H
FROM
    `keepcoding.ivr_detail` AS ivc;
