# CSS Fundamentals
Today we're going to dive into the front end and learn how to make websites and apps look pretty using industry-standard conventions and tools.

## SWBATs 
- Identify inline, internal, and external stylesheets
- Apply class, id, and element selectors, and understand how CSS specificity affects the page view
- Describe the box model to adjust element styling
- Create page layouts using CSS grid
- Learn how to integrate CSS frameworks like Semantic UI and Bootstrap via CDN

---

## Helpful To Install (VSCode)

- [HTML Snippets](https://marketplace.visualstudio.com/items?itemName=abusaidm.html-snippets)
- [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)

Another DOPE aid when learning CSS is my fav site, [CSS-Tricks](https://css-tricks.com/). 

---

### What is CSS? 
`CSS (Cascading Style Sheets)` is NOT a programming language- it's a stylesheet or styling language that allows you to provide a look and feel for content that exists on an HTML document. CSS is primarily used for layout and design, and comes with a number of preprocessors, postprocessors, libraries, and frameworks to extend its functionality and usage. 

CSS is comprised of selectors with certain attributes that change the way an HTML element looks on a document. 


### CSS Usage

There are three main ways that you can use CSS within your website/application: 

`Inline Style:` Including CSS styling within HTML markup on the element that needs styling. 


```html 
<div style="color:purple;">
```

Inline style is frowned upon because it has been generally accepted to be bad practice. It's not a scalable solution and involves more coding than necessary. It also does not follow the single responsibility principle. 


`Internal Style:` Uses style tags within HTML markup to define styling for one file. Usually added in the head. 

```html
<html>

    <head>
        <style>
            h1 {color:red;}
            p {color:brown;}
        </style>
    </head>

    <body>
        <h1>I Like Big Books</h1>
        <p>And I cannot lie. Those other brothers can deny.</p>
    </body>

</html>
```

This solution is more efficient than inline styles, but adds more coding, time to load, and makes each page of your app less DRY by comparison, as you may possibly add the same code to multiple pages. 


`External Style:` Uses an externally located stylesheet (or relative path) that encapsulates all of the styling information for your website or application. 

```html
<link rel="stylesheet" type="text/css" href="main.css">
```

This is the best solution for maintaining styling within your website or application. It keeps styles separate from HTML and follows the single responsibility principle. It's easier to read and reuse throughout your site/app. 

---

### CSS Definitions

`selector:` Points to the HTML element that you want to style.

![Parts of a Selector](https://puzzleweb.ru/en/images/css/1_1.png)

`declaration:` The statement that you create to give styling to an element.

`class selector:` Defines one or more elements with the styling included within. Indicated by the (.).

```html
 <!--HTML-->
<div class="bling">
```

```css
.bling {
    color: yellow; 
    font-size: 12px;
}
```

`id selector:` Uses the `id` attribute to define styling for ONE element. Indicated by the (#).

```html
 <!--HTML-->
<div id="bling", class="rap">
```

```css
/* ID */
#bling {
    color: #000; 
    font-size: 50px;
}

/* CLASS */
.rap {
    text-align: center;
}
```

`element selector:` Styles the particular element indicated across all files with a stylesheet included.

```html
 <!--HTML-->
<p class="bling">Every time I come around the city, bling bling.</p>
```

```css
p {
    color: red; 
    font-size: 12px;
}
```

`CSS Sizing:` Sizing in CSS can be determined by absolute (ties to physical units of length) or relative (relative to another length value) size units. 

- px (pixels): absolute unit that directly aligns to a real life length measurement. 
- em: relative unit that lets you change text size relative to text size in the parent element.

 ```css
 body {
     font-size: 20px;
     /* line-height = 10px */
     line-height: 0.5em; 
 }
 ```

`CSS colors:` Can be used to give color to an element in (typically) three ways: 

-  HTML Color Names: 140 defined colors by name
- Hexadecimal (hex) Values: starts with #, 3-6 letters/numbers
- rgb/rgba: Red, Green, Blue(rgb)- the values range from 0-255. Red, Green, Blue, Alpha (rgba) adds an alpha value to be manipulated that offers transparency. 

You can see all of the colors and gain the color name, hex code, and rgb [here.](https://htmlcolorcodes.com/)


`CSS Fonts:` The CSS font properties define the font family, boldness, size, and style of a text. [Here's](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Fonts) a resource to help understand what you can do with font.

The font family of a text is set with the `font-family` property. The `font-family` property should hold several font names as a "fallback" system. If the browser does not support the first font, it tries the next font, and so on.

```css
font-family: Arial, Helvetica, sans-serif;
```

---

### CSS Box Model & CSS Grid 

There are many ways to create layouts for your app views or website that take into consideration the user experience, performance, and more. Learn about how elements are presented within a document and how you can use techniques to build awesome websites! 

#### CSS Box Model

The CSS box model is a container which holds multiple properties including borders, margin, padding and the content itself. It's used to create the design and layout of web pages. 

Each element is represented as a box with four areas, and with CSS we can style each area of the box. 

![CSS Box Model](https://www.washington.edu/accesscomputing/webd2/student/unit3/images/boxmodel.gif)

---

`Content:` contains the stuff we are writing/creating. The content area's size can be explicitly defined with the `width`, `min-width`, `max-width`, `height`, `min-height`, and `max-height` properties.

---

`Padding:` Like a pillow over the content, the padding extends the white space around the content area.

The thickness of the padding is determined by the `padding-top`, `padding-right`, `padding-bottom`, `padding-left`, and shorthand padding properties.

---

`Border:` Stops the extension of the content and padding areas. Usually indicated by a line around the box. 

The thickness of the borders are determined by the `border-width` and shorthand border properties. If the `box-sizing` property is set to `border-box`, the border area's size can be explicitly defined with the `width`, `min-width`, `max-width`, `height`, `min-height`, and `max-height` properties.

---

`Margin:` White space between the border and element used to separate the element from others. 

The size of the margin area is determined by the `margin-top`, `margin-right`, `margin-bottom`, `margin-left`, and shorthand margin properties.

---

Learn more about the box model [here.](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model)


#### CSS Grid

In the past, we used a ton of hack-y techniques like tables and floats to create grid-based websites. A new system called Flexbox ruled supreme for a while, but its one-dimensional approach proved limited. 

While these solutions worked for a time, they proved to be inefficient and not standard. 

ENTER, CSS Grid.

![Yes](https://bit.ly/2Pt8Qat)

CSS Grid is the very first CSS module created specifically to solve the layout problems we've all been hacking our way around for as long as we've been making websites.


##### How to Use CSS Grid 

To get started, you have to define a container element as a grid with `display: grid`, set the column and row sizes with `grid-template-columns` and `grid-template-rows`, and then place its child elements into the grid with `grid-column` and `grid-row`.

---

See visual representations of CSS grid at work, basic terminology, and a dictionary [here](https://css-tricks.com/snippets/css/complete-guide-grid/). 

---

#### Adding External Stylesheets 

Just like you've seen in our Rails practice, you can include external CSS stylesheets like Bootstrap and Semantic UI by grabbing their CDN from their website: 

```html
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
```

Add this link to the `head` of your file and you can use all of the styling included within, like classes and ids. Typically, there's extensive documentation that will show you exactly what is available to you (components, navbars, buttons, etc). This is a great way to have a nicely styled app while focusing on performance and functionality.

---

### Let's Practice! 

Fork and clone this repo to build out your own CSS website.

