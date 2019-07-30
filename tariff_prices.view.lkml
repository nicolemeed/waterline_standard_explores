view: tariff_prices {
  sql_table_name: dbo.tariff_prices ;;

  dimension: max_usage {
    type: number
    sql: ${TABLE}.max_usage ;;
  }

  dimension: min_usage {
    type: number
    sql: ${TABLE}.min_usage ;;
  }

  dimension: supply_cost {
    type: number
    sql: ${TABLE}.supply_cost ;;
  }

  dimension: supply_fixed_cost {
    type: number
    sql: ${TABLE}.supply_fixed_cost ;;
  }

  dimension: tariff_id {
    type: number
    sql: ${TABLE}.tariff_id ;;
  }

  dimension: waste_cost {
    type: number
    sql: ${TABLE}.waste_cost ;;
  }

  dimension: waste_fixed_cost {
    type: number
    sql: ${TABLE}.waste_fixed_cost ;;
  }

  dimension: year_id {
    type: number
    sql: ${TABLE}.year_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
