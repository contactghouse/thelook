view: orders {
  sql_table_name: public.orders ;;

  dimension: pk1_order_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: created {
    description: "Order date"
    type: time
    datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    description: "Order Status - Shipped, Returned, Processing, Cancelled, Complete"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: is_complete {
    description: "Has the order been completed"
    type: yesno
    sql: ${status} = 'complete' ;;
  }

  measure: count {
    description: "Count"
    type: count
    filters: {
      field: 1pk_order_id
      value: "not null"
    }
  }
}
