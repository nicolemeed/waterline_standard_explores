view: mdd_tariff_prices {
  sql_table_name: dbo.mdd_tariff_prices ;;

  dimension: cost {
    label: "Cost (£) per m3"
    type: number
    sql: ${TABLE}.Cost ;;
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

  dimension: mdd_tariff_id {
    type: number
    sql: ${TABLE}.MDD_TARIFF_ID ;;
  }

  dimension: year_id {
    type: number
    sql: ${TABLE}.YEAR_ID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
