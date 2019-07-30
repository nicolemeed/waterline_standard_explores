  view: site_status_current {
    derived_table: {
      sql: select
              site.site_id,
              ss.StatusId,
              sitestatusname.statusname,
              ss.StartChangeDate,
              ss.StartChangeUserId,
              ss.StartChangeUserName,
              ss.StartDate,
              ss.StatusText,
              ss.AuditId,
              ss.EndChangeDate,
              ss.EndChangeUserId,
              ss.EndChangeUserName,
              ss.EndDate
              from site
              outer apply (select top 1 * from sitestatuses where site.site_id = sitestatuses.siteid  order by sitestatuses.startdate desc) ss
              left join sitestatusname on ss.statusid = sitestatusname.statusid
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: site_id {
      type: number
      sql: ${TABLE}.site_id ;;
    }

    dimension: status_id {
      type: number
      sql: ${TABLE}.StatusId ;;
    }

    dimension: status_name {
      label: "Site Status"
      type: string
      sql: ${TABLE}.statusname ;;
    }

    dimension: start_change_date {

      type: date
      sql: ${TABLE}.StartChangeDate ;;
    }

    dimension: start_change_user_id {
      type: number
      sql: ${TABLE}.StartChangeUserId ;;
    }

    dimension: start_change_user_name {
      type: string
      sql: ${TABLE}.StartChangeUserName ;;
    }

    dimension: start_date {
      label: "Site Status Change Date"
      type: date
      sql: ${TABLE}.StartDate ;;
    }

    dimension: status_text {
      type: string
      sql: ${TABLE}.StatusText ;;
    }

    dimension: audit_id {
      type: number
      sql: ${TABLE}.AuditId ;;
    }

    dimension: end_change_date {
      type: date
      sql: ${TABLE}.EndChangeDate ;;
    }

    dimension: end_change_user_id {
      type: number
      sql: ${TABLE}.EndChangeUserId ;;
    }

    dimension: end_change_user_name {
      type: string
      sql: ${TABLE}.EndChangeUserName ;;
    }

    dimension: end_date {
      type: date
      sql: ${TABLE}.EndDate ;;
    }

    set: detail {
      fields: [
        site_id,
        status_id,
        status_name,
        start_change_date,
        start_change_user_id,
        start_change_user_name,
        start_date,
        status_text,
        audit_id,
        end_change_date,
        end_change_user_id,
        end_change_user_name,
        end_date
      ]
    }
  }
