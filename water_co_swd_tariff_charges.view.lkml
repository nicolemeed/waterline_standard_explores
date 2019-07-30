view: water_co_swd_tariff_charges {
  sql_table_name: dbo.water_co_swd_tariff_charges ;;

  dimension: charge {
    type: number
    sql: ${TABLE}.Charge ;;
  }

  dimension: max_consumption {
    type: number
    sql: ${TABLE}.MaxConsumption ;;
  }

  dimension: min_consumption {
    type: number
    sql: ${TABLE}.MinConsumption ;;
  }

  dimension: tariff_charge_id {
    type: number
    sql: ${TABLE}.TariffChargeId ;;
  }

  dimension: tariff_id {
    type: number
    sql: ${TABLE}.TariffId ;;
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
    drill_fields: []
  }
}
