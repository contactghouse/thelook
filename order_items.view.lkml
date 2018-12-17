view: order_items {
  sql_table_name: public.order_items ;;

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: 1pk_order_item_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension_group: created {
    description: "Date ordered"
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
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: shipped {
    description: "Date shipped"
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
    sql: ${TABLE}.shipped_at ;;
  }

  dimension_group: delivered {
    description: "Date delivered"
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
    sql: ${TABLE}.delivered_at ;;
  }

  dimension_group: returned {
    description: "Date returned, if any"
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    description: "Sale price"
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
  }

  dimension: price_range {
    description: "Price category (Inexpensive, Normal, Expensive)"
    case: {
      when: {
        sql: ${sale_price} < 20 ;;
        label: "Inexpensive"
      }
      when: {
        sql: ${sale_price} >= 20 AND ${sale_price} < 100 ;;
        label: "Normal"
      }
      when: {
        sql: ${sale_price} >= 100 ;;
        label: "Expensive"
      }
      else: "Unknown"
    }
  }

  dimension: status {
    description: "Order Item Status - Shipped, Returned, Processing, Cancelled, Complete"
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    description: "Count"
    type: count
    filters: {
        field: order_item_id
        value: "not null"
    }
    drill_fields: [
      order_item_id,
      created_time,
      shipped_time,
      delivered_time,
      returned_time,
      sale_price,
      status,
      products.name
    ]
  }

  measure: total_sale_price {
    description: "Sum of sale price"
    type: sum
    sql: ${sale_price} ;;
  }

  measure: average_sale_price {
    description: "Average Sale Price"
    type: average
    sql: ${sale_price} ;;
  }

  measure: least_expensive_item {
    description: "The minimum sale price"
    type: min
    sql: ${sale_price} ;;
  }

  measure: most_expensive_item {
    description: "The maximum sale price"
    type: max
    sql: ${sale_price} ;;
  }
}
