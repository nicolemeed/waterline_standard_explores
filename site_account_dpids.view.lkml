view: site_account_dpids {
  sql_table_name: dbo.SiteAccount_DPIDs ;;

  dimension: account_id {
    type: number
    sql: ${TABLE}.Account_Id ;;
  }

  dimension: trade_effluent_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.Trade_Effluent_Id ;;
  }

  measure: count {
    type: count
    drill_fields: [trade_effluent.trade_effluent_id]
  }
}
