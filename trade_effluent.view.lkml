view: trade_effluent {
  sql_table_name: dbo.Trade_Effluent ;;

  dimension: trade_effluent_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Trade_Effluent_Id ;;
  }

  dimension: borehole_annual_consumption {
    type: number
    sql: ${TABLE}.Borehole_Annual_Consumption ;;
  }

  dimension: cod {
    type: number
    sql: ${TABLE}.COD ;;
  }

  dimension_group: consent_end {
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
    sql: ${TABLE}.Consent_End_Date ;;
  }

  dimension: consent_number {
    type: string
    sql: ${TABLE}.Consent_Number ;;
  }

  dimension_group: consent_start {
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
    sql: ${TABLE}.Consent_Start_Date ;;
  }

  dimension: domestic_allowance {
    type: number
    sql: ${TABLE}.Domestic_Allowance ;;
  }

  dimension: evaporation {
    type: number
    sql: ${TABLE}.Evaporation ;;
  }

  dimension: file_id {
    type: number
    sql: ${TABLE}.FileID ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }

  dimension: losses {
    type: number
    sql: ${TABLE}.losses ;;
  }

  dimension: losses_type {
    type: number
    sql: ${TABLE}.lossesType ;;
  }

  dimension: max_cod {
    type: number
    sql: ${TABLE}.MaxCOD ;;
  }

  dimension: max_ss {
    type: number
    sql: ${TABLE}.MaxSS ;;
  }

  dimension: minus_consumption {
    type: number
    sql: ${TABLE}.minusConsumption ;;
  }

  dimension: minus_consumption_type {
    type: number
    sql: ${TABLE}.minusConsumptionType ;;
  }

  dimension: other_annual_consumption {
    type: number
    sql: ${TABLE}.Other_Annual_Consumption ;;
  }

  dimension: percentage_discharged {
    type: number
    sql: ${TABLE}.Percentage_Discharged ;;
  }

  dimension: rainwater_annual_consumption {
    type: number
    sql: ${TABLE}.Rainwater_Annual_Consumption ;;
  }

  dimension: river_sea_annual_consumption {
    type: number
    sql: ${TABLE}.RiverSea_Annual_Consumption ;;
  }

  dimension: DPID {
    label: "DPID"
    type: string
    sql: ${TABLE}.Serial_No ;;
  }

  dimension: site_id {
    type: number
    sql: ${TABLE}.Site_Id ;;
  }

  dimension: ss {
    type: number
    sql: ${TABLE}.SS ;;
  }

  dimension_group: status_change {
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
    sql: ${TABLE}.StatusChangeDate ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.StatusId ;;
  }

  dimension: tariff_id {
    type: number
    sql: ${TABLE}.Tariff_Id ;;
  }

  dimension: trade_effluent_type_id {
    type: number
    sql: ${TABLE}.Trade_Effluent_Type_Id ;;
  }

  dimension: water_company_id {
    type: number
    sql: ${TABLE}.Water_Company_Id ;;
  }

  dimension: yearly_volume {
    type: number
    sql: ${TABLE}.Yearly_Volume ;;
  }

  measure: count {
    type: count
    drill_fields: [trade_effluent_id, site_account_dpids.count]
  }
}
