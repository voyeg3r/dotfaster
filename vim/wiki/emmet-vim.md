# File:	emmet-vim.md - Last Change: 2017 dez 27 14:57
+ https://github.com/mattn/emmet-vim/blob/master/TUTORIAL

emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet. (it is similar to sparkup)

Type ("_" is the cursor position):

    html:5_

Then type `<c-y>,` (Ctrly,), and you should see:

    <!DOCTYPE HTML>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        _
    </body>
    </html>

Type

    div>p#foo$*3>a

    <div>
        <p id="foo1"><a href=""></a></p>
        <p id="foo2"><a href=""></a></p>
        <p id="foo3"><a href=""></a></p>
    </div>

# Wrap with an Abbreviation

Write as below.

    ---------------------
    test1
    test2
    test3
    ---------------------

Then do visual select(line wise) and type '<c-y>,'.
Once you get to the 'Tag:' prompt, type 'ul>li*'.

    ---------------------
    <ul>
        <li>test1</li>
        <li>test2</li>
        <li>test3</li>
    </ul>
    ---------------------
