# By model

各モデルでヒットしたアイテムを最新順で並べる。

```dataview
TABLE WITHOUT ID
  file.link AS "Title",
  type AS "Type",
  join(methods, ", ") AS "Methods",
  priority AS "Pri",
  discovered AS "Date"
FROM "items"
FLATTEN models AS model
WHERE model
SORT model ASC, discovered DESC
GROUP BY model
```

## 特定モデルだけ見たい時の例

```dataview
TABLE WITHOUT ID
  file.link AS "Title",
  join(methods, ", ") AS "Methods",
  priority AS "Pri",
  discovered AS "Date"
FROM "items"
WHERE contains(string(models), "google/gemma-4")
SORT discovered DESC
```
