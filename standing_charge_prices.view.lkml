view: standing_charge_prices {
  sql_table_name: dbo.standing_charge_prices ;;

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

  dimension: standing_charge_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.standing_charge_id ;;
  }

  dimension: supply_cost {
    label: "Supply Charge"
    type: number
    sql: ${TABLE}.supply_cost ;;
  }

  dimension: waste_cost {
    label: "Waste Charge"
    type: number
    sql: ${TABLE}.waste_cost ;;
  }

  dimension: year_id {
    type: number
    sql: ${TABLE}.year_id ;;
  }

  measure: count {
    type: count
    drill_fields: [standing_charges.standing_charge_id]
  }
}
