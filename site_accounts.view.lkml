view: site_accounts {
  label: "Account Info"
  sql_table_name: dbo.site_accounts ;;

  dimension: account_number {
    type: string
    sql: ${TABLE}.ACC_NO ;;
  }

  dimension: account_alias {
    hidden: yes
    type: string
    sql: ${TABLE}.AccountAlias ;;
  }

  dimension: account_function_id {
    type: number
    hidden: yes
    sql: ${TABLE}.account_function_id ;;
  }

  dimension: account_function {
    description: "Invoice Validation / Self Supply / Retail"
    type:  string
    sql:  case when ${account_function_id}=1 then 'Invoice Validation'
          when ${account_function_id}=2 then 'Self Supply'
          when ${account_function_id}=3 then 'Retail'
          else Null
          end;;
  }



  dimension: account_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ACCOUNT_ID ;;
  }

  dimension: band {
    label: "SWD band"
    hidden: yes
    type: string
    sql: ${TABLE}.BAND ;;
  }

  dimension: billing_freq {
    type: number
    hidden: yes
    sql: ${TABLE}.billing_frequency ;;
  }

  dimension: billing_frequency {
    type:  string
    sql:  case when ${billing_freq}=1 then 'Monthly'
          when ${billing_freq}=2 then 'Quarterly'
          when ${billing_freq}=3 then '6 Monthly'
          when ${billing_freq}=4 then 'All Days'
          when ${billing_freq}=5 then 'Annual'
          else Null
          end;;
  }



  dimension: billing_type {
    hidden: yes
    type: number
    sql: ${TABLE}.BILLING_TYPE ;;
  }

  dimension: charge_freq {
    hidden: yes
    type: number
    sql: ${TABLE}.charge_frequency ;;
  }

  dimension: charging_frequency {
    type:  string
    sql:  case when ${charge_freq}=1 then 'Monthly'
          when ${charge_freq}=2 then 'Quarterly'
          when ${charge_freq}=3 then '6 Monthly'
          when ${charge_freq}=4 then 'All Days'
          when ${charge_freq}=5 then 'Annual'
          else Null
          end;;
  }



  dimension: consent_no {
    hidden: yes
    type: string
    sql: ${TABLE}.consent_no ;;
  }

  dimension: exclude_from_bill_creation {
    hidden: yes
    type: string
    sql: ${TABLE}.ExcludeFromBillCreation ;;
  }

  dimension: file_id {
    hidden: yes
    type: number
    sql: ${TABLE}.FileID ;;
  }

  dimension: has_supply_discount {
    group_label: "Supply Discounts"
    type: yesno
    sql: ${TABLE}.HasSupplyDiscount = 'true' ;;
  }

  dimension: has_waste_discount {
    group_label: "Waste Discounts"
    type: yesno
    sql: ${TABLE}.HasWasteDiscount = 'true' ;;
  }

  dimension: headcount {
    hidden: yes
    type: number
    sql: ${TABLE}.headcount ;;
  }

  dimension: include_mdd_charge {
    group_label: "MDD"
    type: yesno
    sql: ${TABLE}.include_mdd_charge = 'true' ;;
  }


  dimension: include_standing_charge {
    hidden: yes
    type: yesno
    sql: ${TABLE}.include_standing_charge = 'true' ;;
  }

  dimension: include_vat {
    label: "VAT"
    type: yesno
    sql: ${TABLE}.include_vat = 'true' ;;
  }


  dimension_group: incoming_transfer {
    group_label: "Transfer In/Out dates"
    type: time
    timeframes: [
   #   raw,
   #   time,
      date,
   #   week,
      month,
  #    quarter,
  #    year
    ]
    sql: ${TABLE}.IncomingTransferDate ;;
  }

  dimension: mdd_exceeded_charge {
    group_label: "MDD"
    type: string
    sql: ${TABLE}.mdd_exceeded_charge ;;
  }

  dimension: mdd_exceeded_litres {
    group_label: "MDD"
    type: number
    sql: ${TABLE}.mdd_exceeded_litres ;;
  }

  dimension: mddtariff_id {
    group_label: "MDD"
    hidden: yes
    type: number
    sql: ${TABLE}.MDDTariffId ;;
  }

  dimension_group: outgoing_transfer {
    group_label: "Transfer In/Out dates"
    type: time
    timeframes: [
   #   raw,
   #   time,
      date,
   #   week,
      month,
    #  quarter,
    #  year
    ]
    sql: ${TABLE}.OutgoingTransferDate ;;
  }

  dimension: rate_val {
    label: "Rateable Value"
    type: number
    sql: ${TABLE}.RATE_VAL ;;
  }

  dimension: site_account_notes {
    type: string
    sql: ${TABLE}.site_account_notes ;;
  }

  dimension: site_id {
    type: number
     hidden: yes
    sql: ${TABLE}.SITE_ID ;;
  }

  dimension: spec_cost_supply {
    hidden: yes
    type: number
    sql: ${TABLE}.SPEC_COST_SUPPLY ;;
  }

  dimension: spec_cost_waste {
    hidden: yes
    type: number
    sql: ${TABLE}.SPEC_COST_WASTE ;;
  }

  dimension: spec_prcnt_2_swrs {
    hidden: yes
    type: number
    sql: ${TABLE}.SPEC_PRCNT_2_SWRS ;;
  }

  dimension: spid {
    group_label: "SPIDs"
    label: "Supply SPID"
    type: string
    sql: ${TABLE}.SPID ;;
  }

  dimension: spply_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.SPPLY_COST ;;
  }

  dimension: standing_charge_id {
    hidden: yes
    type: number
    sql: ${TABLE}.standing_charge_id ;;
  }

  dimension: status_change_date {
    hidden: yes
    type: string
    sql: ${TABLE}.Status_Change_Date ;;
  }

  dimension: status_id {
    hidden: yes
    type: number
    sql: ${TABLE}.Status_ID ;;
  }


  dimension: account_status {
    type: string
    sql: case when ${status_id}=1 then 'Open'
          when ${status_id}=2 then 'Closed'
          when ${status_id}=3 then 'Archived'

          else '0' end ;;


  }

  dimension: supply_discount_type {
    hidden: yes
    type: number
    sql: ${TABLE}.SupplyDiscountType ;;
  }

  dimension: supply_discnt_typ {
    label: "Supply Discount Type"
    description: "% / £"
    group_label: "Supply Discounts"
    type: string
    sql: case when ${supply_discount_type} = 1
          then '%'
          when ${supply_discount_type} = 2
          then '£'
          else null end;;
  }


  dimension: supply_discount_value {
    group_label: "Supply Discounts"
    type: number
    sql: ${TABLE}.SupplyDiscountValue ;;
  }

  dimension: supply_type {
    group_label: "Supply Discounts"
    hidden: yes
    type: number
    sql: ${TABLE}.SUPPLY_TYPE ;;
  }

  dimension: account_type {
    type:  string
    sql:  case when ${supply_type}=1 then 'Supply Only'
          when ${supply_type}=2 then 'Waste Only'
          when ${supply_type}=3 then 'Supply & Waste'
          when ${supply_type}=4 then 'Trade Effluent'
          when ${supply_type}=5 then 'Waste and Trade Effluent'
          when ${supply_type}=6 then 'Assessed'
          when ${supply_type}=7 then 'Surface Water Drainage'
          when ${supply_type}=8 then 'Assessed Supply'
          when ${supply_type}=9 then 'Assessed Waste'
          when ${supply_type}=10 then 'Supply, Waste & Trade Effluent'
          else Null
          end;;
  }

  dimension: tariff_id {
    type: number
    hidden: yes
    sql: ${TABLE}.tariff_id ;;
  }

  dimension: dpid {
    group_label: "SPIDs"
    label: "DPID"
    type: string
    sql: ${TABLE}.TPID ;;
  }

  dimension: trd_eff_id {
    hidden: yes
    type: number
    sql: ${TABLE}.TRD_EFF_ID ;;
  }

  dimension: validate_against_id {
    type: number
    hidden: yes
    sql: ${TABLE}.validate_against_id ;;
  }

  dimension: validate_against {
    description: "Wholesaler / Retailer"
    type: string
    sql: case
          when  ${TABLE}.validate_against_id = 1   then 'Retailer'
          when  ${TABLE}.validate_against_id = 2   then 'Wholesaler'
          else NULL
          end;;
  }


  dimension: waste_discount_type {
    hidden: yes
    type: number
    sql: ${TABLE}.WasteDiscountType ;;
  }


  dimension: waste_discnt_typ {
    type: string
    label: "Waste Discount Type"
    description: "% / £"
    group_label: "Waste Charges"
    sql: case when ${waste_discount_type} = 1
          then '%'
          when ${waste_discount_type} = 2
          then '£'
          else null end;;
  }



  dimension: waste_discount_value {
    group_label: "Waste Discounts"
    type: number
    sql: ${TABLE}.WasteDiscountValue ;;
  }

  dimension: waste_standing_charge_id {
    group_label: "Waste Discounts"
    hidden: yes
    type: number
    sql: ${TABLE}.waste_standing_charge_id ;;
  }

  dimension: waste_tariff_id {
    group_label: "Waste Discounts"
    hidden: yes
    type: number
    sql: ${TABLE}.waste_tariff_id ;;
  }

  dimension: waste_wco_id {
    group_label: "Supplier IDs"
    label: "Waste Retailer ID"
    type: number
    sql: ${TABLE}.waste_wco_id ;;
  }

  dimension: wco_id {
    group_label: "Supplier IDs"
    label: "Supply Retailer ID"
    type: number
    sql: ${TABLE}.WCO_ID ;;
  }

  dimension: wholesaler_waste_co_id {
    group_label: "Supplier IDs"
    label: "Waste Wholesaler ID"
    type: number
    sql: ${TABLE}.WholesalerWasteCoId ;;
  }

  dimension: wholesaler_water_co_id {
    group_label: "Supplier IDs"
    label: "Supply Wholesaler ID"
    type: number
    sql: ${TABLE}.WholesalerWaterCoId ;;
  }

  dimension: wpid {
    group_label: "SPIDs"
    label: "Waste SPID"
    type: string
    sql: ${TABLE}.WPID ;;
  }

  dimension: wst_cost {
    type: number
    sql: ${TABLE}.WST_COST ;;
  }


  dimension: supply_co_id {
    hidden:  yes
    type: number
    sql: case when ${validate_against_id} = 1 then  ${wco_id}
          when ${validate_against_id} = 2 then ${wholesaler_water_co_id}
          else null end;;
  }

  dimension: waste_co_id {
    hidden:  yes
    type: number
    sql: case when ${validate_against_id} = 1 then  ${waste_wco_id}
          when ${validate_against_id} = 2 then ${wholesaler_waste_co_id}
          else null end;;
  }












  measure: count {
    type: count
    drill_fields: [site.sis_site_id]
  }
}
