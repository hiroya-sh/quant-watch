# 全アイテム

最新順。Obsidianの検索ボックスでさらに絞れる。

```dataview
TABLE WITHOUT ID
  file.link AS "Title",
  type AS "Type",
  join(models, ", ") AS "Models",
  join(methods, ", ") AS "Methods",
  priority AS "Pri",
  discovered AS "Date"
FROM "items"
SORT discovered DESC
```
