view: water_co_swd_charges_rv {
  sql_table_name: dbo.water_co_swd_charges_rv ;;

  dimension: charge_id {
    type: number
    sql: ${TABLE}.ChargeId ;;
  }

  dimension: charge_name {
    type: string
    sql: ${TABLE}.ChargeName ;;
  }

  dimension: charge_per_rv {
    label: "Charge per RV per year"
    type: number
    sql: ${TABLE}.ChargePerRV ;;
  }

  dimension: charge_perc_decimal {
    label: "Chargeable Percentage"
    type: number
    sql: ${TABLE}.ChargePercDecimal ;;
  }

  dimension: charge_perc_text {
    type: string
    sql: ${TABLE}.ChargePercText ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: water_co_id {
    type: number
    sql: ${TABLE}.WaterCoId ;;
  }

  dimension: year_id {
    type: number
    sql: ${TABLE}.YearId ;;
  }

  measure: count {
    type: count
    drill_fields: [charge_name]
  }
}
