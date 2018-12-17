<h1 style="color:rgb(100,81,138)">Measure Types</h1>

Measures have many different types. In this lesson we'll look at examples of the most used types and briefly talk about when to use them. For more complete documentation about types, check out our [Measure Types](https://docs.looker.com/reference/field-reference/measure-type-reference) page.<br /><br />

<h4 style="color:rgb(141,127,185)">Count</h4>

The `count` type provides a count of items. The count type doesn't need a `sql` parameter. It always provides a count of rows in its view.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> View File</a>
</div>
```
measure: count {
  type: count
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/orders?qid=scD756LkuuL0XcTyHHyGtZ" target="_blank"><i class="fa fa-search"></i> Explore the <b>Count</b> Measure</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/measure-type-reference#count" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: count</b> Docs</a><br /><br />

<h4 style="color:rgb(141,127,185)">Sum</h4>

The `sum` type adds together the values provided in the `sql` parameter.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
measure: total_sale_price {
  type: sum
  sql: ${sale_price} ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/order_items?qid=ngfYyTLCYM870HFLAJamwm" target="_blank"><i class="fa fa-search"></i> Explore the <b>Total Profit</b> Measure</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/measure-type-reference#sum" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: sum</b> Docs</a><br /><br />

<h4 style="color:rgb(141,127,185)">Average</h4>

The `average` type finds the mean of the values provided in the `sql` parameter.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
measure: average_sale_price {
  type: average
  sql: ${sale_price} ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/order_items?qid=6WdS06pnGsfQBvIHSVbO7o" target="_blank"><i class="fa fa-search"></i> Explore the <b>Total Profit</b> Measure</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/measure-type-reference#average" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: average</b> Docs</a><br /><br />

<h4 style="color:rgb(141,127,185)">Min</h4>

The `min` type finds the minimum of the values provided in the `sql` parameter. Please note this will not work with a time or date, but our documentation describes a [workaround](https://docs.looker.com/reference/field-reference/measure-type-reference#date).

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
measure: least_expensive_item {
  type: min
  sql: ${sale_price} ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/order_items?qid=tWbuDRohCLFD7UUSJhSDIW" target="_blank"><i class="fa fa-search"></i> Explore the <b>Least Expensive Item</b> Measure</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/measure-type-reference#min" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: min</b> Docs</a><br /><br />

<h4 style="color:rgb(141,127,185)">Max</h4>

The `max` type finds the maximum of the values provided in the `sql` parameter. Please note this will not work with a time or date, but our documentation describes a [workaround](https://docs.looker.com/reference/field-reference/measure-type-reference#date).

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
measure: most_expensive_item {
  type: max
  sql: ${sale_price} ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/order_items?qid=vRtljLJ7mIrq25ybNkgiKk" target="_blank"><i class="fa fa-search"></i> Explore the <b>Total Profit</b> Measure</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/measure-type-reference#max" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: max</b> Docs</a><br /><br />

<h4 style="color:rgb(141,127,185)">Number</h4>

The `number` type should be used to combine multiple measures, or when performing math on a measure.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
measure: total_profit {
  type: number
  sql: ${total_sale_price} - ${product.total_cost} ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/order_items?qid=6MdgO656En8m33e7b33Pkq" target="_blank"><i class="fa fa-search"></i> Explore the <b>Total Profit</b> Measure</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-reference/measure-type-reference#number" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: number</b> Docs</a><br /><br />


<h2 style="color:rgb(100,81,138)">Next Step</h2>

Next, we’ll look at some additional measure options that are commonly used.

<div style="float:left;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/08_measure_basics.md">&#10094; Measure Basics</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/10_measure_options.md">Measure Options &#10095;</a>
</div>
