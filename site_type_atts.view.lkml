view: site_type_atts {
  sql_table_name: dbo.site_type_atts ;;

  dimension: att_id {
    type: number
    sql: ${TABLE}.ATT_ID ;;
  }

  dimension: present {
    type: number
    sql: ${TABLE}.PRESENT ;;
  }

  dimension: site_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.SITE_TYPE_ID ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.UNIQUE_ID ;;
  }

  dimension: usage_stat {
    type: number
    sql: ${TABLE}.USAGE_STAT ;;
  }

  measure: count {
    type: count
    drill_fields: [site_types.site_type_id]
  }
}
