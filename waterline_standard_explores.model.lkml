connection: "waterscan_aws"

include: "*.view.lkml"



explore: account_summary  {
  description: "All prices are for the current year (19/20). The base table for this explore is the site_accounts table. Any sites, meters or tariffs which are not linked to an account will not appear in results."
from:site_accounts
  sql_always_where: (${year_range.year_id} = 22 OR ${year_range.year_id} IS NULL)
  AND (${waste_year_range.year_id} = 22 OR ${waste_year_range.year_id} IS NULL)
  ;;

  join: site {
    relationship: one_to_many
    sql_on: ${site.site_id} = ${account_summary.site_id} ;;
  }

  join: company_details {
  from: co_details
  relationship: many_to_one
    sql_on: ${site.co_id} = ${company_details.co_id} ;;
    fields: [company_details.co_nm,company_details.co_id]
  }

  join: supply_company_discount {
    from:  company_discount
    relationship: one_to_one
    sql_on: ${site.co_id}= ${supply_company_discount.company_id} and ${supply_company_discount.water_company_id} = case when ${account_summary.validate_against_id} = 2 then ${account_summary.wholesaler_water_co_id} else ${account_summary.wco_id} end ;;
    fields: [supply_company_discount.supply_discount,supply_company_discount.supply_discount_type]
  }

  join: waste_company_discount {
    from:  company_discount
    relationship: one_to_one
    sql_on: ${site.co_id}= ${waste_company_discount.company_id} and ${waste_company_discount.water_company_id} = case when ${account_summary.validate_against_id} = 2 then ${account_summary.wholesaler_waste_co_id} else ${account_summary.waste_co_id} end ;;
    fields: [waste_company_discount.waste_discount,waste_company_discount.waste_discount_type]
  }

  join: site_account_meter_audits {
    relationship: many_to_one
    sql_on: ${site_account_meter_audits.account_id} = ${account_summary.account_id} and ${site_account_meter_audits.removed_date} is null ;;
     fields: []
  }
  join: meters {
    from: water_meters
    relationship:  one_to_one
    sql_on: ${meters.meter_id} =  ${site_account_meter_audits.meter_id} ;;
    fields: [meters.serial_no,meters.meter_size]
  }


  join: site_account_dpids {
    relationship: one_to_many
    sql_on:  ${account_summary.account_id} = ${site_account_dpids.account_id} ;;
    fields: []
  }

 join: trade_effluent {
    relationship: one_to_one
    sql_on:  ${site_account_dpids.trade_effluent_id} = ${trade_effluent.trade_effluent_id} ;;
    fields: [DPID]
  }


  join: supply_tariff {
    from: tariff_names
    relationship:  one_to_one
    sql_on:  ${account_summary.tariff_id} = ${supply_tariff.tariff_id};;
    fields: [supply_tariff.name]
  }

  join: supply_tariff_prices {
    from: tariff_prices
    relationship: many_to_one
    sql_on: ${supply_tariff_prices.tariff_id} = ${supply_tariff.tariff_id};;
    fields: [supply_tariff_prices.supply_cost,supply_tariff_prices.supply_fixed_cost]
  }

  join: waste_tariff {
    from: tariff_names
    relationship:  one_to_one
    sql_on:  ${account_summary.waste_tariff_id} = ${waste_tariff.tariff_id};;
  }

  join: waste_tariff_prices {
    from: tariff_prices
    relationship: many_to_one
    sql_on: ${waste_tariff_prices.tariff_id} = ${waste_tariff.tariff_id};;
    fields: [waste_tariff_prices.waste_cost,waste_tariff_prices.waste_fixed_cost]
  }
  join: year_range {
    relationship: one_to_one
    sql_on: ${supply_tariff_prices.year_id} = ${year_range.year_id} ;;
    fields: []
  }

  join: waste_year_range {
    from: year_range
    relationship: one_to_one
    sql_on: ${waste_tariff_prices.year_id} = ${waste_year_range.year_id} ;;
    fields: []
  }

  join: supply_wholesaler {
    from: water_co
    relationship: one_to_one
    sql_on: ${account_summary.wholesaler_water_co_id} = ${supply_wholesaler.wco_id};;
    fields: [wco_nm]
  }

  join: waste_wholesaler {
    from: water_co
    relationship: one_to_one
    sql_on: ${account_summary.wholesaler_waste_co_id} = ${waste_wholesaler.wco_id};;
    fields: [wco_nm]
  }

  join: supply_retailer {
    from: water_co
    relationship: one_to_one
    sql_on: ${account_summary.wco_id} = ${supply_retailer.wco_id};;
    fields: [wco_nm]
  }

  join: waste_retailer {
    from: water_co
    relationship: one_to_one
    sql_on: ${account_summary.waste_wco_id} = ${waste_retailer.wco_id};;
    fields: [wco_nm]

    }

    join: two_latest_reads {
      from: adu_two_latest_actual_reads
      relationship: one_to_one
      sql_on: ${meters.meter_id} = ${two_latest_reads.meter_id} ;;
      fields: [two_latest_reads.read_date,two_latest_reads.reading,two_latest_reads.previous_read_date,two_latest_reads.previous_reading,two_latest_reads.adu,two_latest_reads.rollover]
    }

  join: supply_standing_charges {
    from: standing_charges
    relationship: many_to_one
    sql_on: ${site_account_meter_audits.supply_standing_charge_id}=${supply_standing_charges.standing_charge_id} and ${site_account_meter_audits.has_standing_charge} = 'true' ;;
  }

  join: waste_standing_charges {
    from: standing_charges
    relationship: many_to_one
    sql_on: ${site_account_meter_audits.waste_standing_charge_id}=${waste_standing_charges.standing_charge_id} and ${site_account_meter_audits.has_standing_charge} = 'true'  ;;
  }


  join: supply_standing_charge_prices {
    from: standing_charge_prices
    relationship: many_to_one
    sql_on: ${site_account_meter_audits.supply_standing_charge_id} = ${supply_standing_charge_prices.standing_charge_id}  and ${site_account_meter_audits.has_standing_charge} = 'true' and ${supply_standing_charge_prices.year_id}=22 ;;
    fields: [supply_standing_charge_prices.supply_cost]
  }

  join: waste_standing_charge_prices {
    from: standing_charge_prices
    relationship: many_to_one
    sql_on: ${site_account_meter_audits.waste_standing_charge_id} = ${waste_standing_charge_prices.standing_charge_id} and ${site_account_meter_audits.has_standing_charge} = 'true' and  ${waste_standing_charge_prices.year_id}=22 ;;
    fields: [waste_standing_charge_prices.waste_cost]
  }

  join: supply_custom_standing_charges {
    from: standing_charge_custom_names
    relationship: many_to_one
    sql_on: ${supply_standing_charges.custom_charge_id} = ${supply_custom_standing_charges.charge_id} ;;
    fields: [supply_custom_standing_charges.name]
  }

  join: waste_custom_standing_charges{
    from: standing_charge_custom_names
    relationship: many_to_one
    sql_on: ${waste_standing_charges.custom_charge_id} = ${waste_custom_standing_charges.charge_id} ;;
    fields: [waste_custom_standing_charges.name]
  }

  join: mdd_tariff_prices {
    relationship: many_to_many
    sql_on: ${account_summary.mddtariff_id} = ${mdd_tariff_prices.mdd_tariff_id} and ${mdd_tariff_prices.year_id} = 22;;
    fields: [cost]
  }

  join: mdd_tariff_names {
    relationship: many_to_many
    sql_on: ${account_summary.mddtariff_id} = ${mdd_tariff_names.mdd_tariff_id};;
    fields: [name]
  }

       join: swd_charges {
       relationship: one_to_many
       sql_on:  ${account_summary.account_id} = ${swd_charges.site_account_id} ;;
      fields: [swd_charges.swd_charge_type]
     }

   join: SWD_meter_based_charges {
  from: water_co_swd_meter_charges
       relationship: one_to_many
       sql_on: ${swd_charges.meter_size_id} = ${SWD_meter_based_charges.meter_size_id} and ${SWD_meter_based_charges.water_co_id} = case when ${account_summary.validate_against_id} = 2 then ${account_summary.wholesaler_waste_co_id} else ${account_summary.waste_co_id} end and ${SWD_meter_based_charges.year_id} = 22;;

    fields: [SWD_meter_based_charges.swd_meter_size,SWD_meter_based_charges.charge_value]
    }

join: SWD_RV_based_charges {
  from: water_co_swd_charges_rv
       relationship: one_to_many
       sql_on: ${swd_charges.rv_charge_name} = ${SWD_RV_based_charges.charge_name} and ${SWD_RV_based_charges.water_co_id} = case when ${account_summary.validate_against_id} = 2 then ${account_summary.wholesaler_waste_co_id} else ${account_summary.waste_co_id} end and ${SWD_RV_based_charges.year_id} = 22 ;;

    fields: [SWD_RV_based_charges.charge_name,SWD_RV_based_charges.charge_per_rv,SWD_RV_based_charges.charge_perc_decimal,SWD_RV_based_charges.description]
}

join: SWD_banded_charges {
  from: bands
  relationship: one_to_many
      sql_on: ${swd_charges.band} = ${SWD_banded_charges.band_nm} and ${SWD_banded_charges.wco_id} = case when ${account_summary.validate_against_id} = 2 then ${account_summary.wholesaler_waste_co_id} else ${account_summary.waste_co_id} end and ${SWD_banded_charges.year_id} = 22;;
    fields: [SWD_banded_charges.price, SWD_banded_charges.band_des, SWD_banded_charges.band_nm]
}

}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



explore: site_details {

  from: site

    join: company_details {
      from: co_details
      relationship: many_to_one
      sql_on: ${site_details.co_id} = ${company_details.co_id} ;;
      fields: [company_details.co_nm]
    }


  join: site_status_current {
    relationship:  one_to_one
    sql_on:  ${site_details.site_id} = ${site_status_current.site_id} ;;
    fields: [site_status_current.status_name,site_status_current.start_date]
  }


  join: site_types {
    relationship: many_to_one
    sql_on: ${site_types.site_type_id} = ${site_details.site_type} ;;
  }

  join: site_types_global {
    relationship: one_to_many
    sql_on: ${site_types.site_type_global_id} = ${site_types_global.site_type_global_id};;
  }
  }


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




 #  explore: meter_reads {
 #   hidden: yes


#  join: water_meters {
#      relationship: many_to_one
#  fields: [water_meters.gis_x,water_meters.gis_y,water_meters.location, water_meters.disused, water_meters.serial_no]
#      sql_on: ${meter_reads.meter_id} = ${water_meters.meter_id} ;;
#      fields: [water_meters.serial_no,water_meters.read_frequency,water_meters.no_dials]
#  }


 #   join: latest_reads {
#      from: adu_two_latest_actual_reads
#      relationship: one_to_one
#      sql_on: ${water_meters.meter_id} = ${latest_reads.meter_id} ;;
 #     fields: [latest_reads.read_date,latest_reads.reading,latest_reads.previous_read_date,latest_reads.previous_reading,latest_reads.adu,two_latest_reads.rollover]
#    }


 # }
