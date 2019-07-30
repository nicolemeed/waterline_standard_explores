view: adu_two_latest_actual_reads {


#view: sql_runner_query {
  derived_table: {
    sql: select wm.METER_ID, wm.SERIAL_NO, wm.no_dials, la.reading, la.read_date, la.ROLLOVER, pa.reading AS previous_reading, pa.read_date AS previous_read_date,
        ya.reading AS ytd_reading, ya.read_date AS ytd_read_date, fa.reading AS ftd_reading, fa.read_date AS ftd_read_date,

                  datediff(d, pa.read_date, la.read_date) AS days,

                  case when  la.rollover = 1 then
                  la.reading + ((power(10,no_dials)) - 1) - pa.reading
                  else la.reading - pa.reading end AS consumption,


                  datediff(d, ya.read_date, la.read_date) AS ytd_days,


                  case when la.reading < (ya.reading * 0.5)  then
                  la.reading + ((power(10,no_dials)) - 1) - ya.reading
                  else la.reading - ya.reading end AS ytd_consumption,

                  datediff(d, fa.read_date, la.read_date) AS ftd_days,

                  case when la.reading < (fa.reading * 0.5)  then
                  la.reading + ((power(10,no_dials)) - 1) - fa.reading
                  else la.reading - fa.reading end AS ftd_consumption,



                  case
                  when datediff(d, pa.read_date, la.read_date) = 0 then 0
                  when  la.rollover = 1 then
                  ((cast(la.reading as decimal(12,2)) + ((power(10,no_dials)) - 1) - (cast(pa.reading as decimal(12,2))))/ datediff(d, pa.read_date, la.read_date))
                  else (cast(la.reading as decimal(12,2)) - cast(pa.reading as decimal(12,2))) / datediff(d, pa.read_date, la.read_date) end AS ADU,

                  case
                  when datediff(d, ya.read_date, la.read_date) = 0 then 0
                  when   (cast(la.reading as decimal(12,2))) < ((cast(ya.reading as decimal(12,2))) * 0.5) then
                  ((cast(la.reading as decimal(12,2)) + ((power(10,no_dials)) - 1) - (cast(ya.reading as decimal(12,2))))/ datediff(d, ya.read_date, la.read_date))
                  else (cast(la.reading as decimal(12,2)) - cast(ya.reading as decimal(12,2))) / datediff(d, ya.read_date, la.read_date) end AS ytd_ADU,

                  case
                  when datediff(d, fa.read_date, la.read_date) = 0 then 0
                  when   (cast(la.reading as decimal(12,2))) < ((cast(fa.reading as decimal(12,2))) * 0.5) then
                  ((cast(fa.reading as decimal(12,2)) + ((power(10,no_dials)) - 1) - (cast(fa.reading as decimal(12,2))))/ datediff(d, fa.read_date, la.read_date))
                  else (cast(la.reading as decimal(12,2)) - cast(fa.reading as decimal(12,2))) / datediff(d, fa.read_date, la.read_date) end AS ftd_ADU


                  from water_meters wm
                  cross apply (select top 1 * from meter_reads mr where mr.read_method_id = 1 and wm.disused = 0 and mr.meter_id = wm.METER_ID order by read_date desc) la
                  cross apply (select top 1 * from meter_reads mr where mr.read_method_id = 1 and wm.disused = 0 and mr.meter_id = wm.METER_ID order by read_date asc) fa
                  outer apply (select top 1 * from meter_reads mr where mr.read_method_id = 1 and wm.disused = 0 and mr.meter_id = wm.METER_ID and mr.READ_DATE < la.READ_DATE order by read_date desc) pa
                  outer apply (select top 1 * from meter_reads mr where mr.read_method_id = 1 and wm.disused = 0 and mr.meter_id = wm.METER_ID and mr.READ_DATE < (la.READ_DATE - 364) order by read_date desc) ya

                   ;;


    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }



    dimension: meter_id {
      type: string
      primary_key: yes
      hidden: yes
      sql: ${TABLE}.METER_ID ;;
    }


    dimension: serial_no {
      hidden: yes
      type: string
      sql: ${TABLE}.SERIAL_NO ;;
    }



    dimension: no_dials {
      hidden: yes
      type: number
      sql: ${TABLE}.no_dials ;;
    }


    dimension: rollover_value {
      type: number
      sql: cast((power(10,${no_dials}) - 1) as bigint);;
    }

  dimension: rollover {
    type: yesno
    sql: ${TABLE}.ROLLOVER = 1;;
  }


  dimension: reading {
    group_label: "1 - Latest read"
    type: number
    sql: ${TABLE}.reading ;;
  }

    dimension_group: read {
      group_label: "1 - Latest read"
      type: time
      timeframes: [date]
      sql: ${TABLE}.read_date ;;
    }







    dimension: previous_reading {
      group_label: "2 - Previous read"
      type: number
      sql: ${TABLE}.previous_reading ;;
    }

    dimension_group: previous_read {
      group_label: "2 - Previous read"
      type: time
      timeframes: [date]
      sql: ${TABLE}.previous_read_date ;;
    }

  dimension: days {
    group_label: "2 - Previous read"
    type: number
    sql: ${TABLE}.days ;;
  }

  dimension: consumption {
    group_label: "2 - Previous read"
    type: number
    sql: ${TABLE}.consumption ;;
  }

  dimension: adu {
    group_label: "2 - Previous read"
    type: number
    label: "ADU"
    description:"Average Daily Usage"
    value_format: "0.00"
    sql: ${TABLE}.ADU ;;
  }










    dimension: ytd_reading {
      group_label: "3 - Long term read"
      label: "Long term reading"
      description: "Long term read data refers to the latest meter read which is at least 365 days before the most recent read"
      type: number
      sql: ${TABLE}.ytd_reading ;;
    }

    dimension: ytd_read {
      group_label: "3 - Long term read"
      label: "Long term read date"
      description: "Long term read data refers to the latest meter read which is at least 365 days before the most recent read"
      type: date
      sql: ${TABLE}.ytd_read_date ;;
    }


    dimension: ytd_adu {
      group_label: "3 - Long term read"
      type: number
      label: "Long term ADU"
      description: "Long term read data refers to the latest meter read which is at least 365 days before the most recent read"
      value_format: "0.00"
      sql: ${TABLE}.ytd_ADU ;;
    }


    dimension: ytd_days {
      label: "number of days between reads"
      group_label: "3 - Long term read"
      description: "Long term read data refers to the latest meter read which is at least 365 days before the most recent read"
      type: number
      sql: ${TABLE}.ytd_days ;;
    }

    dimension: ytd_consumption {
      label: "Consumption"
      group_label: "3 - Long term read"
      description: "Long term read data refers to the latest meter read which is at least 365 days before the most recent read"
      type: number
      sql: ${TABLE}.ytd_consumption ;;
    }











    dimension: ftd_reading {
      group_label: "4 - First read"
      label: "First read"
      type: number
      sql: ${TABLE}.ftd_reading ;;
    }

    dimension: ftd_read {
      group_label: "4 - First read"
      label: "First read date"
      type: date
      sql: ${TABLE}.ftd_read_date ;;
    }


    dimension: ftd_adu {
      group_label: "4 - First read"
      type: number
      label: "First read ADU"
      value_format: "0.00"
      sql: ${TABLE}.ftd_ADU ;;
    }

    dimension: ftd_days {
      label: "First read number of days"
      description: "Number of days between first read and most recent read"
      group_label: "4 - First read"
      type: number
      sql: ${TABLE}.ftd_days ;;
    }

    dimension: ftd_consumption {
      label: "First read consumption"
      group_label: "4 - First read"
      description: "Consumption between first read and most recent read"
      type: number
      sql: ${TABLE}.ftd_consumption ;;
    }











    set: detail {
      fields: [
        meter_id,
        serial_no,
        reading,
        read_date,
        rollover,
        previous_reading,
        previous_read_date,
        days,
        consumption,
        adu
      ]
    }

  measure: site_adu {
    label: "Site latest ADU"
    type: sum
    drill_fields: [site.site_nm,site.site_real_id,water_meters.serial_no,adu]
    value_format: "0.00"
    sql: ${adu} ;;
  }


    measure: site_above_benchmark {
      type:  string
      sql:  case when ${site_adu} > site_types.daily_cons*(1+site_types.perc_fluc/100) then 'yes' else 'no' end ;;
    }


    measure: site_annual_ADU {
      label: "Site Annual ADU"
      drill_fields: [site.site_nm,site.site_real_id,water_meters.serial_no,ytd_adu]
      type: sum
      value_format: "0.00"
      sql: ${ytd_adu} ;;
    }

    measure: site_first_ADU {
      label: "Site First ADU"
      description: "ADU between first and most recent read"
      group_label: "4 - First read"
      drill_fields: [site.site_nm,site.site_real_id,water_meters.serial_no,ftd_adu]
      type: sum
      value_format: "0.00"
      sql: ${ftd_adu} ;;
    }


    dimension: long_term_ADU{
      description: "This dimension is site_annual_ADU unless annual ADU is 0 or blank, in which case value is taken from longest possible period"
      type: number
      sql:
        case
                  when ${TABLE}.ytd_adu = 0 or ${TABLE}.ytd_adu is null then ${TABLE}.ftd_adu
                  else ${TABLE}.ytd_adu
                  end
        ;;

      }

      measure: site_annual_or_longest_ADU {
        label: "Site Annual or longest period ADU"
        drill_fields: [site.site_nm,site.site_real_id,water_meters.serial_no,long_term_ADU]
        type: sum
        value_format: "0.00"
        sql: ${long_term_ADU} ;;
      }


      measure: average_ADU {
        type: average
        sql: ${adu} ;;
      }

    }
