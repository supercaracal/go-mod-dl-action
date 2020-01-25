Executable Go module file download action ![](https://github.com/supercaracal/go-mod-dl-action/workflows/CI/badge.svg)
==========================

This action download a executable Go module file via GitHub release assets.

## Inputs

### `url`

**Required** URL of the GitHub release asset file.

## Outputs

### `file`

A executable file of the Go module.

## Example usage

```
uses: supercaracal/go-mod-ins-action@v1
with:
  url: "https://github.com/${user}/${repository}/releases/download/${version}/${package}_${GOOS}_${GOARCH}.tar.gz"
```

## See also
[Automating your workflow with GitHub Actions](https://help.github.com/en/actions/automating-your-workflow-with-github-actions)
