view: meter_sizes {
  sql_table_name: dbo.meter_sizes ;;

  dimension: meter_size_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.METER_SIZE_ID ;;
  }

  dimension: file_id {
    type: number
    sql: ${TABLE}.FileID ;;
  }

  dimension: meter_size {
    type: number
    sql: ${TABLE}.METER_SIZE ;;
  }

  measure: count {
    type: count
    drill_fields: [meter_size_id]
  }
}
