view: site_types_global_atts {
  sql_table_name: dbo.site_types_global_atts ;;

  dimension: att_id {
    type: number
    sql: ${TABLE}.Att_ID ;;
  }

  dimension: site_type_global_id {
    type: number
    sql: ${TABLE}.SiteTypeGlobalID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
