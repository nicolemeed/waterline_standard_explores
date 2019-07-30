view: site_statuses {
  sql_table_name: dbo.SiteStatuses ;;

  dimension: audit_id {
    type: number
    sql: ${TABLE}.AuditId ;;
  }

  dimension_group: end_change {
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
    sql: ${TABLE}.EndChangeDate ;;
  }

  dimension: end_change_user_id {
    type: number
    sql: ${TABLE}.EndChangeUserId ;;
  }

  dimension: end_change_user_name {
    type: string
    sql: ${TABLE}.EndChangeUserName ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.EndDate ;;
  }

  dimension: site_id {
    type: number
    sql: ${TABLE}.SiteId ;;
  }

  dimension_group: start_change {
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
    sql: ${TABLE}.StartChangeDate ;;
  }

  dimension: start_change_user_id {
    type: number
    sql: ${TABLE}.StartChangeUserId ;;
  }

  dimension: start_change_user_name {
    type: string
    sql: ${TABLE}.StartChangeUserName ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.StartDate ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.StatusId ;;
  }

  dimension: status_text {
    type: string
    sql: ${TABLE}.StatusText ;;
  }

  measure: count {
    type: count
    drill_fields: [start_change_user_name, end_change_user_name]
  }
}
