view: site_status_name {
  sql_table_name: dbo.SiteStatusName ;;

  dimension: status_id {
    type: number
    sql: ${TABLE}.StatusId ;;
  }

  dimension: status_name {
    type: string
    sql: ${TABLE}.StatusName ;;
  }

  measure: count {
    type: count
    drill_fields: [status_name]
  }
}
