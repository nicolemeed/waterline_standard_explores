view: meter_read_cmos_validated {
  sql_table_name: dbo.MeterReadCmosValidated ;;

  dimension_group: attempt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.AttemptDate ;;
  }

  dimension: meter_read_id {
    type: number
    sql: ${TABLE}.MeterReadId ;;
  }

  dimension: validated {
    type: string
    sql: ${TABLE}.Validated ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
