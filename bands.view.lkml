view: bands {
  sql_table_name: dbo.bands ;;

  dimension: band_des {
    type: string
    sql: ${TABLE}.BAND_DES ;;
  }

  dimension: band_nm {
    type: string
    sql: ${TABLE}.BAND_NM ;;
  }

  dimension: max_area_drained {
    type: number
    sql: ${TABLE}.MaxAreaDrained ;;
  }

  dimension: min_area_drained {
    type: number
    sql: ${TABLE}.MinAreaDrained ;;
  }

  dimension: price {
    label: "Annual Charge"
    type: number
    sql: ${TABLE}.PRICE ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.UNIQUE_ID ;;
  }

  dimension: wco_id {
    type: number
    sql: ${TABLE}.WCO_ID ;;
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
