<h1 style="color:rgb(100,81,138)">View Basics</h1>

As mentioned in the [LookML Basics](https://learn.looker.com/projects/e-commerce/files/01_lookml_basics.md) lesson, a **view** in Looker corresponds to a table in your database. You can also create your own database tables with Looker, and turn that into a view, but we'll cover that feature in the [next lesson](https://learn.looker.com/projects/e-commerce/files/03_derived_tables.md).<br /><br />



<h2 style="color:rgb(100,81,138)">Anatomy of a Basic View</h2>

Basic views are simple to define in LookML, and only require 1 or 2 parameters. For example, the top of the <a href="https://learn.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> view file looks like this:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> View File</a>
</div>
```
view: orders {
  sql_table_name: public.orders ;;
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/orders" target="_blank"><i class="fa fa-search"></i> Explore the <b>Orders</b> View</a> <a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/view-params/view" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>view</b> Docs</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/view-params/sql_table_name-for-view" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>sql_table_name</b> Docs</a><br /><br />

If we break this down:

+ The first row `view: orders {` creates a view with the name of `orders`.

+ The second row `sql_table_name: public.orders ;;` tells Looker which database table to associate with this view.

  When a Looker admin creates a connection in Looker, they define a default schema (a.k.a. "database" in MySQL). If that's the schema you want, and you name the view with exactly the same name as its table, you don't even need to add the `sql_table_name` parameter.

  Also note that the row ends with `;;`. This is how Looker knows you're done writing the table name, and is the way all SQL-type parameters are ended in Looker.

You'll notice there are a lot of other dimensions and measures within the <a href="https://learn.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> view, but we'll discuss those separately in our <a href="https://learn.looker.com/projects/e-commerce/files/04_dimension_basics.md">dimension</a> and <a href="https://learn.looker.com/projects/e-commerce/files/08_measure_basics.md">measure</a> lessons.<br /><br />



<h2 style="color:rgb(100,81,138)">Other View Settings</h2>

All of the additional view-level settings that you can apply in LookML can be found on our [View Parameters](https://docs.looker.com/reference/view-reference) docs page.<br /><br />



<h2 style="color:rgb(100,81,138)">Next Step</h2>

Next, we'll look at creating your own database tables with Looker's derived table functionality.

<div style="float:left;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/01_lookml_basics.md">&#10094; LookML Basics</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/03_derived_tables.md">Derived Tables &#10095;</a>
</div>