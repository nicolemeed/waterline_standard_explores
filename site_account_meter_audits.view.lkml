view: site_account_meter_audits {
  sql_table_name: dbo.site_account_meter_audits ;;

  dimension: account_id {
    type: number
    sql: ${TABLE}.AccountID ;;
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
    sql: ${TABLE}.ActiveFrom ;;
  }

  dimension: added_by_user_id {
    type: number
    sql: ${TABLE}.AddedByUserID ;;
  }

  dimension: added_date {
    type: string
    sql: ${TABLE}.AddedDate ;;
  }

  dimension: has_standing_charge {
    type: string
    sql: ${TABLE}.HasStandingCharge ;;
  }

  dimension: meter_audit_id {
    type: number
    sql: ${TABLE}.MeterAuditID ;;
  }

  dimension: meter_id {
    type: number
    sql: ${TABLE}.MeterID ;;
  }

  dimension: removed_by_user_id {
    type: number
    sql: ${TABLE}.RemovedByUserID ;;
  }

  dimension: removed_date {
    type: string
    sql: ${TABLE}.RemovedDate ;;
  }

  dimension: supply_level_id {
    type: number
    sql: ${TABLE}.SupplyLevelId ;;
  }

  dimension: supply_standing_charge_id {
    type: number
    sql: ${TABLE}.SupplyStandingChargeId ;;
  }

  dimension: waste_level_id {
    type: number
    sql: ${TABLE}.WasteLevelId ;;
  }

  dimension: waste_standing_charge_id {
    type: number
    sql: ${TABLE}.WasteStandingChargeId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
