<h1 style="color:rgb(100,81,138)">Measure Options</h1>

Measures have many other options that you can take advantage of. They are all documented on our [Field Parameters](https://docs.looker.com/reference/field-reference) docs page, but we'll go over some of the most frequently used options here.<br /><br />

<h4 style="color:rgb(141,127,185)">drill_fields</h4>

In Looker, there is an option to show all of the records that comprise a measure when a user clicks it. This is called "drilling", and it's easiest to understand with counts. For example, if a measure showed a count of 20 orders, the user could click on it to see information listed about each of those 20 orders. You can also enable this feature for non-count measures, but it's not as obvious what's happening. For example, if a user clicked on a total of $1,000 in sales, the drill would show a list of the orders that comprised those sales.

The parameter that turns on this feature is called `drill_fields`. It accepts a list of fields that you would like to show when a user clicks on a measure.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
measure: count {
  type: count
  drill_fields: [id, first_name, last_name]
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/users?qid=3IPYDe0Zt4rjaA5psUfn4c" target="_blank"><i class="fa fa-search"></i> Explore the <b>Count</b> Measure</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-params/drill_fields" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>drill_fields</b> Docs</a><br /><br />

The `drill_fields` parameter can also be used on dimensions, but has a slightly different effect. You can also read about that in the [drill_fields documentation](https://docs.looker.com/reference/field-params/drill_fields#drilling_into_dimensions).<br /><br />

<h4 style="color:rgb(141,127,185)">filters</h4>

Another very useful feature of measures is that you can filter them. While users can of course apply filters on the Explore page, those filters will get applied to *everything*, whereas this feature allows you to filter *only* a specific measure. For example, our <a href="https://learn.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> view has a regular count, but we can also create a count of women:


<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
measure: female_count {
  type: count
  filters: {
    field: gender
    value: "Female"
  }
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/users?qid=iPeeFg0qUfF1ctAcO0s4XT" target="_blank"><i class="fa fa-search"></i> Explore the <b>Female Count</b> Measure</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-params/filters" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>filters</b> Docs</a><br /><br />

The `filters` parameter works by first specifying the dimension you want to filter on, and then the value you want to set it equal to. In the "female_count" example above, we're saying that we want to filter the count by setting the gender dimension equal to "Female".<br /><br />



<h2 style="color:rgb(100,81,138)">Next Step</h2>

With an understanding of views and the fields that live within them, we can now move onto model files and how to link views together.

<div style="float:left;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/09_measure_types.md">&#10094; Measure Types</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/11_model_basics.md">Model Basics &#10095;</a>
</div>