<h1 style="color:rgb(100,81,138)">Model Basics</h1>

In LookML, the primary function of a **model** is to house **explores**, and to define certain high-level settings such as what database connection should be used. We'll talk about explores in the next lesson, and focus on the model-level settings here.

Unlike the LookML items you've seen so far, there is no parameter to create a model. Instead, a model is created by adding a model file. In this case, you'll see a single model file called <a href="https://learn.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> on the left hand side of the screen, under the "Models" section.<br /><br />



<h2 style="color:rgb(100,81,138)">Anatomy of a Model</h2>

You'll see that the top of our <a href="https://learn.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> model file looks like this:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> Model File</a>
</div>
```
connection: "thelook_events"
include: "*.view.lkml"
```
<a style="color:rgb(32,165,222);font-size:12px;margin-right:20px;" href="https://docs.looker.com/reference/model-params/connection-for-model" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>connection</b> Docs</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://docs.looker.com/reference/model-params/include" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>include</b> Docs</a><br /><br />

If we break this down:

+ The first row `connection: "thelook_events"` determines which database connection this  model will query. Database connections are set up by Looker admins, and you can read about them in our [Connections](https://docs.looker.com/admin-options/database/connections) docs page.

+ The second row `include: "*.view.lkml"` makes all of the view files in this project available to the model. You'll notice we're using the wildcard `*` to do this, but if you only want certain view files included, you could list the files individually on multiple rows like `include: "orders.view.lkml"`.

You’ll notice there are a lot of explores defined within the model, but we’ll discuss those separately in our [next lesson](https://learn.looker.com/projects/e-commerce/files/12_explore_basics.md).<br /><br />



<h2 style="color:rgb(100,81,138)">Other Model Settings</h2>

All of the additional model level settings that you can apply in LookML can be found on our [Model Parameters](https://docs.looker.com/reference/model-reference) docs page.<br /><br />



<h2 style="color:rgb(100,81,138)">Next Step</h2>

Next, we'll look at creating explores, which make models useful.

<div style="float:left;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/10_measure_options.md">&#10094; Measure Options</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn.looker.com/projects/e-commerce/files/12_explore_basics.md">Explore Basics &#10095;</a>
</div>