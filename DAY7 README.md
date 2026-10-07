Day7 Tasks 

- XLOOKUP
- =XLOOKUP(lookup_value, lookup_array, return_array, [if_not_found], [match_mode], [search_mode])
  It is used to find something in one column and return corresponding information from another column.

- INDEX+MATCH
- =INDEX(array, row_num, [column_num])
- =MATCH(lookup_value, lookup_array, [match_type])
- =INDEX(return_range, MATCH(lookup_value, lookup_range, 0))
  It is a another way to perform lookups

- Left
- =LEFT(text, [num_chars])
  Takes character from the left side

- Right
- =RIGHT(text, [num_chars])
  Takes character from the right side

- MID
- =MID(text, start_num, num_chars)
  Takes character from the mid

- LEN
- =LEN(text)
  gives the length of the character

- TRIM
- =TRIM(text)
  Removes unnecessary sapces

- CLEAN
- =CLEAN(text)
  Removes unwanted characters

- CONCAT
- =CONCAT(text1, [text2], ...)
 Combines the text

- TEXTJOIN
- =TEXTJOIN(delimiter, ignore_empty, text1, [text2], ...)
  it also combines texts but is especially used when combining multiple cells with a separator

- Date function
- =DATE(year, month, day)
- =TODAY()
- =NOW()
- =YEAR(date)
- =MONTH(date)
- =DAYS(end_date, start_date)
   DATE, TODAY, NOW, YEAR, MONTH, DAY

- Error Handling
- =IFERROR(value, value_if_error)
  IFERROR is uses when we want to CUSTOMIZE the error name
