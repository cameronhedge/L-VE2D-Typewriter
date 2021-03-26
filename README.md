# LOVE2D-Typewriter

This is a simple typewriter class that works with Matthias Richter's 'Class' module within Hump. The typewriter has a built in feature to wrap the text in a given width.

[Link to Hump Module](https://github.com/vrld/hump)

## Typewriter (xpos, ypos, text, width, linespacing, font)

Creates text just like normal within the LOVE2D window however it is displayed as if written on a typewriter.

### Parameters

* *Number* **xpos, ypos**

  Where to display the text on screen.

* *String* **Text**

  Text that requires typing.

* *Number* **width**

  This is the required width that the text should be span across. Also determines when to wrap the text to the next line.
  
* *Number* **Linespacing**

  Amount of spacing between each wrapped line of text.

* *Font Object* **Font**

  Required text font.

### Example

`typewriter = Typewriter(10, 20, "This is a typewriter test.", 100, 15)`

### Writing to Screen

The typewriter can then be drawn on the screen using the familiar update and render methods.

```
love.update(dt)
  typewriter:update(dt)
end
```
```
love.draw()
  typewriter:render()
end
```
