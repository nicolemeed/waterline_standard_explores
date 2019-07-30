view: meter_read_by {
  sql_table_name: dbo.meter_read_by ;;

  dimension: read_by {
    type: string
    sql: ${TABLE}.READ_BY ;;
  }

  dimension: read_by_id {
    type: number
    sql: ${TABLE}.READ_BY_ID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
