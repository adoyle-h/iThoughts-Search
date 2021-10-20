# iThoughts-Search

A bash command for searching content from multi iThoughts (.itmz) files.

## TOC

<!-- MarkdownTOC GFM -->

- [Dependencies](#dependencies)
- [Install](#install)
- [Usage](#usage)
- [Environment Variables](#environment-variables)
- [Example](#example)
- [Auto-Completion](#auto-completion)
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

```sh
# git clone the source code
src_dir=
git clone https://github.com/adoyle-h/iThoughts-Search "$src_dir"
# ITMZ_DIR: all your .itmz files should be put under this path.
export ITMZ_DIR=
# iThoughts-Search caches and logs will be put under the ITMZ_HOME
export ITMZ_HOME=${ITMZ_HOME:-$HOME/.itmz}

cat >> ~/.bashrc <<EOF
export ITMZ_DIR=$ITMZ_DIR
export ITMZ_HOME=$ITMZ_HOME
EOF

ln -s "$src_dir/bin/itmz-search" /usr/local/bin/itmz
```

## Usage

- `itmz` or `itmz -h` to display command helps
- `itmz <pattern> [dir]` to search contents with `ag` from all `.itmz` files stored in specific directory.
  - The search pattern is case-insensitive
  - If `dir` is omit, it will search all `.imtz` files in `$ITMZ_DIR`. Otherwise, it will search files in `$ITMZ_DIR/$dir`.
  - Each search will generator cache to speed up for next search in ITMZ_REF_DIR which is `$ITMZ_HOME/refs`.
  - Each search will auto-update cache if the file has been modified.
  - If you really worry about the cache-refreshing, use `itmz --cache-clean` to clean all caches.
- `itmz -l <pattern> [dir]` to search matched filepaths with `ag` from all .itmz files stored in specific directory.

## Environment Variables

```sh
# all your .itmz files should be put under this path.
ITMZ_DIR=${ITMZ_DIR:?}
# iThoughts-Search caches and logs will be put under the ITMZ_HOME
ITMZ_HOME=${ITMZ_HOME:-$HOME/itmz}
```

## Example

## Auto-Completion

```sh
# For bash
source <(itmz --completion)

# or add it to your .bashrc to make it persist
echo "source <(itmz --completion)" >> ~/.bashrc && source ~/.bashrc
```

## Versioning

The versioning follows the rules of SemVer 2.0.0.

**Attentions**: anything may have **BREAKING CHANGES** at **ANY TIME** when major version is zero (0.y.z), which is for initial development and the public API should be considered unstable.

For more information on SemVer, please visit http://semver.org/.


## Copyright and License

Copyright (c) 2017-2021 ADoyle. The project is licensed under the **Apache License Version 2.0**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.


<!-- Links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
