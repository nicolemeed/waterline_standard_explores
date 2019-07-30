view: water_meter_read_frequency {
  sql_table_name: dbo.water_meter_read_frequency ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: frequency {
    type: string
    sql: ${TABLE}.frequency ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
