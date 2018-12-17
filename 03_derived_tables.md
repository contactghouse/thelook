<h1 style="color:rgb(100,81,138)">Derived Tables</h1>

If you need to, you can create database tables using Looker's **derived tables** feature, which you can read about in more detail in our [Derived Tables](https://docs.looker.com/data-modeling/learning-lookml/derived-tables) documentation. Derived tables have many uses, such as calculating summary metrics and pre-aggregating data.

Derived tables can be calculated on the fly each time they're queried, or they can be stored in your database. If you want derived tables to be storable, your admins will have needed to enable that feature when they setup Looker. This type of derived table is covered in our [advanced tutorials](https://learn.looker.com/projects/advanced_lookml/files/04_persistent_derived_tables.md).

When you create a derived table, you'll write a SQL query against your database. The results of that query are then treated as a table within Looker. You can then use that table as normal to create dimensions, measures, etc. in LookML.

<div style="border:2px solid rgb(141,127,185);border-radius:5px;padding:8px;">
<span style="font-weight:bold;color:rgb(141,127,185);">Best Practice Alert</span><br /><br />

If you're familiar with SQL or traditional business intelligence tools, you may be tempted to overuse derived tables. They certainly have valuable and powerful uses, but they are also rigid. Use regular LookML modeling when possible to create more dynamic and re-usable LookML that gives your users more freedom.<br /><br />

You might also want to use derived tables to improve query performance, which <i>is</i> a valid strategy in some contexts. However, many modern databases are so fast that this is unnecessary. Consult your database admins if you're considering this route.
</div><br /><br />



<h2 style="color:rgb(100,81,138)">Anatomy of a Derived Table</h2>

Derived tables only require you to specify their SQL. For example, the top of the <a href="https://learn.looker.com/projects/e-commerce/files/user_order_facts.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">user_order_facts</a> view file looks like this:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/user_order_facts.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">user_order_facts</a> View File</a>
</div>
```
view: user_order_facts {
  derived_table: {
    sql:
      SELECT
        user_id,
        MIN(DATE(created_at)) AS first_order_date
      FROM
        users
      GROUP BY
        customer_id ;;
  }
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>User Order Facts</b> View</a> <a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/view-params/derived_table" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>derived_table</b> Docs</a> <a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/view-params/sql-for-derived_table" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>sql</b> Docs</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/view-params/persist_for-for-derived_table" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>persist_for</b> Docs</a><br /><br />

If we break this down:

+ The first row `view: user_order_facts {` creates a view with the name of `user_order_facts`.

+ The second row `derived_table: {` declares the the view is going to be a derived table.

+ The third row `sql:` starts the section of LookML where you'll write the query for the derived table.

+ The fourth to tenth rows contain the actual SQL for the derived table. Remember to end the SQL with `;;`

+ The last row `}` closes the derived table.

You’ll notice there are a couple other dimensions within the <a href="https://learn.looker.com/projects/e-commerce/files/user_order_facts.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">user_order_facts</a> view, which we'll discuss in our [next lesson](https://learn.looker.com/projects/e-commerce/files/04_dimension_basics.md).<br /><br />



<h2 style="color:rgb(100,81,138)">Understanding Persistence</h2>

In the example above, the derived table is not being persisted (i.e. "stored") in the database. However, persistence is often very useful for improving the performance of derived tables. Please check out our [advanced tutorials](https://learn.looker.com/projects/advanced_lookml/files/04_persistent_derived_tables.md) or read our [Derived Tables](https://docs.looker.com/data-modeling/learning-lookml/derived-tables#adding_persistence) documentation to fully understand this feature.<br /><br />



<h2 style="color:rgb(100,81,138)">Other Derived Table Settings</h2>

All of the additional derived tables settings that you can apply in LookML can be found on our [View Parameters](https://docs.looker.com/reference/view-reference) docs page.<br /><br />



<h2 style="color:rgb(100,81,138)">Next Step</h2>

Next, we'll look at the basics of dimensions.

<div style="float:left;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/02_view_basics.md">&#10094; View Basics</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/04_dimension_basics.md">Dimension Basics &#10095;</a>
</div>
