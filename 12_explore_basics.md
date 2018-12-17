<h1 style="color:rgb(100,81,138)">Explore Basics</h1>

An **explore** is how you expose a **view** into the Explore menu. It's also used to combine together multiple views, which is critical for unlocking the full power of Looker.<br /><br />



<h2 style="color:rgb(100,81,138)">Anatomy of a Basic Explore</h2>

Although it is possible to give explores arbitrary names by using additional LookML parameters, typically you'll name an explore with the name of a view. For example, the <a href="https://learn.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> model file has an explore called `product` inside of it:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> Model File</a>
</div>
```
explore: products { }
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/products"><i class="fa fa-search"></i> Explore the <b>Products</b> Explore</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/explore-params/explore" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>explore</b> Docs</a><br /><br />

We've defined a view called "products" in the <a href="https://learn.looker.com/projects/e-commerce/files/products.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">products</a> view file, and created an explore from it. This is not a particularly interesting explore, but it does expose the "products" view into the Explore menu.<br /><br />



<h2 style="color:rgb(100,81,138)">Joining Multiple Views in the Same Explore</h2>

As we've seen, views are similar to SQL tables. Just as you can join tables together in SQL, you can join views together within an explore. Let's look at the more complex and more typical "order_items" explore:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> Model File</a>
</div>
```
explore: order_items {
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

  join: inventory_items {
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: products {
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join:  distribution_centers {
    sql_on: ${distribution_centers.id} = ${inventory_items.distribution_center_id} ;;
    type: left_outer
    relationship: many_to_one
  }
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/order_items"><i class="fa fa-search"></i> Explore the <b>Order Items</b> Explore</a> <a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/explore-params/explore" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>explore</b> Docs</a> <a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/explore-params/join" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>join</b> Docs</a> <a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/explore-params/sql_on" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>sql_on</b> Docs</a><br /><a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/explore-params/type-for-join" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type</b> Docs</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/explore-params/relationship" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>relationship</b> Docs</a><br /><br />

To break down just the first few rows:

+ The first row `explore: order_items {` creates an explore based on the `order_items` view.

+ The second row `join: orders {` joins the `orders` view into the `order_items` view

+ The third row `sql_on: ${orders.id} = ${order_items.order_id} ;;` establishes the join condition between the `order_items` and `orders` view. Notice we can use the `${view_name.field_name}` references that we learned about in the [dimensions lesson](https://learn.looker.com/projects/e-commerce/files/04_dimension_basics.md).

+ The fourth row `type: left_outer` defines the join as a `LEFT JOIN`. The `left_outer` value is the default value, so this row could have been excluded. Using a `LEFT JOIN` is *almost* always the correct decision, because it allows users to see all the data from `order_items`, even if there is no corresponding data in the joined views.

+ The fourth row `relationship: many_to_one` establishes the relationship between the joined views. In this case we're saying there are potentially many order items for one order.

+ The last row `}` closes the join.

The other joins work in the same way. If you use SQL a lot, it might be helpful for you to see how the LookML above would be translated into SQL:

```
SELECT ...
FROM order_items

LEFT JOIN orders
ON orders.id = order_items.order_id

LEFT JOIN users
ON users.id = orders.user_id

LEFT JOIN inventory_items
ON inventory_items.id = order_items.inventory_item_id

LEFT JOIN products
ON products.id = inventory_items.product_id

LEFT JOIN distribution_centers
ON distribution_centers.id = inventory_items.product_distribution_center_id
```

<br />

<h4 style="color:rgb(141,127,185)">Properly Defining the Relationship</h4>

Properly defining the `relationship` parameter in Looker is critical to the proper functioning of your model. If you properly define the relationships, Looker can prevent the problems of fanouts and double-counting. If you're not familiar with "fanouts", you can read about them in [this blog post](https://looker.com/blog/aggregate-functions-gone-bad-and-the-joins-who-made-them-that-way).

When a view is joined directly to an explore, like the `orders` view in the example above, the relationship is *from* the explore *to* the joined view. We're saying here that there could be many order items for one order.

When a view is joined to an explore through another view - such as how `users` joins through `orders` to `order_items` in this example - the relationship being defined is from the intermediate view (`orders`) to the final view (`users`). In this example we're saying there could be many orders for one user.

As mentioned in the [dimension options lesson](https://learn.looker.com/projects/e-commerce/files/06_dimension_options.md), another critical step to keeping things functioning properly is to define a primary key for each view.<br /><br />

<h4 style="color:rgb(141,127,185)">Why Have More than One Explore?</h4>

As we saw above, the view that you reference with `explore:` goes into the `FROM` clause of the SQL statement. Any additional views you add to it with `join:` usually go into a `LEFT JOIN` clause. This means that you'll see every record in the primary view of the explore, but you'll only see joined view records if they have a match in the primary view.

That's a mouthful, so an example may help. In the "order_items" explore we just looked at, you would see every order item, but you would only see users who had some order items associated with them. If you wanted to see every user no matter what, you would probably want to create another explore that started with "users".<br /><br />



<h2 style="color:rgb(100,81,138)">Try it Yourself</h2>

Try adding as many joins as possible to the `products` explore.

<a href="https://learn.looker.com/projects/e-commerce/files/z_answers.md#explore-basics" style="color:rgb(234,138,47);font-size:12px;"><i class="fa fa-check-square-o"></i> See the Answer</a><br /><br />



<h2 style="color:rgb(100,81,138)">You're Finished!</h2>

We hope these basic lessons were helpful to you. When you're ready, move onto our [Advanced LookML Tutorial](https://learn.looker.com/projects/advanced_lookml/files/01_intro.md) to learn about more advanced features.

<div style="float:left;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/11_model_basics.md">&#10094; Model Basics</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn.looker.com/projects/advanced_lookml/files/01_intro.md">Advanced Tutorial &#10095;</a>
</div>
