# By tech element

技術要素別。KV cache quant、rotation、microscaling などの軸で並べる。

```dataview
TABLE WITHOUT ID
  file.link AS "Title",
  type AS "Type",
  join(methods, ", ") AS "Methods",
  join(models, ", ") AS "Models",
  priority AS "Pri",
  discovered AS "Date"
FROM "items"
FLATTEN tech AS t
WHERE t
SORT t ASC, discovered DESC
GROUP BY t
```
