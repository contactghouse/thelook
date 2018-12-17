<h1 style="color:rgb(100,81,138)">"Try It Yourself" Answers</h1>

This page includes the answers to all of the **Try it Yourself** questions throughout this tutorial.<br /><br />



<a name="dimension-basics"></a>

<h2 style="color:rgb(100,81,138)">Dimension Basics</h2>

<h4 style="color:rgb(141,127,185)">Question</h4>

The `orders` table in our dataset has a string column called `traffic_source` that hasn't yet been added in LookML. Try adding it using the information you've learned.

<h4 style="color:rgb(141,127,185)">Answer</h4>

Add the following dimension to the <a href="https://learn.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> view file:

```
dimension: traffic_source {
  type: string
  sql: ${TABLE}.traffic_source ;;
}
```

<h4 style="color:rgb(141,127,185)">Double Check</h4>

After adding this dimension, [explore the orders view](https://learn.looker.com/explore/e_commerce/orders) to see it in action.<br /><br />



<a name="dimension-basics"></a>

<h2 style="color:rgb(100,81,138)">Measure Basics</h2>

<h4 style="color:rgb(141,127,185)">Question</h4>

The `products` view has a dimension called `retail_price`. Try adding a `total_retail_price` measure that adds up the total price.

<h4 style="color:rgb(141,127,185)">Answer</h4>

Add the following dimension to the <a href="https://learn.looker.com/projects/e-commerce/files/products.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">products</a> view file:

```
dimension: total_retail_price {
  type: sum
  sql: ${retail_price} ;;
}
```

<h4 style="color:rgb(141,127,185)">Double Check</h4>

After adding this dimension, [explore the products view](https://learn.looker.com/explore/e_commerce/products) to see it in action.<br /><br />



<a name="explore-basics"></a>

<h2 style="color:rgb(100,81,138)">Explore Basics</h2>

<h4 style="color:rgb(141,127,185)">Question</h4>

Try adding as many joins as possible to the `products` explore.

<h4 style="color:rgb(141,127,185)">Answer</h4>

Add the following joins to the `products` explore in the <a href="https://learn.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> model file:

```
explore: products {
  join: inventory_items {
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    type: left_outer
    relationship: one_to_many
  }

  join:  distribution_centers {
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: order_items {
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: orders {
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: users {
    sql_on: ${users.id} = ${orders.user_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: user_order_facts {
    sql_on: ${user_order_facts.user_id} = ${users.id} ;;
    type: left_outer
    relationship: one_to_one
  }
}
```

<h4 style="color:rgb(141,127,185)">Double Check</h4>

After adding these joins, [explore the products explore](https://learn.looker.com/explore/e_commerce/products) to see it in action.