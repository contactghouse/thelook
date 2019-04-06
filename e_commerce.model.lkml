include: "*.view.lkml"

connection: "thelook"

explore: order_items {
  join: orders {
    sql_on: ${orders.1pk_order_id} = ${order_items.order_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: users {
    sql_on: ${users.1pk_user_id} = ${orders.user_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: inventory_items {
    sql_on: ${inventory_items.1pk_inventory_item_id} = ${order_items.inventory_item_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: products {
    sql_on: ${products.1pk_product_id} = ${inventory_items.product_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join:  distribution_centers {
    sql_on: ${distribution_centers.1pk_distribution_center_id} = ${inventory_items.distribution_center_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: order_items_products {
    sql: ;;
    relationship: one_to_one
  }
}

explore: products { }

explore: orders { }

explore: users {
  fields: [ALL_FIELDS*, -users.distance_from_distribution_center]
}

explore:distribution_centers { }
