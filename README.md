# azazel-parity-microzig

[microzig](https://github.com/ZigEmbeddedGroup/microzig)'s `flags` parser
(`tools/flags`, std-only) built two ways, to prove and compare
[azazel](https://github.com/godofecht/azazel) and
[zaza](https://github.com/godofecht/zaza).

Both build a consumer that parses `--name=zaza` into a `Flags` struct, on Zig
`0.17.0-dev.892` (microzig's toolchain family). azazel reaches it through its
`"0.17"` lane. Neither vendors microzig's source; each stages the single
`tools/flags/src/root.zig` file at a pinned commit.

## Pinned upstream

| | |
|---|---|
| Repository | https://github.com/ZigEmbeddedGroup/microzig |
| Commit | `aabcd3e1824adac6aa3feca8023d50ee0ccbf8fc` |
| File | `tools/flags/src/root.zig` |
| Zig | `0.17.0-dev.892+54537285c` |

## Build it

```sh
cd azazel && ./fetch.sh && sh gen_build_spec.sh && zig build && ./zig-out/bin/consumer
cd zaza  && ./fetch.sh && zig build run
```

Both print `microzig flags: name=zaza verbose=false`.

## Comparison

Clean-cache builds with dependencies pre-fetched, Apple Silicon, fastest of two runs.


| Build | Clean build | Config |
|-------|-------------|--------|
| azazel | 3.4 s | `project.cue` — 14 lines · 429 B |
| zaza | 3.1 s | `build.zig` — 13 lines · 825 B |

The upstream's full build is not reproduced here (see the note below), so no native time is listed.

**Another tiny std-only consumer where zaza's dozen lines are smaller than the CUE; microzig's full embedded build is not reproduced here.**

