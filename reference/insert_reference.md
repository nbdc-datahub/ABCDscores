# Insert references into help files

Inserts references into help files in markdown format. The function
takes the a single score name and returns the reference in markdown
format.

## Usage

``` r
insert_reference(name, tbl_ref_name = "tbl_ref")
```

## Arguments

- name:

  character, The name of the score to insert the reference for.

- tbl_ref_name:

  character, The name of the reference table object in the environment.

## Value

character (vector). The reference in markdown format.

## Details

It is expected to have a table with the following columns in
environment:

- `name`: The name of the scores

- `authors`: The authors of the paper

- `year`: The year of publication

- `title`: The title of the paper

- `journal`: The journal where the paper was published

- `volume_page`: The volume and page number of the paper, optional, can
  be `""` if not available

- `doi`: The DOI of the paper, optional, can be `""` if not available

## Examples

``` r
tbl_ref <- tibble::tibble(
  name = c("score1", "score1", "score2"),
  authors = c(
    "Smith, B., Jones, A.",
    "Simon, J., Norman, D. A.",
    "Smith, B., Jones, A., Simon, J., Norman, D. A."
  ),
  year = c(2020, 2021, 2022),
  title = c(
    "Title of the First Paper",
    "Title of the Second Paper",
    "Title of the Third Paper"
  ),
  journal = c("Journal A", "Journal B", "Journal C"),
  volume_page = c("1(1): 1-10", "", "3(3): 21-30"),
  doi = c("https://10.1234/abc", "https://10.1234/def", "")
)
insert_reference("score1")
#> * Smith, B., Jones, A. (2020). Title of the First Paper. _Journal A_, 1(1): 1-10. <https://10.1234/abc>.
#> * Simon, J., Norman, D. A. (2021). Title of the Second Paper. _Journal B_. <https://10.1234/def>.
```
