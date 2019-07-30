view: mdd_tariff_names {
  sql_table_name: dbo.mdd_tariff_names ;;

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

  dimension: mdd_tariff_id {
    type: number
    sql: ${TABLE}.MDD_TARIFF_ID ;;
  }

  dimension: name {
    label: "MDD Tariff"
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
