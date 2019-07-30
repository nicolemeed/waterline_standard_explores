view: meter_reads {
  sql_table_name: dbo.meter_reads ;;

  dimension: actual {
    hidden: yes
    type: number
    sql: ${TABLE}.ACTUAL ;;
  }

  dimension: bill_id {
    hidden: yes
    type: number
    sql: ${TABLE}.BILL_ID ;;
  }

  dimension_group: date_modified {
    type: time
    timeframes: [
   #   raw,
      time,
      date,
   #   week,
   #   month,
   #   quarter,
   #   year
    ]
    sql: ${TABLE}.DateModified ;;
  }

  dimension: entered_by {
    hidden: yes
    type: number
    sql: ${TABLE}.EnteredBy ;;
  }

  dimension_group: entered {
    type: time
    timeframes: [
 #     raw,
      time,
      date,
#      week,
#      month,
#      quarter,
#      year
    ]
    sql: ${TABLE}.EnteredDate ;;
  }

  dimension: file_id {
    hidden: yes
    type: number
    sql: ${TABLE}.FileID ;;
  }

  dimension: flowrate {
    hidden: yes
    type: string
    sql: ${TABLE}.FLOWRATE ;;
  }

  dimension: include_in_bill_creation {
    type:  yesno
    sql: ${TABLE}.IncludeInBillCreation = 'true' ;;
  }

  dimension: meter_id {
  #  hidden: yes
    type: number
    sql: ${TABLE}.METER_ID ;;
  }

  dimension: read_by_id {
    hidden: yes
    type: number
    sql: ${TABLE}.READ_BY_ID ;;
  }

  dimension_group: read {
    type: time
    timeframes: [
 #     raw,
  #    time,
      date,
  #    week,
   #   month,
    #  quarter,
     # year
    ]
    sql: ${TABLE}.READ_DATE ;;
  }

  dimension: read_id {
    hidden: yes
    type: number
    sql: ${TABLE}.READ_ID ;;
  }

  dimension: read_method_id {
    hidden: yes
    type: number
    sql: ${TABLE}.READ_METHOD_ID ;;
  }

  dimension: read_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}.READ_TYPE_ID ;;
  }

  dimension: reading {
    type: number
    sql: ${TABLE}.READING ;;
  }

  dimension: rollover {
    type: yesno
    sql: ${TABLE}.ROLLOVER = 1 ;;
  }

  dimension: verified {
    type: yesno
    sql: ${TABLE}.VERIFIED = 'true' ;;
  }

  dimension: vol {
    hidden: yes
    type: number
    sql: ${TABLE}.VOL ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
