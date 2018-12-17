<h1 style="color:rgb(100,81,138)">Dimension Basics</h1>

In the same way that a **view** is similar to a SQL table, a **dimension** is similar to a SQL column. However, there are a few nuances to keep in mind.

First, a dimension can take its values directly from a single table column as-is, but it can also represent transformations and combinations of those columns. For example, a dimension could represent a first name column, but it could also represent the first letter of that name, or combine it with a last name.

Second, dimensions are the options your users will use to group their data. This is important from a SQL perspective, because dimensions always go into the `GROUP BY` clause of the SQL that Looker generates. Consequently, your dimensions cannot be aggregates like counts or sums. In Looker, aggregates are handled by measures, which we'll [see later](https://learn.looker.com/projects/e-commerce/files/08_measure_basics.md).<br /><br />



<h2 style="color:rgb(100,81,138)">Anatomy of a Basic Dimension</h2>

All dimensions need at least a name, a type, and a SQL definition.  For example, the <a href="https://learn.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> view file has a dimension called `first_name` inside of it:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: first_name {
  type: string
  sql: ${TABLE}.first_name ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/users?qid=jtPswL67nirLQVwtX0qhmT" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/field-params/dimension" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>dimension</b> Docs</a> <a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/field-reference/dimension-type-reference" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type</b> Docs</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-params/sql#sql_for_dimensions" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>sql</b> Docs</a><br /><br />

If we break this down:

+ The first row `dimension: first_name {` creates a dimension with the name of `first_name`.

+ The second row `type: string` gives the dimension a type. All of the possible types are defined on our [Dimension and Filter Types](https://docs.looker.com/reference/field-reference/dimension-type-reference) docs page, but we'll also go over them in the [next lesson](https://learn.looker.com/projects/e-commerce/files/05_dimension_types.md).

+ The third row `sql: ${TABLE}.first_name ;;` defines how the dimension should be calculated. Any SQL that your database supports can be written here, as long as it is not an aggregate, and as long as the result matches the `type` of the dimension you've chosen. For example, you shouldn't write SQL that results in a number if you've chosen a type of "string".

  The pattern `${TABLE}.column_name` is super common in LookML development and is discussed next. Also remember to end this SQL-type parameter with two semi-colons (`;;`).

+ The last row `}` closes the dimension.<br /><br />



<h2 style="color:rgb(100,81,138)">References in the sql Parameter</h2>

When you're writing your `sql` parameters, it's important to know about the three types of references you can make. When we say "field" we mean either a dimension or measure.

Pattern | Examples | Definition
--------|----------|-----------
`${TABLE}.field_name` | `${TABLE}.status`<br />`${TABLE}.sale_price` | This pattern automatically replaces the `${TABLE}` variable with the database table that is associated with the view where the dimension lives.
`${field_name}` | `${status}`<br />`${sale_price}` | This pattern references an existing field from within the same view.
`${view_name.field_name}` | `${order.status}`<br />`${order_items.sale_price}` | This pattern references an existing field from a *different* view. Using this pattern does require that you have established the proper joins between views, which we'll discuss a [little later](https://learn.looker.com/projects/e-commerce/files/12_explore_basics.md).

<br />



<h2 style="color:rgb(100,81,138)">More Complicated Dimensions</h2>

Just to see a quick example of the different types of references you can use in the `sql` parameter, and to show a slightly more complicated dimension, take a look at this section from the <a href="https://learn.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> view file:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: first_name {
  type: string
  sql: ${TABLE}.first_name ;;
}

dimension: last_name {
  type: string
  sql: ${TABLE}.last_name ;;
}

dimension: full_name {
  type: string
  sql: ${first_name} || ' ' || ${last_name} ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/users?qid=ltsyxuWnOFmmnF19du7MTv" target="_blank"><i class="fa fa-search"></i> Explore the 3 Name Dimensions</a> <a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/field-params/dimension" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>dimension</b> Docs</a> <a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/field-reference/dimension-type-reference" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type</b> Docs</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-params/sql#sql_for_dimensions" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>sql</b> Docs</a><br /><br />

Notice that the first name and last name dimensions above use the `${TABLE}.field_name` pattern, while the full name dimension uses the `${field_name}` pattern. The full name dimension also uses the SQL `||` operator to combine the first and last names into a single dimension.<br /><br />



<h2 style="color:rgb(100,81,138)">Try it Yourself</h2>

The `orders` table in our dataset has a string column called `traffic_source` that hasn't yet been added in LookML. Try adding it using the information you've learned.

<a href="https://learn.looker.com/projects/e-commerce/files/z_answers.md#dimension-basics" style="color:rgb(234,138,47);font-size:12px;"><i class="fa fa-check-square-o"></i> See the Answer</a><br /><br />



<h2 style="color:rgb(100,81,138)">Next Step</h2>

Next, we'll look at examples of all the available dimension types.

<div style="float:left;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/03_derived_tables.md">&#10094; Derived Tables</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/05_dimension_types.md">Dimension Types &#10095;</a>
</div>