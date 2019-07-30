view: meter_read_types {
  sql_table_name: dbo.meter_read_types ;;

  dimension: read_type {
    type: string
    sql: ${TABLE}.READ_TYPE ;;
  }

  dimension: read_type_code {
    type: string
    sql: ${TABLE}.READ_TYPE_CODE ;;
  }

  dimension: read_type_id {
    type: number
    sql: ${TABLE}.READ_TYPE_ID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
