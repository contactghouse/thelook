<h1 style="color:rgb(100,81,138)">Dimension Options</h1>

Dimensions have many other options that you can take advantage of. They are all documented on our [Field Parameters](https://docs.looker.com/reference/field-reference) docs, but we'll go over some of the most frequently used options here.<br /><br />

<h4 style="color:rgb(141,127,185)">primary_key</h4>

The `primary_key` parameter defines which dimension represents the primary key of a view. Defining a primary key is *very* important in LookML modeling, because it gives Looker the information it needs to properly calculate measures (discussed further in the [Explore Basics](https://learn.looker.com/projects/e-commerce/files/12_explore_basics.md) lesson). In fact, if you forget to define a primary key, Looker will generally hide measures from that view to avoid displaying bad information to users.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> View File</a>
</div>
```
dimension: id {
  primary_key: yes
  type: number
  sql: ${TABLE}.id ;;
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/orders?qid=C812bAP7NtykDkbk0WV0Jy" target="_blank"><i class="fa fa-search"></i> Explore the <b>ID</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-params/primary_key" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>primary_key</b> Docs</a><br /><br />

<h4 style="color:rgb(141,127,185)">link</h4>

The `link` parameter allows you to create links to other URLs that are related to your data. You specify a `label` that users will see, a `url` that the link should go to, and optionally an `icon_url` to an icon image that users will see. To reveal the link, users click on the ellipses icon next to the data.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/products.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">products</a> View File</a>
</div>
```
dimension: brand {
  type: string
  sql: ${TABLE}.brand ;;
  link: {
    label: "Google Search"
    url: "http://www.google.com/search?q={{ value }}"
    icon_url: "http://google.com/favicon.ico"
  }
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/products?qid=kUVCENJS8RwyTBEpyO5MIS" target="_blank"><i class="fa fa-search"></i> Explore the <b>Brand</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-params/link" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>link</b> Docs</a><br /><br />

You can insert dynamic values into the URL by using the liquid templating language, which is covered in our [advanced tutorials](https://learn.looker.com/projects/advanced_lookml/files/06_liquid_templating.md) and documented on our [Liquid Variable Reference](https://docs.looker.com/reference/liquid-variables) docs page.<br /><br />

<h4 style="color:rgb(141,127,185)">case</h4>

The `case` parameter allows you to specify several SQL conditions, and the value that will appear to users if the condition is satisfied. This is similar to the SQL `CASE WHEN` function.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
dimension: price_range {
  case: {
    when: {
      sql: ${sale_price} < 20 ;;
      label: "Inexpensive"
    }
    when: {
      sql: ${sale_price} >= 20 AND ${sale_price} < 100 ;;
      label: "Normal"
    }
    when: {
      sql: ${sale_price} >= 100 ;;
      label: "Expensive"
    }
    else: "Unknown"
  }
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/order_items?qid=vfSw74vli4lb21XTZv7ixV" target="_blank"><i class="fa fa-search"></i> Explore the <b>Price Range</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-params/case" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>case</b> Docs</a><br /><br />

The conditions are evaluated in the order that you write them. As soon as one condition evaluates to true that label is assigned to that row of data.<br /><br />

<h4 style="color:rgb(141,127,185)">value_format_name and value_format</h4>

The `value_format_name` and `value_format` parameters allow you to easily format dimensions for your users.

The `value_format_name` parameter lets you specify one of several pre-defined formats, which you can see listed in our <a href="https://docs.looker.com/reference/field-params/value_format_name" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">value_format_name</a> doc. You can create additional named formats by using the <a href="https://docs.looker.com/reference/model-params/named_value_format" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">named_value_format</a> parameter.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
dimension: sale_price {
  type: number
  sql: ${TABLE}.sale_price ;;
  value_format_name: usd
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/order_items?qid=erbvZUcYcmE7q2ECi0612y" target="_blank"><i class="fa fa-search"></i> Explore the <b>Sale Price</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-params/value_format_name" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>value_format_name</b> Docs</a><br /><br />

The `value_format` parameter allows you to specify formats that you don't think you'll want to use elsewhere. You can read about how to specify these formats in the <a href="https://docs.looker.com/reference/field-params/value_format" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">value_format</a> doc.<br /><br />

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/products.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">products</a> View File</a>
</div>
```
dimension: cost {
  type: number
  sql: ${TABLE}.cost ;;
  value_format: "$0.00"
}
```
<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn.looker.com/explore/e_commerce/users?qid=WFTdUVRhnxmOQmJwZ2wAso" target="_blank"><i class="fa fa-search"></i> Explore the <b>Cost</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/field-params/value_format" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>value_format</b> Docs</a><br /><br />



<h2 style="color:rgb(100,81,138)">Next Step</h2>

Next we'll look at dimension groups, which help deal with time-based information efficiently.

<div style="float:left;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/05_dimension_types.md">&#10094; Dimension Types</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/07_dimension_groups.md">Dimension Groups &#10095;</a>
</div>
