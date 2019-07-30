view: supply_types {
  sql_table_name: dbo.supply_types ;;

  dimension: supply_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.supply_type_id ;;
  }

  dimension: allow_dpids {
    type: string
    sql: ${TABLE}.allow_dpids ;;
  }

  dimension: allow_meters {
    type: string
    sql: ${TABLE}.allow_meters ;;
  }

  dimension: allow_no_meter {
    type: string
    sql: ${TABLE}.allow_no_meter ;;
  }

  dimension: supply_type_name {
    type: string
    sql: ${TABLE}.supply_type_name ;;
  }

  measure: count {
    type: count
    drill_fields: [supply_type_id, supply_type_name]
  }
}
