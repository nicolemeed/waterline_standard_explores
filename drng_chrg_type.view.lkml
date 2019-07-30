view: drng_chrg_type {
  sql_table_name: dbo.drng_chrg_type ;;

  dimension: chrg_type {
    type: string
    sql: ${TABLE}.CHRG_TYPE ;;
  }

  dimension: chrg_type_id {
    type: number
    sql: ${TABLE}.CHRG_TYPE_ID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
