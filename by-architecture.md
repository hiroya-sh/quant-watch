# By architecture

アーキテクチャ別の量子化動向。Mamba / GLA / hybrid の事例を追うのに使う。

```dataview
TABLE WITHOUT ID
  file.link AS "Title",
  type AS "Type",
  join(models, ", ") AS "Models",
  join(methods, ", ") AS "Methods",
  priority AS "Pri",
  discovered AS "Date"
FROM "items"
FLATTEN architectures AS arch
WHERE arch
SORT arch ASC, discovered DESC
GROUP BY arch
```
