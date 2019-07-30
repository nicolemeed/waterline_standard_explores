view: meter_read_method_vs_type {
  sql_table_name: dbo.meter_read_method_vs_type ;;

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension: include_in_bill_creation {
    type: string
    sql: ${TABLE}.IncludeInBillCreation ;;
  }

  dimension: read_method_id {
    type: number
    sql: ${TABLE}.READ_METHOD_ID ;;
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
