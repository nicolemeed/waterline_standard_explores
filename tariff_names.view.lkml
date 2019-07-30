view: tariff_names {
  sql_table_name: dbo.tariff_names ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: relates_to {
    type: number
    sql: ${TABLE}.relates_to ;;
  }

  dimension: tariff_id {
    type: number
    sql: ${TABLE}.Tariff_ID ;;
  }

  dimension: wco_id {
    type: number
    sql: ${TABLE}.wco_id ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
