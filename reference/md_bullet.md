# Markdown bullet point list

Creates a bullet point list in markdown format. Copy of
`gluedown::md_bullet()` but with the added ability to specify an indent
to create nested lists and the option to use code font.

## Usage

``` r
md_bullet(
  x,
  indent = 0,
  code = FALSE,
  italic = FALSE,
  marker = c("*", "-", "+")
)
```

## Arguments

- x:

  character (vector). Text to convert into a bullet point list.

- indent:

  numeric, positive whole number. Number of spaces to indent the bullet
  point list by (Default: 0).

- code:

  logical. If the text will be formatted as code (Default: TRUE).

- italic:

  logical. If the text will be formatted as italic (Default: FALSE).

- marker:

  character. The bullet list marker to use (Default: "\*").

## Value

`glue` vector. A bullet point list in markdown format.

## Examples

``` r
md_bullet(c("First item", "Second item", "Third item"), code = TRUE)
#> * `First item`
#> * `Second item`
#> * `Third item`

md_bullet(c("First item", "Second item", "Third item"), indent = 2)
#>   * First item
#>   * Second item
#>   * Third item
```
