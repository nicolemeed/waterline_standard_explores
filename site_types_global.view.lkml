view: site_types_global {
  sql_table_name: dbo.site_types_global ;;

  dimension: daily_consumption {
    type: number
    sql: ${TABLE}.DailyConsumption ;;
  }

  dimension: global_site_type {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: acceptable_fluctuation {
    type: number
    value_format_name: percent_0
    sql: ${TABLE}.PercentFluctuation / 100 ;;
  }

  dimension: site_type_global_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.SiteTypeGlobalID ;;
  }

  measure: count {
    type: count
    drill_fields: [global_site_type]
  }
}
