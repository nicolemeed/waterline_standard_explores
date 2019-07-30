view: site {
  label: "Site Details"
  sql_table_name: dbo.site ;;

  dimension: sis_site_id {
    hidden: yes
    type: number
    sql: ${TABLE}.SIS_SITE_ID ;;
  }

  dimension: access_info {
    type: string
    hidden: yes
    sql: ${TABLE}.ACCESS_INFO ;;
  }

  dimension: address1 {
    group_label: "Address"
    type: string
    sql: ${TABLE}.ADDRESS1 ;;
  }

  dimension: address2 {
    group_label: "Address"
    type: string
    sql: ${TABLE}.ADDRESS2 ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension: city {
    group_label: "Address"
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: close_date {
    hidden: yes
    type: string
    sql: ${TABLE}.CloseDate ;;
  }

  dimension: closed {
    hidden: yes
    type: number
    sql: ${TABLE}.CLOSED ;;
  }

  dimension: co_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CO_ID ;;
  }

  dimension: cons_alert {
    hidden: yes
    type: number
    sql: ${TABLE}.CONS_ALERT ;;
  }

  dimension: contact {
    label: "Site Contact Name"
    type: string
    sql: ${TABLE}.CONTACT ;;
  }

  dimension: country {
    group_label: "Address"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: county {
    group_label: "Address"
    type: string
    sql: ${TABLE}.COUNTY ;;
  }

  dimension: cust_ref {
    hidden: yes
    type: string
    sql: ${TABLE}.CUST_REF ;;
  }

  dimension: customer_region_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CustomerRegionId ;;
  }

  dimension: did_not_zero {
    hidden: yes
    type: string
    sql: ${TABLE}.DID_NOT_ZERO ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: fax {
    type: string
    hidden: yes
    sql: ${TABLE}.FAX ;;
  }

  dimension: file_id {
    hidden: yes
    type: number
    sql: ${TABLE}.FileID ;;
  }

  dimension: floor_space {
    hidden: yes
    type: number
    sql: ${TABLE}.FLOOR_SPACE ;;
  }

  dimension: footfall_annum {
    hidden: yes
    type: number
    sql: ${TABLE}.FOOTFALL_ANNUM ;;
  }

  dimension: highest_monthly_adu {
    hidden: yes
    type: number
    sql: ${TABLE}.highestMonthlyAdu ;;
  }

  dimension: horizon_code {
    hidden: yes
    type: string
    sql: ${TABLE}.HORIZON_CODE ;;
  }

  dimension_group: low_flow_end {
    hidden: yes
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
    sql: ${TABLE}.Low_Flow_endTime ;;
  }

  dimension_group: low_flow_start {
    hidden: yes
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
    sql: ${TABLE}.Low_Flow_startTime ;;
  }

  dimension: low_flow_value {
    hidden: yes
    type: number
    sql: ${TABLE}.Low_Flow_VALUE ;;
  }

  dimension: maximum_daily_demand {
    hidden: yes
    type: number
    sql: ${TABLE}.Maximum_Daily_Demand ;;
  }

  dimension: monthly_consumption_budget {
    type: number
    hidden: yes
    sql: ${TABLE}.monthlyConsumptionBudget ;;
  }

  dimension: open_date {
    hidden: yes
    type: string
    sql: ${TABLE}.OpenDate ;;
  }

  dimension: peak_flow {
    hidden: yes
    type: number
    sql: ${TABLE}.Peak_Flow ;;
  }

  dimension: postcode {
    group_label: "Address"
    type: string
    sql: ${TABLE}.POSTCODE ;;
  }

  dimension: rate_val {
    hidden: yes
    type: number
    sql: ${TABLE}.RATE_VAL ;;
  }

  dimension: region_id {
    hidden: yes
    type: number
    sql: ${TABLE}.RegionID ;;
  }

  dimension: rooms {
    hidden: yes
    type: number
    sql: ${TABLE}.Rooms ;;
  }

  dimension: rsp_no {
    hidden: yes
    type: string
    sql: ${TABLE}.RSP_NO ;;
  }

  dimension: sensitive {
    hidden: yes
    type: string
    sql: ${TABLE}.Sensitive ;;
  }

  dimension: sensitive_site {
  type: yesno
  sql: ${sensitive} = 'true' ;;
  }


  dimension: sensitive_notes {
    label: "Sensitive Site Notes"
    type: string
    sql: ${TABLE}.SensitiveNotes ;;
  }

  dimension: site_area_ft2 {
    hidden: yes
    type: number
    sql: ${TABLE}.SiteAreaFt2 ;;
  }

  dimension: site_daily_cons {
    hidden: yes
    type: number
    sql: ${TABLE}.SITE_DAILY_CONS ;;
  }

  dimension: site_id {
    primary_key: yes
    description: "the site ID used by the database to link sites to other tables"
    type: number
    sql: ${TABLE}.SITE_ID ;;
  }

  dimension: site_nm {
    label: "Site Name"
    type: string
    sql: ${TABLE}.SITE_NM ;;
  }

  dimension: site_notes {
    hidden: yes
    type: string
    sql: ${TABLE}.SITE_NOTES ;;
  }

  dimension: site_perc_fluc {
    hidden: yes
    type: number
    sql: ${TABLE}.SITE_PERC_FLUC ;;
  }

  dimension: site_real_id {
    label: "Customer Site ID"
    description: "The front end site ID visible on the site details page"
    type: string
    sql: ${TABLE}.SITE_REAL_ID ;;
  }

  dimension: site_type {
    hidden: yes
    type: number
    sql: ${TABLE}.SITE_TYPE ;;
  }

  dimension: square_feet {
    hidden: yes
    type: number
    sql: ${TABLE}.squareFeet ;;
  }

  dimension: staff_nos {
    hidden: yes
    type: number
    sql: ${TABLE}.STAFF_NOS ;;
  }

  dimension: supply_contact {
    hidden: yes
    type: number
    sql: ${TABLE}.SUPPLY_CONTACT ;;
  }

  dimension: supply_wco {
    hidden: yes
    type: number
    sql: ${TABLE}.SUPPLY_WCO ;;
  }

  dimension: tel {
    type: string
    sql: ${TABLE}.TEL ;;
  }

  dimension: waste_contact {
    hidden: yes
    type: number
    sql: ${TABLE}.WASTE_CONTACT ;;
  }

  dimension: waste_wco {
    hidden: yes
    type: number
    sql: ${TABLE}.WASTE_WCO ;;
  }

  measure: count_of_sites {
    type: count
    drill_fields: [site.sis_site_id, site.count, site_accounts.count, water_meters.count]
  }
}
