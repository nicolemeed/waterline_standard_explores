view: water_co {
  sql_table_name: dbo.water_co ;;

  dimension: active_primary_charge_type_id {
    type: number
    sql: ${TABLE}.ActivePrimaryChargeTypeId ;;
  }

  dimension: active_secondary_charge_type_id {
    type: number
    sql: ${TABLE}.ActiveSecondaryChargeTypeId ;;
  }

  dimension: active_tertiary_charge_type_id {
    type: number
    sql: ${TABLE}.ActiveTertiaryChargeTypeId ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.ADDRESS1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.ADDRESS2 ;;
  }

  dimension: chrg_type_id {
    type: number
    sql: ${TABLE}.CHRG_TYPE_ID ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: co_notes {
    type: string
    sql: ${TABLE}.CO_NOTES ;;
  }

  dimension: contact {
    type: string
    sql: ${TABLE}.CONTACT ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.COUNTY ;;
  }

  dimension_group: date_modified {
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
    sql: ${TABLE}.DateModified ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: end_date_included {
    type: string
    sql: ${TABLE}.EndDateIncluded ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.FAX ;;
  }

  dimension: has_primary_charges {
    type: string
    sql: ${TABLE}.HasPrimaryCharges ;;
  }

  dimension: has_secondary_charges {
    type: string
    sql: ${TABLE}.HasSecondaryCharges ;;
  }

  dimension: has_tertiary_charges {
    type: string
    sql: ${TABLE}.HasTertiaryCharges ;;
  }

  dimension: logo {
    type: string
    sql: ${TABLE}.LOGO ;;
  }

  dimension: market_type_id {
    type: number
    sql: ${TABLE}.MARKET_TYPE_ID ;;
  }

  dimension: needs_standing_charges {
    type: string
    sql: ${TABLE}.needs_standing_charges ;;
  }

  dimension: postcode {
    type: string
    sql: ${TABLE}.POSTCODE ;;
  }

  dimension: prcnt_to_swr {
    type: number
    sql: ${TABLE}.PRCNT_TO_SWR ;;
  }

  dimension: swd_banded_charges_active {
    type: string
    sql: ${TABLE}.SwdBandedChargesActive ;;
  }

  dimension: swd_charges_active {
    type: string
    sql: ${TABLE}.SwdChargesActive ;;
  }

  dimension: swd_meter_charges_active {
    type: string
    sql: ${TABLE}.SwdMeterChargesActive ;;
  }

  dimension: swd_rvcharges_active {
    type: string
    sql: ${TABLE}.SwdRVChargesActive ;;
  }

  dimension: swd_tariff_charges_active {
    type: string
    sql: ${TABLE}.SwdTariffChargesActive ;;
  }

  dimension: tel {
    type: string
    sql: ${TABLE}.TEL ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.URL ;;
  }

  dimension: waste_wco {
    type: number
    sql: ${TABLE}.WASTE_WCO ;;
  }

  dimension: wco_id {
    type: number
    sql: ${TABLE}.WCO_ID ;;
  }

  dimension: wco_nm {
    label: "Water Company Name"
    type: string
    sql: ${TABLE}.WCO_NM ;;
  }

  dimension: wco_type_id {
    type: number
    sql: ${TABLE}.WCO_TYPE_ID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
