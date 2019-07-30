view: year_range {
  sql_table_name: dbo.year_range ;;

  dimension_group: dateend {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATEEND ;;
  }

  dimension_group: datestart {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATESTART ;;
  }

  dimension: dayfrom {
    type: number
    sql: ${TABLE}.DAYFROM ;;
  }

  dimension: dayto {
    type: number
    sql: ${TABLE}.DAYTO ;;
  }

  dimension: monthfrom {
    type: number
    sql: ${TABLE}.MONTHFROM ;;
  }

  dimension: monthto {
    type: number
    sql: ${TABLE}.MONTHTO ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.YEAR ;;
  }

  dimension: year_id {
    type: number
    sql: ${TABLE}.YEAR_ID ;;
  }

  dimension: yearfrom {
    type: number
    sql: ${TABLE}.YEARFROM ;;
  }

  dimension: yearto {
    type: number
    sql: ${TABLE}.YEARTO ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
