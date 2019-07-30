view: co_details {
  sql_table_name: dbo.co_details ;;

  dimension: access_level_id {
    type: number
    sql: ${TABLE}.accessLevelId ;;
  }

  dimension_group: active_from {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ActiveFromDate ;;
  }

  dimension_group: active_to {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ActiveToDate ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.ADDRESS1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.ADDRESS2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: co_id {
    type: number
    sql: ${TABLE}.CO_ID ;;
  }

  dimension: co_job_code {
    type: string
    sql: ${TABLE}.co_job_code ;;
  }

  dimension: co_nm {
    label: "Company Name"
    type: string
    sql: ${TABLE}.CO_NM ;;
  }

  dimension: co_notes {
    type: string
    sql: ${TABLE}.CO_NOTES ;;
  }

  dimension: co_type {
    type: number
    sql: ${TABLE}.CO_TYPE ;;
  }

  dimension_group: company_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.COMPANY_START_DATE ;;
  }

  dimension: contact {
    type: string
    sql: ${TABLE}.CONTACT ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.COUNTY ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.FAX ;;
  }

  dimension: file_id {
    type: number
    sql: ${TABLE}.FileID ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}.isActive ;;
  }

  dimension: logo {
    type: string
    sql: ${TABLE}.LOGO ;;
  }

  dimension: postcode {
    type: string
    sql: ${TABLE}.POSTCODE ;;
  }

  dimension: sage_ref_num {
    type: number
    sql: ${TABLE}.SageRefNum ;;
  }

  dimension: tel {
    type: string
    sql: ${TABLE}.TEL ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.URL ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
