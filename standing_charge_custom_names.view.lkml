view: standing_charge_custom_names {
  sql_table_name: dbo.standing_charge_custom_names ;;

  dimension: charge_id {
    type: number
    sql: ${TABLE}.CHARGE_ID ;;
  }

  dimension_group: date_modified {
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
    sql: ${TABLE}.DateModified ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: wco_id {
    type: number
    sql: ${TABLE}.WCO_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
