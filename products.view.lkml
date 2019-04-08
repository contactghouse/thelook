view: products {
  sql_table_name: public.products ;;

  dimension: 1pk_product_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    description: "Product Cost"
    type: number
    sql: ${TABLE}.cost ;;
    value_format: "$0.00"
  }

  dimension: retail_price {
    description: "Product Retail Price"
    type: number
    sql: ${TABLE}.retail_price ;;
    value_format_name: usd
  }

  dimension: sku {
    # LAMS
    # rule_exemptions: {
    #   F4: "this field is self descriptive"
    # }
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: department {
    description: "Product Department"
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: brand {
    description: "Product Brand"
    type: string
    sql: ${TABLE}.brand ;;
    link: {
      label: "Google Search"
      url: "http://www.google.com/search?q={{ value }}+Clothing"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: name {
    description: "Product name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: category {
    description: "Product category"
    type: string
    sql: ${TABLE}.category ;;
  }

  measure: total_cost {
    description: "Sum of product cost"
    type: sum
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: count {
    description: "Count"
    type: count
    filters: {
      field: 1pk_product_id
      value: "not null"
    }
    drill_fields: [
      1pk_product_id,
      cost,
      retail_price,
      sku,
      department,
      brand,
      name,
      category
    ]
  }
}
