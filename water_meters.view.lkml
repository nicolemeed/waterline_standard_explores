view: water_meters {
  sql_table_name: dbo.water_meters ;;

  dimension: airtime_cancelled {
    hidden: yes
    type: string
    sql: ${TABLE}.AirtimeCancelled ;;
  }

  dimension: co_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CO_ID ;;
  }

  dimension: combo_meter_id {
    hidden: yes
    type: number
    sql: ${TABLE}.COMBO_METER_ID ;;
  }

  dimension_group: date_disused {
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
    sql: ${TABLE}.DateDisused ;;
  }

  dimension: disused {
    type: yesno
    sql: ${TABLE}.DISUSED = 0 ;;
  }

  dimension: external_ref {
    hidden: yes
    type: string
    sql: ${TABLE}.externalRef ;;
  }

  dimension: file_id {
    hidden: yes
    type: number
    sql: ${TABLE}.FileID ;;
  }

  dimension: gis_x {
    type: string
    sql: ${TABLE}.GisX ;;
  }

  dimension: gis_y {
    type: string
    sql: ${TABLE}.GisY ;;
  }

  dimension: gprs {
    type: string
    sql: ${TABLE}.GPRS ;;
  }

  dimension: has_logger {
    type: number
    sql: ${TABLE}.HAS_LOGGER ;;
  }

  dimension: imp_met {
    hidden: yes
    type: string
    sql: ${TABLE}.IMP_MET ;;
  }

  dimension_group: install {
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
    sql: ${TABLE}.InstallDate ;;
  }

  dimension: is_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.IS_REVENUE ;;
  }

  dimension: latest_lbread_comments {
    hidden: yes
    type: string
    sql: ${TABLE}.LatestLBReadComments ;;
  }

  dimension_group: latest_lbread {
    hidden: yes
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
    sql: ${TABLE}.LatestLBReadDate ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.LOCATION ;;
  }

  dimension_group: logger_comission {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.LoggerComissionDate ;;
  }

  dimension: logger_company_id {
    type: number
    sql: ${TABLE}.loggerCompanyId ;;
  }

  dimension: logger_company_reference {
    type: string
    sql: ${TABLE}.LoggerCompanyReference ;;
  }

  dimension: logger_company_reference_unique {
    type: string
    sql: ${TABLE}.LoggerCompanyReferenceUnique ;;
  }

  dimension: logger_data_charge {
    type: string
    sql: ${TABLE}.LoggerDataCharge ;;
  }

  dimension_group: logger_install {
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
    sql: ${TABLE}.loggerInstallDate ;;
  }

  dimension: logger_installer_user_id {
    type: number
    sql: ${TABLE}.loggerInstallerUserId ;;
  }

  dimension: logger_no {
    type: string
    sql: ${TABLE}.LOGGER_NO ;;
  }

  dimension: logger_sim {
    type: string
    sql: ${TABLE}.LoggerSim ;;
  }

  dimension: logger_type {
    type: string
    sql: ${TABLE}.LOGGER_TYPE ;;
  }

  dimension: maintenance_company_id {
    type: number
    sql: ${TABLE}.MaintenanceCompanyId ;;
  }

  dimension: manufacturer {
    type: string
    sql: ${TABLE}.MANUFACTURER ;;
  }

  dimension: max_read {
    type: number
    sql: ${TABLE}.MAX_READ ;;
  }

  dimension: measurement_type {
    type: string
    sql: ${TABLE}.MEASUREMENT_TYPE ;;
  }

  dimension: meter_alias {
    type: string
    sql: ${TABLE}.MeterAlias ;;
  }

  dimension: meter_id {
    type: number
    sql: ${TABLE}.METER_ID ;;
  }

  dimension: meter_nm {
    type: string
    sql: ${TABLE}.METER_NM ;;
  }

  dimension: meter_size_id {
    type: number
    sql: ${TABLE}.METER_SIZE_ID ;;
  }


  dimension: meter_size {
    type: number
    sql: case when ${meter_size_id} = 0 then 0
when ${meter_size_id} = 2 then 12
when ${meter_size_id} = 3 then 15
when ${meter_size_id} = 4 then 20
when ${meter_size_id} = 5 then 25
when ${meter_size_id} = 6 then 30
when ${meter_size_id} = 7 then 35
when ${meter_size_id} = 8 then 40
when ${meter_size_id} = 9 then 45
when ${meter_size_id} = 10 then 50
when ${meter_size_id} = 11 then 55
when ${meter_size_id} = 12 then 60
when ${meter_size_id} = 13 then 65
when ${meter_size_id} = 14 then 70
when ${meter_size_id} = 15 then 75
when ${meter_size_id} = 16 then 80
when ${meter_size_id} = 17 then 85
when ${meter_size_id} = 18 then 90
when ${meter_size_id} = 19 then 95
when ${meter_size_id} = 20 then 100
when ${meter_size_id} = 21 then 125
when ${meter_size_id} = 22 then 200
when ${meter_size_id} = 23 then 250
when ${meter_size_id} = 24 then 300
when ${meter_size_id} = 28 then 22
when ${meter_size_id} = 29 then 28
when ${meter_size_id} = 30 then 42
when ${meter_size_id} = 31 then 150
when ${meter_size_id} = 33 then 10
when ${meter_size_id} = 34 then 13
when ${meter_size_id} = 35 then 1
else 0 end



    ;;
  }

  dimension: meter_type_id {
    type: number
    sql: ${TABLE}.MeterTypeID ;;
  }

  dimension: meter_units {
    type: string
    sql: ${TABLE}.METER_UNITS ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.MODEL ;;
  }

  dimension: network_type_id {
    type: number
    sql: ${TABLE}.NetworkTypeID ;;
  }

  dimension: no_dials {
    type: number
    sql: ${TABLE}.NO_DIALS ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: pit_reference {
    type: string
    sql: ${TABLE}.PitReference ;;
  }

  dimension: pulse_output_port {
    type: string
    sql: ${TABLE}.PULSE_OUTPUT_PORT ;;
  }

  dimension: pulse_port_tested {
    type: string
    sql: ${TABLE}.PULSE_PORT_TESTED ;;
  }

  dimension: pulse_rate {
    type: number
    sql: ${TABLE}.PULSE_RATE ;;
  }

  dimension: read_frequency {
    type: number
    sql: ${TABLE}.ReadFrequency ;;
  }

  dimension: resolved_serial_no {
    type: string
    sql: ${TABLE}.ResolvedSerialNo ;;
  }

  dimension: return_to_sewer {
    type: number
    sql: ${TABLE}.ReturnToSewer ;;
  }

  dimension: return_to_sewer_type {
    type: number
    sql: ${TABLE}.ReturnToSewerType ;;
  }

  dimension: serial_no {
    type: string
    sql: ${TABLE}.SERIAL_NO ;;
  }

  dimension: signal_strength_id {
    type: number
    sql: ${TABLE}.SignalStrengthId ;;
  }

  dimension: site_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.SITE_ID ;;
  }

  dimension: technolog_meter_reference {
    type: string
    sql: ${TABLE}.technologMeterReference ;;
  }

  dimension: technolog_mprn {
    type: string
    sql: ${TABLE}.TECHNOLOG_MPRN ;;
  }

  dimension: tru_read_logger_installation_confirmed {
    type: string
    sql: ${TABLE}.truReadLoggerInstallationConfirmed ;;
  }

  dimension: true_read_logger_schedule_id {
    type: number
    sql: ${TABLE}.trueReadLoggerScheduleId ;;
  }

  dimension: water_balance {
    type: string
    sql: ${TABLE}.WaterBalance ;;
  }

  dimension: year_of_manufacture {
    type: string
    sql: ${TABLE}.YEAR_OF_MANUFACTURE ;;
  }

  dimension: yearly_volume_estimate {
    type: number
    sql: ${TABLE}.YearlyVolumeEstimate ;;
  }

  measure: count {
    type: count
    drill_fields: [site.sis_site_id]
  }
}
