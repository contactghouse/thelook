view: order_items_products {
  view_label: "Order Items"

  measure: total_profit {
    description: "Product Total Sale Price - Products Total Cost"
    type: number
    sql: ${order_items.total_sale_price} - ${products.total_cost} ;;
  }
}
