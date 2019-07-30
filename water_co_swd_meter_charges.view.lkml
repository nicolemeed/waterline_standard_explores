view: water_co_swd_meter_charges {
  sql_table_name: dbo.water_co_swd_meter_charges ;;

  dimension: charge_value {
    label: "Annual Charge"
    type: number
    sql: ${TABLE}.ChargeValue ;;
  }

  dimension: meter_charge_id {
    type: number
    sql: ${TABLE}.MeterChargeId ;;
  }

  dimension: meter_size_id {
    type: number
    sql: ${TABLE}.MeterSizeId ;;
  }

  dimension: swd_meter_size {
    label: "SWD meter size"
    description: "the size of the meter that the SWD is being charged at"
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

  dimension: water_co_id {
    type: number
    sql: ${TABLE}.WaterCoId ;;
  }

  dimension: year_id {
    type: number
    sql: ${TABLE}.YearId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
