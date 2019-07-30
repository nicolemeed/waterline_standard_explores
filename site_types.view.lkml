view: site_types {
  sql_table_name: dbo.site_types ;;

  dimension: site_type_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.SITE_TYPE_ID ;;
  }

  dimension: co_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CO_ID ;;
  }

  dimension: daily_consumption {
    type: number
    sql: ${TABLE}.DAILY_CONS ;;
  }

  dimension: meter_size_id {
    hidden: yes
    type: number
    sql: ${TABLE}.meterSizeId ;;
  }

  dimension: acceptable_fluctuation {
    type: number
    value_format_name: percent_0
    sql: ${TABLE}.PERC_FLUC / 100 ;;
  }

  dimension: site_type_global_id {
    hidden: yes
    type: number
    sql: ${TABLE}.SiteTypeGlobalID ;;
  }

  dimension: site_type_name {
    type: string
    sql: ${TABLE}.SITE_TYPE_NM ;;
  }

  measure: count {
    type: count
    drill_fields: [site_type_id, site_type_atts.count]
  }
}
