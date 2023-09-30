CREATE OR REPLACE TABLE keepcoding.ivr_detail AS
SELECT
    ivc.ivr_id AS calls_ivr_id,
    ivc.phone_number AS calls_phone_number,
    ivc.ivr_result AS calls_ivr_result,
    ivc.vdn_label AS calls_vdn_label,
    FORMAT_TIMESTAMP('%Y%m%d', ivc.start_date) AS calls_start_date_id,
    FORMAT_TIMESTAMP('%Y%m%d', ivc.end_date) AS calls_end_date_id,
    ivc.start_date AS calls_start_date,
    ivc.end_date AS calls_end_date,
    TIMESTAMP_DIFF(ivc.end_date, ivc.start_date, SECOND) AS calls_total_duration,
    ivc.customer_segment AS calls_customer_segment,
    ivc.ivr_language AS calls_ivr_language,
    ivc.steps_module AS calls_steps_module,
    ivc.module_aggregation AS calls_module_aggregation,
    ims.module_sequece AS module_sequence,
    ims.module_name AS module_name,
    ims.module_result AS module_result,
    ist.step_sequence AS step_sequence,
    ist.step_name AS step_name,
    ist.step_result AS step_result,
    ist.step_description_error AS step_description_error,
    ist.document_type AS document_type,
    ist.document_identification AS document_identification,
    ist.customer_phone AS customer_phone,
    ist.billing_account_id AS billing_account_id
FROM
    `keepcoding.ivr_calls` AS ivc
JOIN
    `keepcoding.ivr_modules` AS ims
ON
    ivc.ivr_id = ims.ivr_id
JOIN
    `keepcoding.ivr_steps` AS ist
ON
    ims.ivr_id = ist.ivr_id AND ims.module_sequece = ist.module_sequece;