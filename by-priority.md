# By priority

priority=high のものを上に。読む優先順位の決定に使う。

```dataview
TABLE WITHOUT ID
  file.link AS "Title",
  type AS "Type",
  join(models, ", ") AS "Models",
  join(methods, ", ") AS "Methods",
  discovered AS "Date"
FROM "items"
WHERE priority = "high"
SORT discovered DESC
```

## Normal

```dataview
TABLE WITHOUT ID
  file.link AS "Title",
  type AS "Type",
  join(models, ", ") AS "Models",
  join(methods, ", ") AS "Methods",
  discovered AS "Date"
FROM "items"
WHERE priority = "normal"
SORT discovered DESC
```

## Watching

```dataview
TABLE WITHOUT ID
  file.link AS "Title",
  type AS "Type",
  join(methods, ", ") AS "Methods",
  discovered AS "Date"
FROM "items"
WHERE priority = "watching"
SORT discovered DESC
```
