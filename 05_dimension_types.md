<h1 style="color:rgb(100,81,138)">Dimension Types</h1>

Dimensions can have many different types. In this lesson we'll look at examples of all these types and briefly talk about when to use them. For more complete documentation about types, check out our [Dimension and Filter Types](https://docs.looker.com/reference/field-reference/dimension-type-reference) page.<br /><br />

<h4 style="color:rgb(141,127,185)">String</h4>

The `string` type should be used with data that includes words or letters. It is the default dimension type.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: first_name {
  type: string
  sql: ${TABLE}.first_name ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/users?qid=WFTdUVRhnxmOQmJwZ2wAso" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a><br /><br />

<h4 style="color:rgb(141,127,185)">Number</h4>

The `number` type should be used with number or integer data.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
dimension: sale_price {
  type: number
  sql: ${TABLE}.sale_price ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/order_items?qid=N3Ra8idDQbiCqSaEfRA1w8" target="_blank"><i class="fa fa-search"></i> Explore the <b>Sale Price</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/dimension-type-reference#number" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: number</b> Docs</a><br /><br />

<h4 style="color:rgb(141,127,185)">YesNo</h4>

The `yesno` type allows you to set a condition, then the field will return "Yes" if that condition is true, and "No" if it is not true.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> View File</a>
</div>
```
dimension: is_complete {
  type: yesno
  sql: ${status} = 'complete' ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/orders?qid=95MSkVN6ERioo0phGuor7J" target="_blank"><i class="fa fa-search"></i> Explore the <b>Is Complete</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/dimension-type-reference#yesno" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: yesno</b> Docs</a><br /><br />

If you've programmed before you may be familiar with the concept of "boolean" (true or false) values. Boolean values are generally treated as yes/no values in Looker. Be sure to read Looker's [type: yesno](https://docs.looker.com/reference/field-reference/dimension-type-reference#yesno) documentation to understand how to deal with booleans correctly.<br /><br />


<h4 style="color:rgb(141,127,185)">Tier</h4>

The `tier` type allows you to set various ranges, then bucket number or integer data into those ranges. You can also choose what style will be used to display those ranges to users.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: age_tier {
  type: tier
  tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
  style: integer
  sql: ${age} ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/users?qid=2uOecXdCneJVI3ECLmtqeQ" target="_blank"><i class="fa fa-search"></i> Explore the <b>Age Tier</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/dimension-type-reference#tier" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: tier</b> Docs</a><br /><br />

You'll see that there are two new parameters required for `tier` dimensions. The `tiers` parameter defines the number ranges you're interested in. The `style` parameter defines how the tiers will be displayed to users; you can see the available styles [in our documentation](https://docs.looker.com/reference/field-reference/dimension-type-reference#style).<br /><br />

<h4 style="color:rgb(141,127,185)">Location</h4>

The `location` type allows you to create a location field, if you have a latitude and longitude available. This is useful when you need to map things in Looker, or calculate distances between items.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/distribution_centers.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">distribution_centers</a> View File</a>
</div>
```
dimension: location {
  type: location
  sql_latitude: ${latitude} ;;
  sql_longitude: ${longitude} ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/distribution_centers?qid=IIdOxpvWI8tqcOXrWJDDzC&toggle=vis" target="_blank"><i class="fa fa-search"></i> Explore the <b>Location</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/dimension-type-reference#location" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: location</b> Docs</a><br /><br />

You'll see that there are two new parameters required for `location` dimensions. The `sql_latitude` parameter defines the latitude of the location. The `sql_longitude` parameter defines the longitude of the location. These could be references to latitude and longitude fields (as in this example), or other SQL that extracts a latitutde and longitude.<br /><br />

<h4 style="color:rgb(141,127,185)">Distance</h4>

The `distance` type allows you to calculate the distance between two `type: location` dimensions.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: distance_from_distribution_center {
  type: distance
  start_location_field: distribution_center.location
  end_location_field: users.location
  units: miles
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/order_items?qid=rLtv5Q4dONlWcttSQtnL8d" target="_blank"><i class="fa fa-search"></i> Explore the <b>Distance from Distribution Center</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/dimension-type-reference#distance" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: distance</b> Docs</a><br /><br />

You'll see that there are three new parameters required for `distance` dimensions. The `start_location_field` parameter defines the first location. The `end_location_field` parameter defines the second location. The `units` field defines the distance units you'd like to be used; you can see the available units [in our documentation](https://docs.looker.com/reference/field-reference/dimension-type-reference#distance).<br /><br />

<h4 style="color:rgb(141,127,185)">Zipcode</h4>

The `zipcode` type should be used with 5-digit US zipcode data.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: zip {
  type: zipcode
  sql: ${TABLE}.zipcode ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/users?qid=ttlB9Dh8Ox3yiMk0JsVfN4" target="_blank"><i class="fa fa-search"></i> Explore the <b>Zipcode</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/dimension-type-reference#zipcode" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: zipcode</b> Docs</a><br /><br />



<h2 style="color:rgb(100,81,138)">Next Step</h2>

Next, we'll look at some additional dimension options that are commonly used.

<div style="float:left;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/04_dimension_basics.md">&#10094; Dimension Basics</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/06_dimension_options.md">Dimension Options &#10095;</a>
</div>