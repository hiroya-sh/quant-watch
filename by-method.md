# By method

量子化手法別。手法の系譜を追うのに使う。

```dataview
TABLE WITHOUT ID
  file.link AS "Title",
  type AS "Type",
  join(models, ", ") AS "Models",
  priority AS "Pri",
  discovered AS "Date"
FROM "items"
FLATTEN methods AS method
WHERE method
SORT method ASC, discovered DESC
GROUP BY method
```
