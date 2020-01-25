Go module installer action ![](https://github.com/supercaracal/go-mod-ins-action/workflows/CI/badge.svg)
==========================

This action download a Go module via GitHub release assets and install a execution file.

## Inputs

### `url`

**Required** URL of the GitHub release asset file.

## Outputs

### `file`

A execution file of the module.

## Example usage

```
uses: supercaracal/go-mod-ins-action@v1
with:
  url: "https://github.com/${user}/${repository}/releases/download/${version}/${package}_${GOOS}_${GOARCH}.tar.gz"
```

## See also
[Automating your workflow with GitHub Actions](https://help.github.com/en/actions/automating-your-workflow-with-github-actions)
