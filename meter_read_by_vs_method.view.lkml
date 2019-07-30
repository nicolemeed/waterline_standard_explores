view: meter_read_by_vs_method {
  sql_table_name: dbo.meter_read_by_vs_method ;;

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension: read_by_id {
    type: number
    sql: ${TABLE}.READ_BY_ID ;;
  }

  dimension: read_method_id {
    type: number
    sql: ${TABLE}.READ_METHOD_ID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
