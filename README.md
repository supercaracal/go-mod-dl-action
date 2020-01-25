Executable Go module file download action ![](https://github.com/supercaracal/go-mod-dl-action/workflows/CI/badge.svg)
==========================

This action download a executable Go module file via GitHub release assets.

## Inputs

### `url`

**[Required]** URL of the GitHub release asset file.

## Outputs

### `file`

A executable file of the Go module.

## Example usage

```yaml
- name: Get bin file
  uses: supercaracal/go-mod-ins-action@v1
  with:
    url: "https://github.com/${user}/${repository}/releases/download/${version}/${package}_${GOOS}_${GOARCH}.tar.gz"
  id: get-bin

- name: Set up Go
  uses: actions/setup-go@v1
  with:
    go-version: "1.13"

- name: Add $GOPATH/bin to $PATH
  run: |
    mkdir -p $(go env GOPATH)/bin/
    echo "::add-path::$(go env GOPATH)/bin"

- name: Install
  run: mv ${{ steps.get-bin.outputs.file }} $(go env GOPATH)/bin/
```

## See also
[Automating your workflow with GitHub Actions](https://help.github.com/en/actions/automating-your-workflow-with-github-actions)
