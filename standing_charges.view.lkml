view: standing_charges {
  sql_table_name: dbo.standing_charges ;;

  dimension: standing_charge_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.standing_charge_id ;;
  }

  dimension: custom_charge_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CUSTOM_CHARGE_ID ;;
  }

  dimension_group: date_modified {
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
    sql: ${TABLE}.DateModified ;;
  }

  dimension: level_id {
    hidden: yes
    type: number
    sql: ${TABLE}.LEVEL_ID ;;
  }

  dimension: standing_charge_level {
    description: "Primary / Secondary / Tertiary"
    sql: case when ${level_id} = 1 then 'Primary'
      when ${level_id} = 2 then 'Secondary'
      when ${level_id} = 3 then 'Tertiary' else null end
      ;;
  }

  dimension: meter_size_id {
    hidden: yes
    type: number
    sql: ${TABLE}.meter_size_id ;;
  }

  dimension: tariff_charge_id {
    hidden: yes
    type: number
    sql: ${TABLE}.TARIFF_CHARGE_ID ;;
  }

  dimension: type_id {
    hidden: yes
    type: number
    sql: ${TABLE}.TYPE_ID ;;
  }

  dimension: standing_charge_type {
    description: "Standard / Tariff / Custom"
    sql: case when ${type_id} = 1 then 'Standard'
      when ${type_id} = 2 then 'Tariff'
      when ${type_id} = 3 then 'Custom' else null end
      ;;
  }



  dimension: wco_id {
    hidden: yes
    type: number
    sql: ${TABLE}.wco_id ;;
  }

  measure: count {
    type: count
    drill_fields: [standing_charge_id, standing_charge_prices.count]
  }
}
