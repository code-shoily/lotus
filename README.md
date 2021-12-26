# Lotus

Lotus is a [Surface UI](https://surface-ui.org/) wrapper for [UIKit](https://getuikit.com/). Make good looking UIs in LiveView + SurfaceUI + (a little) JavaScript.

## How to run?

* Install the deps with `mix deps.get`
* Install the JS libs with `cd assets; yarn`
* Get back to the project directory (i.e. Type `cd ..` if you're still inside `assets` from the previous step)
* `mix esbuild.install` to install esbuild.
* `mix esbuild default` to get the assets in the `catalogue` repository.
* `mix dev` to run the development server for the catalogue
* Make changes to the components and test the API out in `http://localhost:4001` via examples or playgrounds.

All components are under the `Lotus` section.

This has been tested with Phoenix 1.6.x and Elixir 1.13.x with OTP 24.

## Install in Phoenix

* This module uses hooks and registers them. To use with Phoenix, add `{:lotus, path: "<path of this>" }` and also add `:surface` to the `compilers` in `mix.exs`.

* Install UIKit using your preferred method (either CDN, npm or Esbuild). 

* Import the components in your live view!

## Example

This library wraps UIKit 3 with SurfaceUI. They are a set of Surface components that allow you to use those components without using any JavaScript. For example, the following snippet produces accordion:

```
<Accordion id="accordion">
    <AccordionItem title="Section 1">
        Lorem Ipsum
    </AccordionItem>
    <AccordionItem title="Section 2">
        Lorem Ipsum
    </AccordionItem>
    <AccordionItem open title="Section 3">
        Lorem Ipsum
    </AccordionItem>
    <AccordionItem title="Section 4">
        Lorem Ipsum
    </AccordionItem>
</Accordion>
```

## How to make a new component?

Ideally, the method to make a new component is to create an Elixir file `lotus/<component.ex>` along with the test file and entries in the catalogue. There are three types of component a component can be of-

* `Lotus.SimpleComponent` - Components that are simple, use mostly padding, margin, text etc
* `Lotus.Component` - Components that take a little more than Simple ones like width, border-radius etc
* `Lotus.ContainerComponent` - Components that are mostly containers, as such have grid and flex capabilities

Depending on the capability we wish to have for our component, it can `use` either. For example, a `Progress` is a `SimpleComponent` but a `Card` is a `ContainerComponent`.

Each of these components have multiple `Props`. A `Prop` module is a set of module that other components can `use`. They are listed under `lotus/props` directory. Props examples could be `Padding`, `Margin`, `Background`, `Text`. A component having `Text` props will be empowered with various text helper properties such as `font_size`, `text_align` etc, and as such, upon filling up those props, will acquire the `UIkit` classes that facilitate those.

Different components can be a sum-total of these props.

## Thank You!

- SurfaceUI - https://surface-ui.org/
- Surface Catalogue - https://github.com/surface-ui/surface_catalogue
- Surface Bulma - https://github.com/surface-ui/surface_catalogue I got a lot of inspiration from this one! I've been wanting to make something like this since I knew of it!
- Surface Bootstrap - https://github.com/surface-ui/surface_bootstrap thanks to this project, I learned how to run Catalogue server, and also gained confidence in structuring components.

