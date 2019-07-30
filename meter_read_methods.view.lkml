view: meter_read_methods {
  sql_table_name: dbo.meter_read_methods ;;

  dimension: read_method {
    type: string
    sql: ${TABLE}.READ_METHOD ;;
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
