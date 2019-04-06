<h1 style="color:rgb(100,81,138)">Dimension Groups</h1>

Dimension groups allow you to create multiple time-based dimensions at the same time, based on a time column in your database. Currently, there are no other use of dimension groups.

It is possible to create individual time-based dimensions, but the normal pattern in Looker is to use a dimension group.<br /><br />



<h2 style="color:rgb(100,81,138)">Anatomy of a Dimension Group</h2>

All dimension groups require a type of time, the list of timeframes to be generated, and a SQL definition.  Dimension groups assume you're providing a datetime, but if you have another type of time information, you can specify that with the `datatype` parameter.

For example, the <a href="https://learn.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> view file has a dimension group called `created` inside of it:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> View File</a>
</div>
```
dimension_group: created {
  type: time
  datatype: datetime
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
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/orders?qid=3p4HPhJyr3HYuEEkdN1Bar" target="_blank"><i class="fa fa-search"></i> Explore All of the Created Time Dimensions</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-params/dimension_group" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>dimension_group</b> Docs</a><br /><br />

If we break this down:

+ The first row `dimension_group: created {` creates a dimension group with the name of `created` (more on naming below).

+ The second row `type: time` is required for all dimension groups.

+ The third row `datatype: datetime` specifies what type of time information you'll be providing in the `sql` parameter. All of the supported data types are listed on the <a href="https://docs.looker.com/reference/field-params/dimension_group" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">dimension_group</a> docs page. In this case this row could be omitted, since "datetime" is the default value.

+ The fourth row `timeframes: [` starts a list of timeframes that you want to be generated. All of the possible timeframes are defined on our <a href="https://docs.looker.com/reference/field-params/dimension_group" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">dimension_group</a> docs page, and are discussed in the next section.

+ The thirteenth row `sql: ${TABLE}.created_at ;;` defines the underlying time information that should be used.

+ The last row `}` closes the dimension.<br /><br />



<h2 style="color:rgb(100,81,138)">Dimension Group Referencing and Naming</h2>

Dimension groups create a set of dimensions all at once. They are named by combining the dimension group name and the timeframe. For example, in the "created" dimension group above, the following dimensions would be created:

+ created_raw
+ created_time
+ created_date
+ created_week
+ created_month
+ created_quarter
+ created_year

If you wanted to reference these dimensions, you would need to use `${created_time}`, `${created_date}`, etc. If you simply used `${created}` Looker will generate an error. Also, please note that the "raw" timeframe is not displayed to users, and is typically used for SQL calculations and joins.<br /><br />



<h2 style="color:rgb(100,81,138)">Creating Individual Time Dimensions</h2>

You can create individual, time-based dimensions if you like. You'll just need to know the `type:` that you want to use, which you'll find listed on our [Dimension and Filter Types](https://docs.looker.com/reference/field-reference/dimension-type-reference#individual_time_and_date_types) docs page. All of the individual time based types start with `date_`. For example:

```
dimension: created_week {
  type: date_week
  sql: ${TABLE}.created_at ;;
}
```

<br />


<h2 style="color:rgb(100,81,138)">Next Step</h2>

Now that you have a grasp of dimensions and dimension groups, it's time to look at their sibling: measures.

<div style="float:left;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/06_dimension_options.md">&#10094; Dimension Options</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/08_measure_basics.md">Measure Basics &#10095;</a>
</div>