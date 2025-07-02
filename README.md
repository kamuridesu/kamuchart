# Kamuchart

This is a simple chart for my projects. It may change a lot, so be aware to always check the CHANGELOG.md file.

I also recommend you to read the `./kamuchart/values.yaml` file, it has comments about every field.

Exemples are in `kamuchart/examples`.

## Purpose

I've created this chart to manage my applications and make my deploys easier.

One of the features of this chart is the ability to generate StatefulSets which I use for some extent on my projects.

## Generating examples

To generate manifests files using the example values, just run:

```sh
helm template test ./kamuchart -f ./kamuchart/examples/deployment.values.yaml
```
