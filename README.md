# Instructions
To add a new blog post, you have to add a file to the directory content/posts.
As an example there is the file my-first-post.md.
A file always has to have a "title" and a "date".
"description", "categories" and "tags" are optional.

```markdown
---
title: "Hello Hugo!"
description: "Saying 'Hello' from Hugo"
date: "2014-09-01"
categories:
  - "example"
  - "hello"
tags:
  - "example"
  - "hugo"
  - "blog"
---
```

To generate everything, you have to install hugo following the instructions on [Quickstart](https://gohugo.io/getting-started/quick-start/).
You also have to install [git](https://www.git-scm.com).
When you have installed git, you have to checkout your blog and your user site repository.

After you have installed hugo and git and did a checkout of your repositories, you can execute the file [deploy.sh](./deploy.sh), which will call hugo to generate the pages and commits and push the changes.

**Please do not commit files in the directory ./public**
