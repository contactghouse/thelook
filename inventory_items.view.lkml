view: inventory_items {
  sql_table_name: public.inventory_items ;;

  dimension: 1pk_inventory_item_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: distribution_center_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_distribution_center_id ;;
  }

  dimension_group: created {
    description: "Date when item was introduced to inventory"
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

  dimension_group: sold {
    description: "Date when item was sold"
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
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    description: "Count"
    type: count
    filters:{
      field: 1pk_inventory_item_id
      value: "not null"
    }
    drill_fields: [
      1pk_inventory_item_id,
      created_time,
      sold_time,
      products.name,
      distribution_centers.name
    ]
  }
}
