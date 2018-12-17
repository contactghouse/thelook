<h1 style="color:rgb(100,81,138)">LookML Basics</h1>

Welcome to our e-commerce tutorial. Unlike the [Name Game](https://learn.looker.com/projects/name_game/files/lesson_1_text.md), this tutorial goes into considerably more detail about how to develop in LookML. Since LookML has so many options, this tutorial won't cover every possible detail, but it will cover enough to address the most common use cases.

The data set we're working with here is sales data from an e-commerce clothing store. It has a few, relatively straightforward data tables. Some of the information and join relationships in this schema are redundant, so we've marked those in grey.

<img src="https://docs.looker.com/assets/images/learn-the-look-erd.png">

As mentioned in the intro, you should have a basic comfort level with SQL in order to get the most out of this tutorial and Looker.<br /><br />



<h2 style="color:rgb(100,81,138)">The Fundamental LookML Structures</h2>

There are a few fundamental structures from which you'll build almost everything in LookML:

**Fields** - In general, each bit of data that your users are going to choose from will be represented as a LookML field. There are five different types of fields:

+ *Dimensions* - An easy way to think of dimensions is that they represent a column of data in a database table, or a transformation or combination of columns. There are some nuances which we'll discuss with more detail in a [later lesson](https://learn.looker.com/projects/e-commerce/files/04_dimension_basics.md).

+ *Dimension Groups* - Dimension groups allow you to create many dimensions all at once. Currently, they're solely for use with time based data.

+ *Measures* - Measures represent aggregate functions - like `COUNT`, `SUM`, and `MAX` - in the SQL query that Looker builds.

+ *Filters* - It's important to note that, in general, you don't need to explicitly create filters for your users. The dimensions and measures you create will automatically be available to your users as filters. However, there are some advanced use cases where you need to create a filter that *doesn't* have a dimension or measure associated with it. We won't be covering this type of field in this tutorial, but you can learn about them later in our [advanced tutorials](https://learn.looker.com/projects/advanced_lookml/files/07_parameters_and_templated_filters.md).

+ *Parameters* - The Parameter field type is similar to the Filter field type, but is used for a slightly different use case. As with Filters, we won't be covering this type of field here, but they are also covered in our [advanced tutorials](https://learn.looker.com/projects/advanced_lookml/files/07_parameters_and_templated_filters.md).

**Views** - Views represent the tables in your database. Or, you can create your own tables with Looker, and then make that into a view.

**Explores** - Explores define which views will be shown in the Explore menu at the top of Looker. You can also define join relationships between multiple views to create explores that contain information from multiple views.

**Models** - Models are the place where you will define your explores. In *general* you'll have one model per database. However, models can be used to control various types of data access, so you might break this rule. You can read more about that topic on our [Access Control and Permission Management](https://docs.looker.com/admin-options/tutorials/permissions) docs page.<br /><br />



<h2 style="color:rgb(100,81,138)">Where are These Structures Defined?</h2>

**Fields** live inside of views.

**Views** are stored in view files, which you'll see listed on the left hand side of this page. Techncially speaking you can define more than one view inside a single view file, but we discourage it because it can be hard to find things. Similarly, we suggest that you name your view files according to the view that's inside them. Feel free to check out the <a href="https://learn.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> view file if you want to see what a view - and its fields - looks like. We'll explain all of their contents in subsequent lessons.

**Explores** live inside of models.

**Models** are stored in model files, which you'll also see listed on the left hand side of this page. By definition, there is only one model per model file. This is because you create a model by creating its file. The model name is the name of the file. Feel free to check out the <a href="https://learn.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> model file if you want to see what a model - and its explores - looks like. We'll explain all of their contents in subsequent lessons.<br /><br />



<h2 style="color:rgb(100,81,138)">Next Step</h2>

Let's start by looking at the basics of views.

<div style="float:right;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/02_view_basics.md">View Basics &#10095;</a>
</div>
