view: company_discount {
  sql_table_name: dbo.CompanyDiscount ;;

  dimension: bill_total_discount_amount {
    type: number
    sql: ${TABLE}.BillTotalDiscountAmount ;;
  }

  dimension: bill_total_discount_type {
    type: number
    sql: ${TABLE}.BillTotalDiscountType ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}.CompanyId ;;
  }

  dimension: discount_id {
    type: number
    sql: ${TABLE}.DiscountId ;;
  }

  dimension: standing_charge_amount {
    type: number
    sql: ${TABLE}.StandingChargeAmount ;;
  }

  dimension: standing_charge_type {
    type: number
    sql: ${TABLE}.StandingChargeType ;;
  }

  dimension: supply_discount {
    group_label: "Company wide charges"
    label: "Supply charge value"
    type: number
    sql: ${TABLE}.SupplyDiscount ;;
  }

  dimension: supply_discount_type {
    group_label: "Company wide charges"
    label: "Supply charge type"
    type: string
    sql: case when ${TABLE}.SupplyDiscountType = 1 then '%' when ${TABLE}.SupplyDiscountType = 2 then '£' else '' end ;;
  }

  dimension: surface_water_amount {
    type: number
    sql: ${TABLE}.SurfaceWaterAmount ;;
  }

  dimension: surface_water_type {
    type: number
    sql: ${TABLE}.SurfaceWaterType ;;
  }

  dimension: tariff_amount {
    type: number
    sql: ${TABLE}.TariffAmount ;;
  }

  dimension: tariff_type {
    type: number
    sql: ${TABLE}.TariffType ;;
  }

  dimension: waste_discount {
    group_label: "Company wide charges"
    label: "Waste charge value"
    type: number
    sql: ${TABLE}.WasteDiscount ;;
  }

  dimension: waste_discount_type {
    group_label: "Company wide charges"
    label: "Waste charge type"
    type: number
    sql:case when ${TABLE}.WasteDiscountType = 1 then '%' when ${TABLE}.WasteDiscountType = 2 then '£' else '' end ;;
  }

  dimension: waste_tariff_amount {
    type: number
    sql: ${TABLE}.WasteTariffAmount ;;
  }

  dimension: waste_tariff_type {
    type: number
    sql: ${TABLE}.WasteTariffType ;;
  }

  dimension: water_company_id {
    type: number
    sql: ${TABLE}.WaterCompanyId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
