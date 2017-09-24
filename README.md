# iThoughts-Search

A bash command for searching content from multi iThoughts (.itmz) files.

## TOC

<!-- MarkdownTOC GFM -->

- [Dependencies](#dependencies)
- [Install](#install)
- [Usage](#usage)
- [Environment Variables](#environment-variables)
- [Example](#example)
- [Versioning](#versioning)
- [Copyright and License](#copyright-and-license)

<!-- /MarkdownTOC -->


## Dependencies

- GNU bash, 4.4.12(1)-release or above
- .itmz files must be created by iThoughts 4.12 or above
- [`ag`](https://github.com/ggreer/the_silver_searcher)
- `realpath`, which installed by `brew install coreutils`
- `cksum`, system default

## Install

1. `git clone https://github.com/adoyle-h/iThoughts-Search <repo-path>`
2. `echo "ITMZ_DIR=<your-itmz-files-dir>" >> ~/.bashrc`
    - ITMZ_DIR: all your .itmz files should be put under this path.
3. `ln -s <repo-path>/bin/itmz-search /usr/local/bin/itmz`


TODO: Available as a [bpkg](http://www.bpkg.sh/)

```sh
bpkg install adoyle/iThoughts-Search
```

## Usage

- `itmz` or `itmz -h` to display command helps
- `itmz <pattern> [dir]` to search contents with `ag` from all .itmz files stored in specific directory.

## Environment Variables

```sh
# all your .itmz files should be put under this path.
ITMZ_DIR=${ITMZ_DIR:?}
# iThoughts-Search caches and logs will be put under the ITMZ_HOME
ITMZ_HOME=${ITMZ_HOME:-$HOME/itmz}
```

## Example

## Versioning

The versioning follows the rules of SemVer 2.0.0.

**Attentions**: anything may have **BREAKING CHANGES** at **ANY TIME** when major version is zero (0.y.z), which is for initial development and the public API should be considered unstable.

For more information on SemVer, please visit http://semver.org/.


## Copyright and License

Copyright (c) 2017 ADoyle. The project is licensed under the **Apache License Version 2.0**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.


<!-- Links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
