view: swd_charges {
  sql_table_name: dbo.SWD_Charges ;;

  dimension: band {
    type: string
    sql: ${TABLE}.Band ;;
  }

  dimension: charge_order {
    type: number
    sql: ${TABLE}.Charge_Order ;;
  }

  dimension: charge_type_id {
    type: number
    sql: ${TABLE}.Charge_Type ;;
  }

  dimension: swd_charge_type {
    description: "RV / Banded / Meter Size / Tariff based"
    sql: case when ${charge_type_id} = 0 then 'NA'
    when ${charge_type_id} = 2 then 'RV Charge'
    when ${charge_type_id} = 3 then 'Banded Charges'
    when ${charge_type_id} = 7 then 'Meter Size Charges'
    when ${charge_type_id} = 8 then 'Tariff Charges'
    else null end ;;
  }

  dimension: meter_size_id {
    type: number
    sql: ${TABLE}.MeterSizeId ;;
  }

  dimension: rateable_value {
    type: number
    sql: ${TABLE}.RateableValue ;;
  }

  dimension: rv_charge_name {
    type: string
    sql: ${TABLE}.RvChargeName ;;
  }

  dimension: site_account_id {
    type: number
    sql: ${TABLE}.Site_Account_ID ;;
  }

  dimension: tariff_id {
    type: number
    sql: ${TABLE}.TariffId ;;
  }

  measure: count {
    type: count
    drill_fields: [rv_charge_name]
  }
}
